require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.create(name: 'John Doe', email: 'johndoe@gmail.com', password: '123456')
    @food = Food.new(user: @user, name: 'Pancakes', measurement_unit: 'pieces', price: 18, quantity: 24)
  end
  context 'Testing Validations' do
    it 'is valid with valid attributes' do
      expect(@food).to be_valid
    end

    it 'is not valid without a name' do
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'is not valid without user id' do
      @food.user_id = nil
      expect(@food).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'has_many recipes' do
      assoc = Food.reflect_on_association(:recipe_foods)
      expect(assoc.macro).to eq :has_many
    end
    it 'belongs_to user' do
      assoc = Food.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
