#config/initializers/oauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :stripe_connect,
    ENV['stripe_connect'],
    ENV['stripe_secret'],
    :scope => 'read_write',
    :stripe_landing => 'register'

  # configure do |config|
  #   config.path_prefix = '/users/auth'
  # end
end
