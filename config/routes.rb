Rails.application.routes.draw do
  root 'static#home'
  post '/property-list' => 'static#property_list', as: :property_list
  post '/show-property' => 'static#show_property', as: :show_property
end
