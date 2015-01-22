class Journal < ActiveRecord::Base
  belongs_to :user

  validates :title, :content, presence: true
  validate :filesize

  mount_uploader :picture, PictureUploader

  def filesize
    if picture.size > 1.megabytes
      errors.add(:picture, 'should be less than 5MB')
    end
  end
end
