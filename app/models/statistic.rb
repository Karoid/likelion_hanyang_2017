class Statistic < ActiveRecord::Base
  belongs_to :member
  #name 값의 규칙은 migrate 파일 안에 있습니다
  def self.create(attributes = nil, &block)
    attributes['created_at'] ||= Time.now
    if self.where(attributes, &block).length == 0
      super
    end
  end
end
