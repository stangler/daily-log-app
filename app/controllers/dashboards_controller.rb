class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @emotion_timeline_data = current_user.reports
      .group_by_day(:created_at, format: "%Y-%m-%d")
      .group(:emotion_id)
      .count

    @tag_distribution_data = current_user.reports
      .joins(:tags)
      .group("tags.name")
      .count

    @emotion_names = Emotion.where(id: @emotion_timeline_data.keys.map(&:last)).pluck(:id, :name).to_h
    @all_emotions = Emotion.all
    @emotion_colors = @all_emotions.pluck(:id, :color).to_h

    @emotion_timeline_chart_data = emotion_timeline_chart_data
    @tag_distribution_chart_data = tag_distribution_chart_data
  end

  private

  def emotion_timeline_chart_data
    result = {}

    @emotion_timeline_data.each do |(date, emotion_id), count|
      emotion_name = @emotion_names[emotion_id] || "Emotion #{emotion_id}"
      result[emotion_name] ||= {}
      result[emotion_name][date] = count
    end

    # chartkick.js 5.0.1 が期待する配列形式に変換
    result.map do |name, data|
      { name: name, data: data }
    end
  end

  def tag_distribution_chart_data
    @tag_distribution_data
  end
end
