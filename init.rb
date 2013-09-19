require 'redmine'
require 'dispatcher'

Redmine::Plugin.register :redmine_graph_activities do
  name 'Redmine Progress report plugin'
  author '@chingyifong'
  description "Capture progresses of each version"
  version '0.0.1'
end