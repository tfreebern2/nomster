class Place < ActiveRecord::Base
  belongs_to :user
  validates :name, length: { minimum: 3 }
  validates :address, presence: true
  validates :description, length: { maximum: 500 }
end
