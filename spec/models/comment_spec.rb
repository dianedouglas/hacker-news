require 'rails_helper'

describe Comment do
  it { should belong_to :post }
  it { should validate_presence_of :description }
  it { should have_many :comments }

  describe 'find_parent' do
    it 'should find the top level link of any nested comment.' do
      test_link1 = Link.create(name: "test", url: "www.test.com", description: "more tests")
      test_comment1 = test_link1.comments.create(description: "first level comment")
      test_comment2 = test_comment1.comments.create(description: "second level comment")
      expect(test_comment2.find_parent).to eq test_link1
    end
  end
end
