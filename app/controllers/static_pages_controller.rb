class StaticPagesController < ApplicationController

  def home
    @products = Product.where(feature: true).ordered
  end

  def about
    
  end
end
