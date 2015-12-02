Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get 'search_by_director/:id' => 'movies#search_director', :as => :search_by_director
  post '/movies/search_tmdb'
end
