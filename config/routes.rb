Rails.application.routes.draw do
  get 'static_pages/home'

  get 'sessions/new'

  resources :teams

  root 'static_pages#home'
  resources :users
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'rounds' => 'ballots#rounds'
  get 'ballot/edit/:ballot_id' => 'ballots#edit'
  get 'ballot/:ballot_id' => 'ballots#show'
  post 'ballot/submit' => 'ballots#submit'
  scope 'admin' do
    match '/' => 'admin#home', via: [:get]
    match 'make_judge' => 'admin#make_judge', via: [:get, :post]
    match 'new_judge' => 'admin#new_judge', via: [:post]
    # match 'new_ballot' => 'admin#new_ballot', via: [:get, :post]
    # match 'create_ballot' => 'admin#create_ballot', via: [:post]
    match 'round_report' => 'admin#round_report', via: [:get]
    match 'make_round' => 'admin#make_round', via: [:get, :post]
    match 'create_round' => 'admin#create_round', via: [:post]
    match 'status' => 'admin#status', via: [:get]
    match 'release_results' => 'admin#release_results', via: [:get]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
