class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :manager
      can :manage, :all
    elsif user.has_role? :employee
      can :manage, Service, employee_id: user.id
    end
  end
end
