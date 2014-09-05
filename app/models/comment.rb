class Comment < ActiveRecord::Base
  belongs_to :post, polymorphic: true
  has_many :comments, as: :post
  validates :description, presence: true
end
