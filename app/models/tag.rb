class Tag < ApplicationRecord
  # Bir etiket birden çok gönderiye ara tablo üzerinden bağlanır.
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags
end