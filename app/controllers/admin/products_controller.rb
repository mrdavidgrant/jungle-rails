class Admin::ProductsController < ApplicationController
  before_filter :authenticate
  
  def index
    @products = Product.all.order(created_at: :desc)
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end
  
  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end
  
  protected
  def authenticate
    authenticate_or_request_with_http_basic do |user, password|
      user == ENV['USER_ID'] && password == ENV['PASSWORD']
    end
  end
  
  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
