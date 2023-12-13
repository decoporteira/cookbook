class CategoriesController < ApplicationController

    def create
        @category = Category.new(recipe_params)
    
        if @category.save
          flash[:notice] = t('.success')
          return redirect_to(@category) 
        end
        flash.now[:alert] = t('.error')
        render :new
      end

      private
      def category_params
        params.require(:category).permit(:name)
      end
end