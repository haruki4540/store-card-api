Rails.application.routes.draw do
  namespace :api do
    namespace :auth do
      post 'login', to: 'sessions#create'       # ログインエンドポイント
      post 'register', to: 'registrations#create' # 新規ユーザー登録エンドポイント
      get  'confirm',  to: 'confirmations#confirm' # メール認証確認エンドポイント
    end

    resources :users, only: [:index]  # その他のユーザー関連のルーティング
  end
end
