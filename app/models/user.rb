class User < ApplicationRecord
  has_many :offered_services, class_name: 'Service'
  has_many :purchased_services, class_name: 'Service'

  before_create :set_client_role, on: nil
  before_create :set_employee_role, on: :empĺoyee

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
    self.add_role :client
  end

  def set_employee_role
    self.add_role :employee
  end
end
