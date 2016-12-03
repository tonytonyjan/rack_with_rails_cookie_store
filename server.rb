# frozen_string_literal: true
require 'bundler/setup'
require 'action_dispatch'
require 'rack'

SECRET_KEY_BASE = 'secret_key_base'

default_app = lambda do |env|
  session = env['rack.session']
  session[:count] ||= 1
  session[:count] += 1
  [200, {}, [session[:count].to_s]]
end

app = Rack::Builder.app(default_app) do
  key_generator = ActiveSupport::KeyGenerator.new(::SECRET_KEY_BASE, iterations: 1000)
  use Rack::Config do |env|
    env[ActionDispatch::Cookies::GENERATOR_KEY] = key_generator
    env[ActionDispatch::Cookies::SECRET_KEY_BASE] = ::SECRET_KEY_BASE
    env[ActionDispatch::Cookies::ENCRYPTED_COOKIE_SALT] = 'signed cookie'
    env[ActionDispatch::Cookies::ENCRYPTED_SIGNED_COOKIE_SALT] = 'encrypted signed cookie'
  end
  use ActionDispatch::Cookies
  use ActionDispatch::Session::CookieStore
end

Rack::Handler::WEBrick.run app
