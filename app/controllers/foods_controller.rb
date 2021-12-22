class FoodsController < ApplicationController
  load_and_authorize_resource
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find_by(id: params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.create(food_params)
    respond_to do |format|
      format.html do
        if @food.save
          flash[:success] = 'food created succeffuly'
          redirect_to foods_path
        else
          flash[:error] = 'food not created try again'
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
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
