class VersionProgressesController < ApplicationController
  unloadable

  include VersionProgressesHelper

  before_filter :require_admin

  def index
    if params[:project_id]
      @version = Project.find(params[:project_id]).versions.last
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
    @versions = Version.all(:conditions => ["status = 'open' and project_id =?", @project.id], :order => 'name asc')

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

    @version_progresses = VersionProgress.all(:conditions => ["version_id = ? and created_at > ? and created_at < ?", @version.id, from_date, to_date], :order => "created_at desc")

    logger.info "commit is #{params[:commit]}"

    if params[:commit] == "Export to CSV"

      send_data(version_progresses_to_csv(@version_progresses), :type => 'text/csv; header=present', :filename => "export_#{DateTime.now.strftime('%Y-%m-%d_%H-%M')}.csv")
    end


  end

  def record_progress
    VersionProgress.record_progress

    flash.now[:notice] = "Recorded progresses on all active versions."

    redirect_to version_progresses_url

  end




end
