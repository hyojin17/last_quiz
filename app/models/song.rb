class Song < ApplicationRecord
    mount_uploader :cover, CoverUploader
    acts_as_followable
    acts_as_commentable
    has_many :participates
    has_many :artists, through: :participates, source: :artist
    
    validates :title, presence: true
    validates :lyric, length: { minimum: 10 }
    validate :cover_size
    
    # validates는 이미 만들어져있는애들을 유효성검사하는거고 validate는 우리가 만들어 쓰는 것.
    validate
    private
    def cover_size
       if self.cover.size > 5.megabyte
          errors.add(:cover, 'Cover 는 5mb보다 작아야 합니다') 
       end
    end
    
end
