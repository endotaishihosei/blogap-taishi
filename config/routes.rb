Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles do
    resources :comments, only: [:new, :create]
  end
  # 記事の下にコメントがあるような関係の時には入子構造にしてみる
end
