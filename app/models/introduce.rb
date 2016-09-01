class Introduce < ActiveRecord::Base
  belongs_to :member
  validates :title, presence: {message: "제목을 입력하세요"}
end
