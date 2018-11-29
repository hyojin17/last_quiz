class Artist < ApplicationRecord
    mount_uploader :image, ProfileImgUploader
    acts_as_followable
    acts_as_commentable
    has_many :participates
    has_many :songs, through: :participates, source: :song
    validates :name, presence:true
    # validates :nationality
    validate :image_size
    
    private
    def image_size
        if self.image.size > 5.megabyte
            errors.add(:image, '는 5mb보다 작아야한다.')
        end
    end
end
