require 'rails_helper'

describe Comment do
  it { should belong_to :product }
  it { should validate_presence_of :title}
  it { should validate_presence_of :content}
  it { should validate_presence_of :author}
end
