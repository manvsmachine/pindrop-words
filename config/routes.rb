Rails.application.routes.draw do
    root 'entries#home'
    get '/search' => 'entries#search'
end
