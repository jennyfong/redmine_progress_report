ActionController::Routing::Routes.draw do |map|

  map.resources :version_progresses, :only => [:index, :show], :collection => [ :record_progress]

end