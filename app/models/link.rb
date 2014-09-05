class Link < ActiveRecord::Base
  has_many :comments
  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true

  def upvote
    self.update(votes: self.votes + 1)
  end

  def self.sort_by_score
    self.all.sort_by{|link| link.votes / (Time.now - link.created_at)}.reverse
  end
end
