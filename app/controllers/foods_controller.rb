class FoodsController < ApplicationController
  load_and_authorize_resource
  def index
    @foods = current_user.foods.all
  end

  def show
    @food = Food.find_by(id: params[:id])
  end

  def create
    @food = current_user.foods.build(food_params)
    respond_to do |format|
      format.html do
        if @food.save
          flash[:notice] = 'Food created successfully'
          redirect_to foods_path
        else
          flash[:alert] = 'Food not created try again'
          render :new
        end
      end
    end
  end

  def destroy
    @food = Food.find_by(id: params[:id])
    @food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.permit(:name, :measurement_unit, :price)
  end
end
