class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :lockable, :encryptable
end
