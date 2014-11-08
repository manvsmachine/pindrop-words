Rails.application.routes.draw do
  root 'entries#search'
  get  '/search' => 'entries#search'
  post '/search' => 'entries#get_results'
end
