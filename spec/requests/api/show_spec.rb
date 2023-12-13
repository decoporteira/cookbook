require 'rails_helper'

RSpec.describe 'Mostrar detalhes da receita' do
    context 'Get /api/v1/recipes/id' do
        it 'sucess' do
            #arrange 
            user = create(:user, email: 'user@email.com', password: '123456', role: :admin)
            recipe_type = create(:recipe_type, name: 'Lanche')
            recipe = Recipe.create(title: 'Dobradinha', cook_time: 12, recipe_type_id: recipe_type.id, ingredients: 'Pão e ovo', instructions: 'Misturar tudo na panela', user_id: user.id )
            Category.create(name: 'Regional', user_id: user.id)

            #act
            get "/api/v1/recipes/#{recipe.id}"
            
            #Assert
            expect(response.status).to eq 200
            expect(response.content_type).to include 'application/json'

            json_response = JSON.parse(response.body)
            expect(json_response['title']).to eq('Dobradinha')
            expect(json_response['cook_time']).to eq(12)
            expect(json_response['ingredients']).to eq('Pão e ovo')
            expect(json_response['instructions']).to eq('Misturar tudo na panela')
            expect(json_response['user_email']).to eq("#{user.email}")


        end
    end

end