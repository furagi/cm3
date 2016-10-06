Rails.application.routes.draw do

  namespace :gtf do
    resources :video_encodings
    resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :upload_extensions, only: [:index, :new, :create, :edit, :update, :destroy]
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
    resources :image_encodings, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :image_encodeds, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :file_object_types, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :file_object_type_families, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :encoder_servers, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :directors, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :content_releases, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :contents, shallow: true do
      resources :videos, shallow: true do
        resources :video_files
      end
      resources :images, shallow: true do
        resources :image_files
      end
      resources :uploads
    end
    resources :content_types, only: [:index, :new, :create, :edit, :update, :destroy]
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

end
