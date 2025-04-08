class Post < ApplicationRecord
  belongs_to :user
  belongs_to :original_post, class_name: 'Post', optional: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reposts, class_name: 'Post', foreign_key: 'original_post_id', dependent: :nullify
  has_many_attached :files 
end