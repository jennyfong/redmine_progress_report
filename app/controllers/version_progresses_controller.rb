class VersionProgressesController < ApplicationController
  unloadable

  def index
    @versions = Version.all

  end


  def show
    if params[:project_id]
      @project = Project.find(params[:project_id])
      @version = Version.find(params[:version_id])
    else
      @version = params[:version_id] ? Version.find(params[:version_id]) : Version.find(params[:id])
      @project = @version.project
    end

    @projects = Project.visible.all(:order => 'name asc')
    @versions = @project.versions(:order => 'name asc')

    from_date = 0
    to_date =  DateTime.now

    if params[:period] == 'from_date'
      flash[:warning] = "Please enter the date" if params[:from_date].blank?
      from_date = params[:from_date]
    elsif params[:period] == 'between'
      flash[:warning] = "Please enter the dates" if params[:from_date].blank? || params[:to_date].blank?
      from_date = params[:from_date]
      to_date = params[:to_date]
    end

    @version_progresses = VersionProgress.all(:conditions => ["version_id = ? and created_at > ? and created_at < ?", @version.id, from_date, to_date], :order => "created_at desc")
  end


end
