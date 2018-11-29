class FollowsController < ApplicationController
    before_action :authenticate_user!
    
    def artist_follow_toggle
        @artist = Artist.find params[:id]
        if !@artist.followed_by?(current_user)#팔로우 하고있지 않다면
            #follow
            current_user.follow(@artist)
        else
            #unfollow
            current_user.stop_following(@artist)
        end
        redirect_to @artist
    end
    
    def song_follow_toggle
        @song = Song.find params[:id]
        if !@song.followed_by?(current_user)#팔로우 하고있지 않다면
            #follow
            current_user.follow(@song)
        else
            #unfollow
            current_user.stop_follwing(@song)
        end
        redirect_to @song
    end
end
