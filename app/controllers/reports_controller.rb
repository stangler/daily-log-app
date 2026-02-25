class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authorize_report_owner!, only: [:edit, :update, :destroy]

  def index
    @q = current_user.reports.ransack(params[:q])
    @reports = @q.result(distinct: true).order(created_at: :desc)
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

  def authorize_report_owner!
    unless @report.user == current_user
      flash[:alert] = "You don't have permission to access this report."
      redirect_to reports_path
    end
  end

  def report_params
    params.require(:report).permit(:title, :content, :emotion_id, :image, :tag_list)
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash[:alert] = "Report not found."
    redirect_to reports_path
  end
end
