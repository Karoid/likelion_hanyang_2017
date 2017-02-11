class Point < ActiveRecord::Base
end
require 'article'
require 'statistic'
class Statistic
  after_save :give_point
  #저장할때 포인트를 줍니다.
  def give_point
    point = Point.where(user_id: self.member_id).take
    case self.name
    when "write_problem"
      article = self.target_model.camelize.constantize.find(self.target_id.to_i)
      if point
        point.point += 3000
        point.save
      else
        Point.create(user_id: self.member_id, point: 8000)
      end
    when "sign_in"
      if point
        point.point += 700
        point.save
      else
        Point.create(user_id: self.member_id, point: 5700)
      end
    end
  end
end
class Article
  after_save :statistic
  #저장할때 포인트를 줍니다.
  def statistic
    if self.board.route == "problems"
      Statistic.create(name: "write_problem", member_id: self.member_id, target_model: "Board", target_id: self.board.id)
    end
  end
end
