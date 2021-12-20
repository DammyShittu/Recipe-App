class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find_by(id: params[:id])
  end


  def new
    @food = Food.create(food_params)
    respond_to do |format|
      format.html do
        if @post.save
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
  end

  private
    def food_params
      params.require(:food).permit(:name, :measurement_unit, :price)
    end
  
end
