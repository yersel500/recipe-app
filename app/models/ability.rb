class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Recipe
    return unless user.present?

    can :manage, Recipe, user_id: user.id

    # return unless user.admin?

    # can :manage, :all
  end
end
