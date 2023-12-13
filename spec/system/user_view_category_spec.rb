require 'rails_helper'

RSpec.describe 'Usuário ve categorias' do
    it 'a partir da index' do
        #arrange
        user = create(:user, email: 'user@email.com', password: '123456', role: :admin)
        recipe_type = create(:recipe_type, name: 'Lanche')
        recipe = Recipe.create(title: 'Dobradinha', cook_time: 12, recipe_type_id: recipe_type.id, ingredients: 'Pão e ovo', instructions: 'Misturar tudo na panela', user_id: user.id )
        Category.create(name: 'Regional', user_id: user.id)

        #act
        visit(root_path)
        
        #assert
        expect(page).to have_content('Regional')
    end
end