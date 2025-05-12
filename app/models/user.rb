class User < ApplicationRecord
  # has_many :posts
  has_many :posts, foreign_key: :user_id
  has_many :created_posts, class_name: 'Post', foreign_key: :creator_id
  # has_many :edited_posts, through: :post_editors, source: :post
  
   # For edited posts
  has_many :post_editors, foreign_key: :editor_id
  has_many :edited_posts, through: :post_editors, source: :post
end

