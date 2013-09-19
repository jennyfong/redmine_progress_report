class VersionProgressesController < ApplicationController
  unloadable

  def index
    @versions = Version.all

  end

  def show
    @version = Version.find(params[:id])
    @version_progresses = VersionProgress.all(:conditions => ["version_id = ? ", @version.id], :order => "created_at desc" )
  end


end
