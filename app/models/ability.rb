# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user
    if user.admin?

      can :manage, :all
    elsif user.moderator?

      can :read, User
      return unless user.present?
      can :update, user

      can :manage, Advertisement
      can :manage, Comment
      can :destroy_api, Advertisement
    else

      can :read, Advertisement
      can :create, Advertisement
      return unless user.present?  # additional permissions for logged in users (they can read their own posts)
      can :update, Advertisement, user: user
      return unless user.present?
      can :destroy, Advertisement, user: user
      return unless user.present?
      can :destroy_api, Advertisement, user: user
      return unless user.present?
      can :update_api, Advertisement, user: user
      return unless user.present?
      can :create_api, Advertisement, user: user

      can :create_user_api, User


      can :read, User
      return unless user.present?
      can :update, user

      can :create, Comment
      return unless user.present?
      can :update, Comment, user: user
      return unless user.present?
      can :destroy, Comment, user: user
    end
  end
end
