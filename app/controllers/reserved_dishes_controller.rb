class ReservedDishesController < ApplicationController
  def create

  end

  def destroy
    @reserved_dish = ReservedDish.find params[id]
    @reserved_dish.destroy
  end

  private
  def reserved_dish_params
    params.require(:reserved_dish).permit :dish, :quantity
  end
end
