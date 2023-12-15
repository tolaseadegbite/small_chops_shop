class StaticPagesController < ApplicationController

  def home
    @products = Product.where(feature: true).ordered
    @reviews = Review.all.limit(6)
  end

  def about
    
  end

  def contact
    
  end
end
