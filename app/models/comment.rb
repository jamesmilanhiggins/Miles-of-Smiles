class Comment < ActiveRecord::Base
  belongs_to :product
  validates :title, :presence => true
  validates :content, :presence => true
  validates :author, :presence => true
end
