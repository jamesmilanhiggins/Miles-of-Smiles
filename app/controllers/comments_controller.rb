class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:new]

  before_action :only => [:edit] do
    redirect_to '/' unless is_admin?
  end

  def new
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new
  end

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    if @comment.save
      redirect_to product_path(@comment.product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to product_path(@comment.product)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to product_path(@comment.product)
  end

  private
  def comment_params
    params.require(:comment).permit( :title, :author, :content)
  end
end
