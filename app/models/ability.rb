# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new()

    can :read, Post

    if user.is_admin?
      can :manage, :all
    elsif user.present?
      can :read, :all
      can :create, Post
      can :destroy, Post, author_id: user.id
      can :create, Comment
      can :destroy, Comment, author_id: user.id
    end
  end
end
