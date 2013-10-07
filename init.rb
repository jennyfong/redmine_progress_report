require 'redmine'


Redmine::Plugin.register :redmine_progress_report do
  name 'Redmine Progress report plugin'
  author '@jennyfong'
  description "Capture progresses of each version"
  version '0.0.1'

  menu :admin_menu, :progress_report, "/version_progresses", :caption => 'Progress Report', :html => {:class => 'enumerations'}

  permission :progress_report, :report => [:index, :show, :record_progress]

end