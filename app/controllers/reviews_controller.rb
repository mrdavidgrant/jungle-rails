class ReviewsController < ApplicationController
  
  def create
    product = Product.find params[:product_id] 
    @user = logged_in?
    @review = product.reviews.new(review_params)
    @review.user_id = @user.id
    
    if @review.save
      redirect_to product
    else
      redirect_to product
    end

  end

  def destroy
    @review = Review.find params[:id]
    product = Product.find @review.product_id
    @review.destroy
    redirect_to product
  end

  private

    def review_params
      params.require(:review).permit(:description, :rating)
    end

end
