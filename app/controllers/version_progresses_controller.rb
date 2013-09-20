class VersionProgressesController < ApplicationController
  include VersionProgressesHelper
  unloadable

  def index
    if params[:project_id]
      @version = Project.first(:order => 'name asc').versions.last
      redirect_to version_progress_url(@version)
    else
      @projects = Project.visible.all(:order => 'name asc')
    end
  end


  def show
    if params[:project_id]
      @project = Project.find(params[:project_id])
    end

    @version = params[:version_id] ? Version.find(params[:version_id]) : Version.find(params[:id])
    @project ||= @version.project

    @projects = Project.visible.all(:order => 'name asc')
    @versions = @project.versions(:order => 'name asc')

    from_date = 0
    to_date = DateTime.now

    if params[:period] == 'from_date'
      flash.now[:warning] = "Please enter a date." if params[:from_date].blank?
      from_date = params[:from_date]
    elsif params[:period] == 'between'
      flash.now[:warning] = "Please enter a date range." if params[:from_date].blank? || params[:to_date].blank?
      from_date = params[:from_date]
      to_date = params[:to_date]
    end

    flash.now[:warning] = "Please enter an estimated development days." if params[:estimated_dev_days].blank?

    @version_progresses = VersionProgress.all(:conditions => ["version_id = ? and created_at > ? and created_at < ?", @version.id, from_date, to_date], :order => "created_at desc")

    logger.info "commit is #{params[:commit]}"

    if params[:commit] == "Export to CSV"

      send_data(version_progresses_to_csv(@version_progresses, params[:estimated_dev_days]), :type => 'text/csv; header=present', :filename => 'export.csv')
    end


  end


end
