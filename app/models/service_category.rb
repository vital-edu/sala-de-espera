class ServiceCategory < ApplicationRecord
  has_many :services
  resourcify

  validates_presence_of :name, :description, :price
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end

