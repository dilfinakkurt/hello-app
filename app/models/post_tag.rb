class PostTag < ApplicationRecord
  # Ara model, bir post'a ve bir tag'e aittir.
  belongs_to :post
  belongs_to :tag
end