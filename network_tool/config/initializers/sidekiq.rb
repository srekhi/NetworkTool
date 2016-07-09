Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis.example.com:6379/12', network_timeout: 5 }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis.example.com:6379/12', network_timeout: 5 }
end