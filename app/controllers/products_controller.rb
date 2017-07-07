class ProductsController < ApplicationController
  # before_action :authenticate_user!, :only => [:new]

  # before_action :only => [:edit] do
  #   redirect_to '/' unless is_admin? || is_current_user?
  # end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @product = @user.products.new
  end

  def create
    @user = User.find(params[:user_id])
    @product = @user.products.new(product_params)
    if @product.save
      redirect_to user_path(@product.user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @product = Product.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to user_path(@product.user)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to user_path(@product.user)
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :avatar)
  end
end
