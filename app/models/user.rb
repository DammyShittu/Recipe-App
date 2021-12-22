class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: { message: 'You must fill in your name' }
  validates :email, presence: { message: 'email field cannot be left blank' }
  validates :password, presence: { message: 'password field cannot be left blank' }

  has_many :foods, dependent: :destroy
  has_many :recipes, foreign_key: 'user_id', dependent: :destroy
end
