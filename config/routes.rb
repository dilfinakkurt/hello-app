Rails.application.routes.draw do
  # API versiyon 1 rotaları için namespace kullanıyoruz
  root 'pages#hello'
  namespace :api do
    namespace :v1 do
      # Posts için tam CRUD rotaları. Varsayılan yanıt formatı JSON.
      resources :posts, defaults: { format: :json }
      
      # Comments için oluşturma (create) ve okuma (read) rotaları.
      resources :comments, only: [:index, :show, :create], defaults: { format: :json }

      # Users, Categories ve Tags için sadece okuma rotaları (basitlik için).
      resources :users, only: [:index, :show], defaults: { format: :json }
      resources :categories, only: [:index, :show], defaults: { format: :json }
      resources :tags, only: [:index, :show], defaults: { format: :json }
    end
  end
  
  # Ön yüz olmadığı için bir ana sayfa (root) tanımlamıyoruz.
end

