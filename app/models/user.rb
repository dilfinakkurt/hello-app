class User < ApplicationRecord
  # Bir kullanıcı birden çok gönderi ve yorum yapabilir.
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end