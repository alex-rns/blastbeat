class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :price
      t.string :category
      t.string :brand
      t.string :manufacturer
      t.string :material
      t.integer :year

      t.timestamps
    end
  end
end
