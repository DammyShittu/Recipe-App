class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
  end

  def create
  end

  def destroy
  end
end
