require 'rails_helper'

RSpec.describe 'Admin criar categoria' do
    it 'a partir da index' do
        #arrange
        user = create(:user, email: 'user@email.com', password: '123456', role: :admin)
       
        #act
        login_as user, scope: :admin
        visit(root_path)
        click_on('Criar categoria')
        
        #assert
    end
end