require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do
  def index
    @ingredients = Ingredient.all
    render json: @ingredients
  end
end
