class CreateBoardgames < ActiveRecord::Migration[7.0]
  def change
    create_table :boardgames do |t|
      t.string :title
      t.string :author
      t.float :price
      t.float :rating

      t.timestamps
    end
  end
end
