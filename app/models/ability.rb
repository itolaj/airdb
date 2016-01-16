class Ability
  include CanCan::Ability

  def initialize(user)

    #CanCan configuration of premission for users with different roles
    #We did this just because someone needs to be signed up as an admin for full premission of the system in localhost for the first time
    can :manage, :all if user.user_role == nil
    #CanCan configuration of premission for users with different roles
    can :manage, :all if user.user_role == "Director"
    can :manage, :all if user.user_role == "Secretary"
    cannot :manage, User if user.user_role == "Secretary"
    can :read, Product if user.user_role == "Technician"
    can :read, Appointment if user.user_role == "Technician"
      else
        can :read, Product
  end
end
