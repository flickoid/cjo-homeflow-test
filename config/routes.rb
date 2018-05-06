Rails.application.routes.draw do
  root 'static#home'
  post '/property-list' => 'static#property_list', as: :property_list
end
