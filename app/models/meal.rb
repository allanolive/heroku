class Meal < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
end
