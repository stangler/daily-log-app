class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  def index
    @reports = current_user.reports.order(created_at: :desc)
  end

  def show
  end

  def new
    @report = current_user.reports.build
  end

  def create
    @report = current_user.reports.build(report_params)

    if @report.save
      redirect_to @report, notice: "Report was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to @report, notice: "Report was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_url, notice: "Report was successfully deleted."
  end

  private

  def set_report
    @report = current_user.reports.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content, :emotion_id, :image, :tag_list)
  end
end