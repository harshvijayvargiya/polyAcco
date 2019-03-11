class RemoveBodyFromComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :body, :string
  end
end
