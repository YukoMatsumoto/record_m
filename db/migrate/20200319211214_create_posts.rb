class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, length: 100
      t.text :caption, null: false, length: 2000

      t.timestamps
      
    end
  end
end
