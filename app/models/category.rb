class Category < ApplicationRecord
  # Bir kategori birden çok gönderiyi içerir.
  has_many :posts
end