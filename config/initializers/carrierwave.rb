CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
  else
  config.enable_processing = false
  config.storage = :upyun
  config.upyun_username    = ENV['UPYUN_USERNAME']
  config.upyun_password    = ENV['UPYUN_PASSWD']
  config.upyun_bucket      = ENV['UPYUN_BUCKET']
  config.upyun_bucket_host = ENV['UPYUN_BUCKET_HOST']
  end
end
