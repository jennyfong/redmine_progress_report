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

    @version_progresses = VersionProgress.all(:conditions => ["version_id = ? ", @version.id], :order => "created_at desc")
  end


end
