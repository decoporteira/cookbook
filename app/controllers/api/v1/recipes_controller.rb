class Api::V1::RecipesController < Api::V1::ApiController

    def show
        recipe = Recipe.find(params[:id])

        render status: 200, json: recipe.as_json(expect: [:created_at, :updated_at]).merge(user_email: recipe.user.email)
    end

end