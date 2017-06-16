CarrierWave.configure do |config|
  config.fog_provider = 'fog/google'                        # required
  config.fog_credentials = {
    provider:                         'Google',
    google_storage_access_key_id:     ENV["pusher_key"],
    google_storage_secret_access_key: ENV["pusher_secret"]
  }
  config.fog_directory = 'melabtest'
end