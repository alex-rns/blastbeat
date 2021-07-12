# frozen_string_literal: true

# :nodoc:
class ProductSerializer < ActiveModel::Serializer
  attributes :id, :title, :price, :comments

  def comments
    object.comments.map do |comment|
      ::CommentSerializer.new(comment).attributes
    end
  end
end
