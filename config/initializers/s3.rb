
unless "production" == Rails.env 
  #in non production env, load from config file
  s3_config_file = File.join(Rails.root,"config","s3.yml")
  raise "s3 config file not found : #{s3_config_file}" unless File.exists?(s3_config_file)
  S3_CONFIG = YAML.load_file(s3_config_file)[Rails.env]
  AWS::S3::Base.establish_connection! S3_CONFIG['connection'].symbolize_keys!
  MUSIC_BUCKET = S3_CONFIG["music_bucket"]
  
else
  #in production env use Env variable
  AWS::S3::Base.establish_connection!(
  :access_key_id => ENV["ACCESS_KEY_ID"],
  :secret_access_key=> ENV["SECRET_ACCESS_KEY"],
  :use_ssl => true  
  )
  MUSIC_BUCKET = ENV["MUSIC_BUCKET"]
  
end