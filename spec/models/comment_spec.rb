require 'rails_helper'

describe Comment do
  it { should belong_to :link }
  it { should validate_presence_of :description }
end
