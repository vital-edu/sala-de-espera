class User < ApplicationRecord
  has_many :offered_services, class_name: :services
  has_many :purchased_services, class_name: :services

  before_create :set_default_role

  rolify
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :lockable, :encryptable

  validates_presence_of :name, :rg, :cpf
  validates_length_of :name, in: 1..100
  validates_confirmation_of :password

  private

  def set_default_role
    self.add_role(:client) if self.roles.blank?
  end
end
