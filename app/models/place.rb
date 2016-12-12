class Place < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :photos

  geocoded_by :address
  after_validation :geocode

  validates :name, length: { minimum: 3 }
  validates :address, presence: true
  validates :description, length: { maximum: 500 }

  def last_comment
    self.comments.order("id ASC").last
  end

  def last_photo
    self.photos.order("id ASC").last
  end

end
