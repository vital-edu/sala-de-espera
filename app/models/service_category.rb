class ServiceCategory < ApplicationRecord
  has_many :services
  resourcify

  validates_presence_of :name, :description, :price
  validates_length_of :name, in: 1..100

  has_attached_file :image
  validates_attachment :image, presence: true,
    default_url: "/images/:style/missing.png",
    styles: {
      medium: "300x300>",
      thumb: "100x100>"
    }, content_type: {
      content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    }, size: { in: 0..1.megabyte }
end
