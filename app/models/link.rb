class Link < ActiveRecord::Base
  has_many :comments
  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true

  def upvote
    self.update(votes: self.votes + 1)
  end
end
