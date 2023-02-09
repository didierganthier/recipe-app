require 'rails_helper'
RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create(name: 'John Doe', email: 'johndoe@gmail.com', password: '123456')
    @recipe = Recipe.new(user: @user, name: 'Pancakes', preparation_time: 1, cooking_time: 30,
                         description: 'Lorem ipsum', public: false)
  end

  context 'Testing Validations' do
    it 'is valid with valid attributes' do
      expect(@recipe).to be_valid
    end
  end

  context 'Testing Associations' do
    it 'has_many recipes' do
      assoc = Recipe.reflect_on_association(:recipe_foods)
      expect(assoc.macro).to eq :has_many
    end
    it 'belongs_to user' do
      assoc = Recipe.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
