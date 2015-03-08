class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
      can :read, User, id: user.id
      if user.admin?
        can :read, :all
  
    end
  end
end
