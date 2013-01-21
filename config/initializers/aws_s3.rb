if ENV['S3_B'] and ENV['S3_AK'] and ENV['S3_SAK']
  AWS_S3 = {
    'bucket' => ENV['S3_B'],
    'access_key_id' => ENV['S3_AK'],
    'secret_access_key' => ENV['S3_SAK']
  }
else
  AWS_S3 = YAML.load_file("#{Rails.root}/config/s3.yml")[Rails.env]
end