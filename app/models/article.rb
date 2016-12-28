class Article < ActiveRecord::Base
  belongs_to :board
  belongs_to :member
  has_many :uploadfiles, dependent: :destroy
  acts_as_commentable
end
