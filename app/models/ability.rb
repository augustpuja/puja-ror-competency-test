class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.id.present?
      if user.admin?
        can :read, User
        can :create, User
        can :update, User
        can :read, Article
      elsif user.editor?
        can :read, Article
        can :create, Article
        can :update, Article do |article|
          article.try(:user) == user
        end
        can :destroy, Article do |article|
          article.try(:user) == user
        end
      elsif user.vanila_user?
        can :read, Article
      end
    else
      can :index, Article
    end
  end
end
