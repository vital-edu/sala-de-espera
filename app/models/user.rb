class User < ApplicationRecord
  has_many :offered_services, class_name: 'Service'
  has_many :purchased_services, class_name: 'Service'

  before_create :set_client_role

  rolify
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :encryptable

  validates_presence_of :name, :rg, :cpf
  validates_length_of :name, in: 1..100
  validates_confirmation_of :password

  rails_admin do
    configure :offered_services do
      label 'Serviço oferecido'
    end

    configure :purchased_services do
      label 'Serviço comprado'
    end
  end

  private

  def set_client_role
    self.add_role :client unless self.has_role? :employee
  end
end
