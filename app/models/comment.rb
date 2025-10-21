class Comment < ApplicationRecord
  # Bir yorumun ait olduğu bir kullanıcı ve bir gönderi vardır.
  belongs_to :user
  belongs_to :post
end