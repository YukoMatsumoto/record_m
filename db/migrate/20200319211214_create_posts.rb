class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :caption, null: false, length: 2000

      t.timestamps

      t.string :name,       null: false, length: 30
      t.string :username,   null: false, length: 30,  unique: true
      t.text :description,  null: false, length: 500
      
    end
  end
end
