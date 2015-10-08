CarrierWave.configure do |config|

  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # Use AWS storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end

  config.fog_credentials = {
    # Configuration for Amazon S3
    :provider => 'AWS',
    :aws_access_key_id => ENV['s3_ACCESS_KEY'],
    :aws_secret_access_key => ENV['s3_SECRET_KEY']
  }
  config.fog_directory = ENV['s3_BUCKET']
  
end