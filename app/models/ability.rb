class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :manager
      can :manage, :all
    end
  end
end
