class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all
    cannot :read, Recipe, public: false

    return unless user.present?
    can :read, :all
    can :create, :all

    can :destroy, Recipe do |r|
      r.user_id == user.id
    end

    can :destroy, Food do |f|
      f.user_id == user.id
    end
  end
end
