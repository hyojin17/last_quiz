class ParticipatesController < ApplicationController
  before_action :set_participate, only: [:edit, :update, :destroy]
  
  def new
    @participate = Participate.new
    @artists = Artist.all
    @songs = Song.all
  end
  
  def create
    @artists = Artist.all
    @songs = Song.all
     @participate = Participate.new(participate_params)
     if @participate.save
       redirect_to jukebox_url
     else
       render 'new'
     end
  end

  def edit
    @artists = Artist.all
    @songs = Song.all
  end
  
  def update
    if @participate.update(participate_params)
      redirect_to jukebox_url
    else
      render 'edit'
    end
  end
  
  def destroy
    @participate.destroy
    redirect_to jukebox_url
  end
  
  private
  def set_participate
    @participate = Participate.find(params[:id])
  end
  
  def participate_params
    params.require(:participate).permit(:artist_id, :song_id)
  end
  
end
