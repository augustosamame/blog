require 'carrierwave'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'

  config.fog_credentials = {
    :provider               => 'AWS',
  :aws_access_key_id      => ENV["S3_AWS_ACCESS_KEY_ID"],
  :aws_secret_access_key  => ENV["S3_AWS_SECRET_ACCESS_KEY"]
  }
  config.fog_directory  = ENV["CARRIERWAVE_CONFIG_FOG_DIRECTORY"]
  config.storage = :fog
end
