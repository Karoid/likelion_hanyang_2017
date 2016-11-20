class Board < ActiveRecord::Base
  belongs_to :category
  has_many :articles, dependent: :destroy
end
