class Food < ApplicationRecord
  validates :name, presence: { message: 'You must fill in the food name' }
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
end
