class SongsController < ApplicationController
  def index
    @songs = AWS::S3::Bucket.find(Webblog::Application::MUSIC_BUCKET).objects
  end

  def upload
  end

  def delete
  end

end
