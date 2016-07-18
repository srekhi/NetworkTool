require 'sidekiq/scheduler'

#Sidekiq.configure_server do |config|
 #deleted this #config.redis = { url: 'redis://redis.example.com:6379/12', network_timeout: 5 }
 #     config.redis = { url: 'redis://localhost:6379/0', namespace: "sidekiq_app_name_#{Rails.env}" }

#end

#Sidekiq.configure_client do |config|
 # config.redis = { url: 'redis://redis.example.com:6379/12', network_timeout: 5 }
#end

ENV["REDIS_URL"] ||= "redis://localhost:6379"

Sidekiq.configure_server do |config|
  config.redis = { url: ENV["REDIS_URL"], namespace: 'sidekiq' }
end

unless Rails.env.production?
  Sidekiq.configure_client do |config|
    config.redis = { url: ENV["REDIS_URL"], namespace: 'sidekiq'  }
  end
end