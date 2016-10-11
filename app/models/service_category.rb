class ServiceCategory < ApplicationRecord
  has_many :services
  resourcify

  validates :name, :description, :price, presence: true
  validates :name, length: { in: 1..100 }

  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' },
                            default_url: '/images/:style/missing.png'
  validates_attachment :image, presence: true,
                               content_type: {
                                 content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
                               }, size: { in: 0..1.megabyte }
end
