class HomeController < ApplicationController
  def index
  end
  def create_post
  end
  def your_profile
    @comment = Commontator::Comment.where(creator_id:current_member.id)
    @article = Introduce.where(member_id:current_member.id)+NoticeBoard.where(member_id:current_member.id)+FreeBoard.where(member_id:current_member.id)+MemberBoard.where(member_id:current_member.id)+GraduateBoard.where(member_id:current_member.id)+SameageBoard.where(member_id:current_member.id)
  end
end
