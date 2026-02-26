class EmotionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_emotion, only: [:show, :edit, :update, :destroy]

  def index
    @emotions = Emotion.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @emotion = Emotion.new
  end

  def create
    @emotion = Emotion.new(emotion_params)

    if @emotion.save
      redirect_to emotions_path, notice: "Emotion was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @emotion.update(emotion_params)
      redirect_to emotions_path, notice: "Emotion was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @emotion.destroy
    redirect_to emotions_url, notice: "Emotion was successfully deleted."
  end

  private

  def set_emotion
    @emotion = Emotion.find(params[:id])
  end

  def emotion_params
    params.require(:emotion).permit(:name, :color)
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash[:alert] = "Emotion not found."
    redirect_to emotions_url
  end
end
