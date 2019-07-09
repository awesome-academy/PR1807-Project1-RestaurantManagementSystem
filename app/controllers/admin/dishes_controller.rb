class Admin::DishesController < ApplicationController
  require "will_paginate/array"
  layout "admin"
  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new dish_params
    if @dish.save
      flash[:info] = t "message.create_success"
      redirect_to admin_dish_url(@dish.id)
    else
      flash[:danger] = t "message.failure"
      render "new"
    end
  end

  def edit
    @dish = Dish.find params[:id]
  end

  def update
    @dish = Dish.find params[:id]
    if @dish.update_attributes dish_params
      flash[:success] = t "message.update_success"
      redirect_to admin_dish_url(@dish.id)
    else
      flash[:danger] = t "message.failure"
      render "edit"
    end
  end

  def show
    @dish = Dish.find params[:id]
  end

  def index
    order_key = params[:order_field]
    search_key = params[:search_field]
    category = Category.find params[:category] unless params[:category].blank?
    @dishes = category ? category.dishes : Dish.all
    @dishes = @dishes.search_by_key(search_key) unless search_key.blank?
    @dishes = @dishes.only_display
    @dishes = order_by(@dishes, order_key.to_s.to_sym).paginate page: params[:page], per_page: 12
  end

  private

  def dish_params
    params.require(:dish).permit :name, :image, :description, :status,
      :promotion, :price, :category_id
  end

  def order_by dishes, order_key
    case order_key
    when :price_asc #low to high price
      dishes.order :price
    when :price_desc #high to low price
      dishes.order price: :desc
    else
      dishes
    end
  end
end
