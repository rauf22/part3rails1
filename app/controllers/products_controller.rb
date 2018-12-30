class ProductsController < ApplicationController
  before_action :authenticate_user!,  only: [:show, :edit, :update, :destroy]
    before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def show

  end

  def add_to_cart
    if session[:cart_id].blank?
    cart = Cart.create(status: "pending")
    session[:cart_id] = cart.id
    else
      cart = Cart.find(session[:cart_id])
    end
    product = Product.find(params[:id])
    cart.cartships.create(product_id: product.id, quantity: 1)
    redirect_to cart
  end
  def new
    @product = Product.new
    
  end
  def edit
    
  end

  def create
    @product = Product.create(product_params )
    if @product.errors.empty?
      redirect_to product_path(@product)
    else
    render "new"  
    end
  end

  def update
    @product.update_attributes(product_params)
    if @product.errors.empty?
      redirect_to product_path(@product)
    else
    render "edit" 
    end
  end

  def destroy
  end

private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :descption, :price, :image)  
  end
end
