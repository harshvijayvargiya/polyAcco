class AddFieldsToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :is_active, :boolean
  end
end
