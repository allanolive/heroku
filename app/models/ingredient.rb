class Ingredient < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :recipes, through: :meals
end
