class Ability
  include CanCan::Ability

  def initialize(member)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    if member.admin
      can :manage, :all

    elsif member.role > 0
      can :read, :all
      if member.staff
        can :create, Introduce
        can [:update,:destroy], Introduce do |model_name|
          model_name.member == member
        end
        can :create, NoticeBoard
        can [:update,:destroy], NoticeBoard do |model_name|
          model_name.member == member
        end
      end
      can :create, FreeBoard
      can [:update,:destroy], FreeBoard do |model_name|
        model_name.member == member
      end
      can :create, MemberBoard
      can [:update,:destroy], MemberBoard do |model_name|
        model_name.member == member
      end
      can :create, SameageBoard
      can [:update,:destroy], SameageBoard do |model_name|
        model_name.member == member
      end
    end
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
