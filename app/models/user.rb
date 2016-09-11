class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :lockable, :encryptable

  validates_presence_of :name, :rg, :cpf
  validates_length_of :name, in: 1..100
  validates_confirmation_of :password
end
