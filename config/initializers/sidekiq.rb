require 'sidekiq'
require 'sidekiq-status'

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Sidekiq::Status::ServerMiddleware
  end
end