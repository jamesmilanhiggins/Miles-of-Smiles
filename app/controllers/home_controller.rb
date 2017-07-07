class HomeController < ApplicationController
  before_action :only => [:edit] do
    redirect_to '/' unless is_admin? || is_current_user?
  end

  def index
    @products = Product.all
  end
end
