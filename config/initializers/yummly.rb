Yummly.configure do |config|
  config.app_id = ENV["API_ID"]
  config.app_key = ENV["API_KEY"]
  config.use_ssl = true # Default is false
end