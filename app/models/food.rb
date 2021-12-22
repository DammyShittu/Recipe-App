class Food < ApplicationRecord
  validates :name, presence: { message: 'You must fill in the food name' }
  validates :measurement_unit, presence: { message: 'You must fill in the food measurement_unit' }
  validates :price, presence: { message: 'You must fill in the food price' }
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
end
