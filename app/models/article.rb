class Article < ActiveRecord::Base
  belongs_to :board
  belongs_to :member
  acts_as_commentable
end
