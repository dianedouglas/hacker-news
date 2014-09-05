class Link < ActiveRecord::Base
  has_many :comments
  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true

  def upvote
    self.update(votes: self.votes + 1)
  end

  def self.sort_by_score
    # sorted = {}
    # self.all.each do |link|
    #   time_passed = Time.now - link.created_at
    #   rating = link.votes * 60 / time_passed
    #   sorted[link.id] = rating
    # end

    self.all.sort_by{|link| link.votes * 60 / (Time.now - link.created_at)}.reverse
  end
end
