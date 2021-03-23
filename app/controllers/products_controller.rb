class ProductsController < ApplicationController
  def index
    # binding.pry
    @products = cart.map {|p|
      Product.find_by(name: p)
    }
  end  

  def add
    @product = Product.create(name: params[:name])
    session[:cart].push(params[:name])
    redirect_to root_path
  end
end