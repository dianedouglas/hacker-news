require 'rails_helper'

describe Comment do
  it { should belong_to :post }
  it { should validate_presence_of :description }
  it { should have_many :comments }
end
