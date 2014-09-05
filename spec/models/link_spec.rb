require 'rails_helper'

describe Link do
  it { should have_many :comments }
  it { should validate_presence_of :url }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }

  describe "upvote" do
    it "increases the number of votes by 1" do
      test_link = Link.create(name: "test", url: "www.test.com", description: "more tests")
      test_link.upvote
      expect(test_link.votes).to eq 1
    end
  end

  it "orders the links by the number of votes they have" do
    test_link1 = Link.create(name: "test", url: "www.test.com", description: "more tests")
    test_link1.upvote
    test_link2 = Link.create(name: "test", url: "www.test.com", description: "more tests")
    test_link2.upvote
    test_link2.upvote
    test_link2.upvote
    expect(Link.order(:votes).reverse).to eq [test_link2, test_link1]
  end

  describe "sort_by_score" do
    it "orders links by an arbitrary score based on votes and most recent posts" do
      test_link1 = Link.create(name: "test", url: "www.test.com", description: "more tests")
      test_link1.upvote
      test_link2 = Link.create(name: "test", url: "www.test.com", description: "more tests")
      test_link2.upvote
      test_link2.upvote
      test_link2.upvote
      expect(Link.sort_by_score).to eq [test_link2, test_link1]
    end
  end
end
