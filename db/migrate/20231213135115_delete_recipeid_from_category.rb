class DeleteRecipeidFromCategory < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :recipe_type_id
  end
end
