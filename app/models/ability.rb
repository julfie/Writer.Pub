class Ability
  include CanCan::Ability

  def initialize(user)
    @user ||= User.new # guest user (not logged in)
    @user.user_roles.each { |role| send(role.name.downcase) }

    if @user.user_roles.size != 0
      can :manage, :all
    else
      can :read, :all
    end
    
  end
end