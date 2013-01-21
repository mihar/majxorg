if ENV['TWITTER_USERNAME'] # Heroku
  SERVICES = {
    'lastfm' => {'username' => ENV['LASTFM_USERNAME']},
    'pinboard' => {'username' => ENV['PINBOARD_USERNAME']},
    'twitter' => {'username' => ENV['TWITTER_USERNAME']},
    'latitude' => {'user_id' => ENV['LATITUDE_USER_ID']},
    'flickr' => {
      'shared_secret' => ENV['FLICKR_SHARED_SECRET'],
      'api_key' => ENV['FLICKR_API_KEY'],
      'auth_token' => ENV['FLICKR_AUTH_TOKEN'],
      'user_id' => ENV['FLICKR_USER_ID']
    }
  }
else # Local config file
  SERVICES = YAML.load_file("#{Rails.root}/config/services.yml")
end