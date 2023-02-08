require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'John Doe', email: 'johndoe@gmail.com', password: '123456')
  end

  context 'Testing Validations' do
    it 'is valid with valid attributes' do
      @user.save
      expect(@user).to be_valid
    end

    it 'is not valid without a name' do
      @user.name = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it 'is not valid without email' do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it 'is not valid without password' do
      @user.password = nil
      @user.save
      expect(@user).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'has_many foods' do
      assoc = User.reflect_on_association(:foods)
      expect(assoc.macro).to eq :has_many
    end

    it 'has_many recipes' do
      assoc = User.reflect_on_association(:recipes)
      expect(assoc.macro).to eq :has_many
    end
  end
end
