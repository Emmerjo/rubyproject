class AddUserIdToBoardgames < ActiveRecord::Migration[7.0]
  def change
    add_column :boardgames, :user_id, :integer
    add_index :boardgames, :user_id
  end
end
