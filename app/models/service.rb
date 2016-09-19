class Service < ApplicationRecord
  belongs_to :user
  resourcify

  validates_presence_of :schedule, :status, :user_id, :service_category_id
end
