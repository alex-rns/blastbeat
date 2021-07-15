class ChangeCommentProductTypeToReference < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :product_id, :integer
    add_reference :comments, :product, foreign_key: true
  end
end
