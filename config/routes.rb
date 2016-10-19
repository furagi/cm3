Rails.application.routes.draw do

  namespace :gtf do
    resources :video_encodings
    resources :users, except: [:show]
    resources :upload_extensions, except: [:show]
    resources :upload_actions, except: [:show]
    resources :storages, except: [:show]
    resources :scene_keywords, except: [:show]
    resources :scene_genres, except: [:show]
    resources :scenes, except: [:show]
    resources :permission_groups, except: [:show]
    resources :models, except: [:show]
    resources :media_types, except: [:show]
    resources :media, except: [:show]
    resources :lines, except: [:show]
    resources :labels, except: [:show]
    resources :image_encodings, except: [:show]
    resources :image_encodeds, except: [:show]
    resources :file_object_types, except: [:show]
    resources :file_object_type_families, except: [:show]
    resources :encoder_servers, except: [:show]
    resources :directors, except: [:show]
    resources :content_releases, except: [:show]
    resources :contents, shallow: true, except: [:show] do
      resources :videos, shallow: true, except: [:show] do
        resources :video_files, except: [:show]
      end
      resources :images, shallow: true, except: [:show] do
        resources :image_files, except: [:show]
      end
      resources :uploads
    end
    resources :content_types, except: [:show]
    resources :content_price_rates, except: [:show]
    resources :configurations, except: [:show]
    resources :companies, except: [:show]
    resources :agents, except: [:show]
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
