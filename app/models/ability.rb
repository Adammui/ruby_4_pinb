# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.admin?
      can :manage, :all
    elsif user.moderator?
      can :read, Advertisement
      can :create, Advertisement
      can :update, Advertisement
      can :destroy, Advertisement
    elsif user.regular?
      can :read, Advertisement
      can :create, Advertisement
      can :update, Advertisement do |item|
        item.try(:user) == user
      end
      can :destroy, Advertisement do |item|
        item.try(:user) == user
      end
    else
      can :read, Advertisement
    end
  end
end
