class EmotionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_emotion, only: [:show, :edit, :update, :destroy]
  before_action :authorize_emotion_owner!, only: [:edit, :update, :destroy]

  def index
    @emotions = current_user.emotions.order(created_at: :desc)
  end

  def show
  end

  def new
    @emotion = current_user.emotions.build
  end

  def create
    @emotion = current_user.emotions.build(emotion_params)

    if @emotion.save
      redirect_to @emotion, notice: "Emotion was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @emotion.update(emotion_params)
      redirect_to @emotion, notice: "Emotion was successfully updated."
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
    @emotion = current_user.emotions.find(params[:id])
  end

  def authorize_emotion_owner!
    unless @emotion.user == current_user
      flash[:alert] = "You don't have permission to access this emotion."
      redirect_to emotions_path
    end
  end

  def emotion_params
    params.require(:emotion).permit(:name, :color)
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash[:alert] = "Emotion not found."
    redirect_to emotions_path
  end
end
