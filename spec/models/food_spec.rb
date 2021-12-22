require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'valid if name is present' do
    @user = User.create!(name: 'Dammy', email: 'dammy@gmail.com', password: 'qwerty')
    @food = @user.foods.create(name: 'Chapo', measurement_unit: 'grams', price: 150)
    expect(@food).to be_valid
  end

  it 'invalid if name absent' do
    @user = User.create!(name: 'shittu', email: 'shittu@gmail.com', password: 'qwerty')
    @food = @user.foods.create(measurement_unit: 'grams', price: 50)
    expect(@food).to_not be_valid
  end

  it 'Must be associated with a user' do
    @food = Food.create(name: 'Muthokoi', measurement_unit: 'grams', price: 500)
    expect(@food).to_not be_valid
  end

  it 'valid if User present' do
    @user = User.create!(name: 'kalunge', email: 'kalunge@gmail.com', password: 'qwerty')
    @food = @user.foods.create(name: 'Karanga', measurement_unit: 'grams', price: 50)
    expect(@food).to be_valid
  end

  it 'valid if name is present' do
    @user = User.create!(name: 'Dammy', email: 'dammy@gmail.com', password: 'qwerty')
    @food = @user.foods.create(name: 'Chapo', measurement_unit: 'grams', price: 150)
    expect(@food).to be_valid
  end

  it 'Must have a price' do
    @user = User.create!(name: 'shittu', email: 'shittu@gmail.com', password: 'qwerty')
    @food = @user.foods.create(name: 'Rice', measurement_unit: 'grams', price: 50)
    expect(@food).to be_valid
  end

  it 'invalid if price is absent' do
    @user = User.create!(name: 'shittu', email: 'shittu@gmail.com', password: 'qwerty')
    @food = @user.foods.create(name: 'Rice', measurement_unit: 'grams')
    expect(@food).to_not be_valid
  end

  it 'Must have a measurement_unit' do
    @user = User.create!(name: 'shittu', email: 'shittu@gmail.com', password: 'qwerty')
    @food = @user.foods.create(name: 'Rice', measurement_unit: 'grams', price: 50)
    expect(@food).to be_valid
  end

  it 'invalid if price is absent' do
    @user = User.create!(name: 'shittu', email: 'shittu@gmail.com', password: 'qwerty')
    @food = @user.foods.create(name: 'Rice', price: 570)
    expect(@food).to_not be_valid
  end
end
