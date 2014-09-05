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
end
