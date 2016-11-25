class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :place

end
