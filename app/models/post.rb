class Post < ApplicationRecord
  # Bir gönderinin bir yazarı ve bir kategorisi vardır.
  belongs_to :user
  belongs_to :category

  # Bir gönderinin birden çok yorumu, ara tablosu ve etiketi olabilir.
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
end