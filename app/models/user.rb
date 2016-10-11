class User < ApplicationRecord
  has_many :offered_services, class_name: 'Service'
  has_many :purchased_services, class_name: 'Service'

  before_create :set_client_role

  rolify
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :encryptable

  validates :name, :rg, :cpf, presence: true
  validates :name, length: { in: 1..100 }
  validates :password, confirmation: true

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
    add_role :client unless has_role? :employee
  end
end
