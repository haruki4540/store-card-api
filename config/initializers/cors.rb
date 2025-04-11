Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'  # ※開発時は全オリジン許可。本番は必要なドメインだけに絞る
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end
  