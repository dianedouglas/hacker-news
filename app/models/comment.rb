class Comment < ActiveRecord::Base
  belongs_to :link
  validates :description, presence: true
end
