class Participate < ApplicationRecord
  belongs_to :artist
  belongs_to :song
  validate :check_uniqueness
  
  private
  def check_uniqueness
    if Participate.find_by artist_id: self.artist, song: self.song
      errors.add(:artist_song, "Already Exist")
    end
  end
end
