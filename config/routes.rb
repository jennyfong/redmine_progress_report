ActionController::Routing::Routes.draw do |map|

  map.resources :version_progresses, :only => [:index, :show], :members => [:export]

end