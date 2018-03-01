Decidim::Admin::Engine.routes.draw do
  get '/organization/polis_config/edit' => 'polis_config#edit'
  put '/organization/polis_config/update' => 'polis_config#update'

end