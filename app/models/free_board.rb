class FreeBoard < ActiveRecord::Base
  acts_as_commontable
  belongs_to :member
  validates :title, presence: {message: "제목을 입력하세요"}
end
