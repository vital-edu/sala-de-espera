class Service < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :schedule, :description, :status, :price, :user_id
end
