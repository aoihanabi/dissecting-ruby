module CurrentUserConcern
  extend ActiveSupport::Concern

  #we override de current_user method that comes with
  #devise gem, to make it available for more than just
  #devise users, we want current user to be available 
  #even if there's no user logged in
  def current_user
    super || guest_user
  end

  def guest_user
    #Bugs happened after trying to use Petergate gem,
    #it was changed for the option bellow
    #OpenStruct.new(name: "Guest User", 
    #               first_name: "Guest", 
    #               last_name: "User", 
    #               email: "guest@example.com")

    guest = GestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"

    guest
  end
end