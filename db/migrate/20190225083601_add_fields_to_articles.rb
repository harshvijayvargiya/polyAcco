class AddFieldsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :is_active, :boolean
  end
end
