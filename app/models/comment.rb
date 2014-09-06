class Comment < ActiveRecord::Base
  belongs_to :post, polymorphic: true
  has_many :comments, as: :post
  validates :description, presence: true

  def find_parent
    next_level = self.post
    until next_level.class.to_s == "Link"
      next_level = next_level.post
    end
    next_level
  end
end
