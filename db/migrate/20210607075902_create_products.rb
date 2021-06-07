class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :price
      t.string :category
      t.string :brand
      t.string :manufactured
      t.string :material

      t.timestamps
    end
  end
end
