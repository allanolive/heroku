class MealSerializer < ActiveModel::Serializer
  attributes :id, :amount, :unit
  has_one :ingredient
  has_one :recipe
end
