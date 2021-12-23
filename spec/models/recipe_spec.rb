require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'valid if name is present' do
    @user = User.create!(name: 'Dammy', email: 'dammy@gmail.com', password: 'qwerty')
    @recipe = @user.recipes.create(name: 'Chapo', preparation_time: 30, cooking_time: 150, description: 'new testts',
                                   public: true)
    expect(@recipe).to be_valid
  end

  it 'invalid if name absent' do
    @user = User.create!(name: 'shittu', email: 'shittu@gmail.com', password: 'qwerty')
    @recipe = @user.recipes.create(preparation_time: 30, cooking_time: 150, description: 'new testts', public: true)
    expect(@recipe).to_not be_valid
  end

  it 'Must be associated with a user' do
    @recipe = Recipe.create(name: 'Chapo', preparation_time: 30, cooking_time: 150, description: 'new testts',
                            public: true)
    expect(@recipe).to_not be_valid
  end

  it 'valid if User present' do
    @user = User.create!(name: 'kalunge', email: 'kalunge@gmail.com', password: 'qwerty')
    @recipe = @user.recipes.create(name: 'Chapo', preparation_time: 30, cooking_time: 150, description: 'new testts',
                                   public: true)
    expect(@recipe).to be_valid
  end

  it 'valid if preparation_time is present' do
    @user = User.create!(name: 'Dammy', email: 'dammy@gmail.com', password: 'qwerty')
    @recipe = @user.recipes.create(name: 'Chapo', preparation_time: 30, cooking_time: 150, description: 'new testts',
                                   public: true)
    expect(@recipe).to be_valid
  end

  it 'invalid if cooking_time is absent' do
    @user = User.create!(name: 'shittu', email: 'shittu@gmail.com', password: 'qwerty')
    @recipe = @user.recipes.create(name: 'Chapo', description: 'new testts', public: true)
    expect(@recipe).to_not be_valid
  end

  it 'valid if cooking_time is present' do
    @user = User.create!(name: 'shittu', email: 'shittu@gmail.com', password: 'qwerty')
    @recipe = @user.recipes.create(name: 'Chapo', preparation_time: 30, cooking_time: 150, description: 'new testts',
                                   public: true)
    expect(@recipe).to be_valid
  end

  it 'Must have a description' do
    @user = User.create!(name: 'shittu', email: 'shittu@gmail.com', password: 'qwerty')
    @recipe = @user.recipes.create(name: 'Chapo', preparation_time: 30, cooking_time: 150,
                                   public: true)
    expect(@recipe).to_not be_valid
  end

  it 'invalid if description is absent' do
    @user = User.create!(name: 'shittu', email: 'shittu@gmail.com', password: 'qwerty')
    @recipe = @user.recipes.create(name: 'Chapo', preparation_time: 30, cooking_time: 150, public: true)
    expect(@recipe).to_not be_valid
  end
end
