class Ability
  include CanCan::Ability

  def initialize(user)
     # user not logged in 
    if user.nil?
        can :read, [City, Amenity, Room]
    elsif user.role? "admin"
        can :manage, [City, Amenity, User, Room]
        can [:create, :read, :update], Role
    elsif user.role? "host"
      can [:read,:create],[City,Amenity]
      can [:read,:update,:destroy],Room do |room|
        room.user == user
      end
      can [:myrooms,:unauthorized], Room
      can [:read,:update,:destroy], Booking 
    can :unconfirmed, Booking 
        elsif user.role? "guest"
        can :read, [City, Amenity,Room,Booking]
        can :read, Booking do |book|
            book.user == user
        end
        can :create, [Room,Booking]
        can :future, Booking
        can :past, Booking
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
