class ServiceCategory < ApplicationRecord
  include ImageUploader[:image]

  has_many :services
  resourcify

  validates :name, :description, :price, presence: true
  validates :name, length: { in: 1..100 }

end
