class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    # Emotion timeline data: reports grouped by day and emotion
    @emotion_timeline_data = current_user.reports
      .group_by_day(:created_at, format: "%Y-%m-%d")
      .group(:emotion_id)
      .count

    # Tag distribution data: count of reports per tag
    @tag_distribution_data = current_user.reports
      .joins(:tags)
      .group("tags.name")
      .count

    # Get emotion names for chart labels
    @emotion_names = Emotion.where(id: @emotion_timeline_data.keys.map(&:last)).pluck(:id, :name).to_h

    # Get all emotions for complete timeline
    @all_emotions = Emotion.all
    @emotion_colors = @all_emotions.pluck(:id, :color).to_h

    # Pre-calculate chart data
    @emotion_timeline_chart_data = emotion_timeline_chart_data
    @tag_distribution_chart_data = tag_distribution_chart_data
  end

  private

  def emotion_timeline_chart_data
    # Format data for line chart: { emotion_name: { date: count, ... }, ... }
    result = {}

    @emotion_timeline_data.each do |(date, emotion_id), count|
      emotion_name = @emotion_names[emotion_id] || "Emotion #{emotion_id}"
      result[emotion_name] ||= {}
      result[emotion_name][date] = count
    end

    result
  end

  def tag_distribution_chart_data
    # Format data for pie chart: { tag_name: count, ... }
    @tag_distribution_data
  end
end
