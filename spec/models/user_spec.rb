require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid if name absent' do
    @user = User.create(email: 'Doe@gmail.com', password: 'qwerty')
    expect(@user).to_not be_valid
  end

  it 'Valid if name is present' do
    @user = User.new(name: 'Jane Doe', email: 'jane@gmail.com', password: 'qwerty')
    expect(@user).to be_valid
  end

  it 'is not valid if email absent' do
    @user = User.create(name: 'Jane Doe', password: 'qwerty')
    expect(@user).to_not be_valid
  end

  it 'Valid if email is present' do
    @user = User.new(name: 'Jane Doe', email: 'janedoe@gmail.com', password: 'qwerty')
    expect(@user).to be_valid
  end

  it 'is not valid if password absent' do
    @user = User.create(name: 'Jane Doe', email: 'janed@gmail.com')
    expect(@user).to_not be_valid
  end

  it 'Valid if password is present' do
    @user = User.new(name: 'Jane Doe', email: 'janedo@gmail.com', password: 'qwerty')
    expect(@user).to be_valid
  end
end
