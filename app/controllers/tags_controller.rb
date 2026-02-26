class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tags_path, notice: "Tag was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to tags_path, notice: "Tag was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy
    redirect_to tags_url, notice: "Tag was successfully deleted."
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash[:alert] = "Tag not found."
    redirect_to tags_url
  end
end
