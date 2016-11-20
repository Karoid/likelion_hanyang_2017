class Article < ActiveRecord::Base
  belongs_to :board
  belongs_to :member
end
