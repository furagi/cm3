Rails.application.routes.draw do

  namespace :gtf do
    resources :video_encodings
  end
  namespace :gtf do
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :upload_extensions, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :uploads, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :storages, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :scene_keywords, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :scene_genres, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :scenes, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :permission_groups, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :models, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :media_types, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :media, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :lines, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :labels, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :image_files, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :images, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :image_encodings, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :image_encodeds, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :file_object_types, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :file_object_type_families, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :encoder_servers, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :directors, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :content_types, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :content_releases, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :contents, shallow: true do
      resources :videos, shallow: true do
        resources :video_files
      end
      resources :images do
        resources :image_files
      end
      resources :uploads
    end
    resources :content_releases, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :content_types, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :content_releases, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :content_price_rates, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :configurations, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :companies, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :agents, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  namespace :shared do
    resources :websites
    resources :currencies
    resources :countries
  end

  namespace :idcert do
    resources :website_users
  end

  get 'welcome/index'


  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'welcome#index'

  # resources :categories, :defaults => {format: :json}

  # resources :girls, :defaults => {format: :json} do
  #   resources :photos
  # end

  # resources :slides, :defaults => {format: :json}

  # resources :settings, :defaults => {format: :json}



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
