class CategoriesController < ApplicationController

  before_action :set_category, only: [:index_subcategories]

 #Get /categories/#/subcategories
 def index_subcategories
   render json: @category.children
 end

 private

   def set_category
     @category = Category.find(params[:id])
   end

end
