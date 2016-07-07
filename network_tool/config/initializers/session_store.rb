# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_network_tool_session'
NetworkTool::Application.config.session_store :redis_store, servers: "redis://localhost:6379/0/session"

