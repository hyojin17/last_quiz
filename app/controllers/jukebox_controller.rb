class JukeboxController < ApplicationController
  def index
    @artists = Artist.all
    @songs = Song.all
  end
end
