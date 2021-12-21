class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, public: true

    return unless user.present?

    can :read, :all, user: user
    can :create, :all, user: user

    can :destroy, Recipe do |r|
      r.user_id == user.id
    end

    # can :destroy, Food do |f|
    #   f.user_id == user.id
    # end
  end
end
