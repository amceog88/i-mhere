class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :rememberable, :trackable, :validatable
  # :database_authenticatable, :registerable,
  # :recoverable, :rememberable, :trackable, :validatable
  # has_many :writings
end
