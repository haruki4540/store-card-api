require "active_support/core_ext/integer/time"

Rails.application.configure do
  # この設定は config/application.rb より優先されます。

  # コード変更を即座に反映させる（サーバー再起動不要）
  config.enable_reloading = true

  # ブート時のコード読み込みは行わない（開発環境では false）
  config.eager_load = false

  # フルエラーレポートを表示する
  config.consider_all_requests_local = true

  # サーバータイミングを有効にする
  config.server_timing = true

  # Action Controller のキャッシュ設定
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.public_file_server.headers = { "cache-control" => "public, max-age=#{2.days.to_i}" }
  else
    config.action_controller.perform_caching = false
  end

  # キャッシュストアの設定（メモリーストア）
  config.cache_store = :memory_store

  # アップロードファイルはローカルのファイルシステムに保存
  config.active_storage.service = :local

  # メーラーエラーがあってもエラーを発生させない
  config.action_mailer.raise_delivery_errors = false

  # メールテンプレートの変更を即座に反映
  config.action_mailer.perform_caching = false

  # メール内リンク生成用のデフォルトURLオプション（開発環境用）
  config.action_mailer.default_url_options = { host: "localhost", port: 3000 }

  # Gmail SMTP 設定の追加
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',          # Gmail の SMTP サーバーアドレス
    port:                 587,                       # TLS 用ポート番号
    domain:               'gmail.com',               # ドメイン
    user_name:            ENV['GMAIL_USERNAME'],     # 環境変数から Gmail のユーザー名を取得（例: your@gmail.com）
    password:             ENV['GMAIL_PASSWORD'],     # 環境変数から Gmail のパスワードまたはアプリパスワードを取得
    authentication:       'plain',                   # 認証方式（plain）
    enable_starttls_auto: true                       # TLS を自動有効化
  }

  config.hosts << ".ngrok-free.app"

  # 非推奨機能の警告などをログに出力
  config.active_support.deprecation = :log

  # ページロード時に保留中のマイグレーションがあればエラーを発生させる
  config.active_record.migration_error = :page_load

  # データベースクエリの実行箇所をハイライトしてログに出力する
  config.active_record.verbose_query_logs = true

  # SQL クエリに実行時の情報をコメントとして追加
  config.active_record.query_log_tags_enabled = true

  # バックグラウンドジョブのエンキュー情報を詳細にログ出力する
  config.active_job.verbose_enqueue_logs = true

  # 翻訳が見つからなかった場合にエラーを発生させる（必要に応じて有効化）
  # config.i18n.raise_on_missing_translations = true

  # レンダリングしたビューにファイル名を注記する
  config.action_view.annotate_rendered_view_with_filenames = true

  # Action Cable のリクエストについて、すべてのオリジンを許可する場合は以下をアンコメント
  # config.action_cable.disable_request_forgery_protection = true

  # before_action の設定で、存在しないコールバックが参照された場合にエラーを発生させる
  config.action_controller.raise_on_missing_callback_actions = true

  # 生成時に RuboCop の自動修正を行う設定（必要に応じて）
  # config.generators.apply_rubocop_autocorrect_after_generate!
end
