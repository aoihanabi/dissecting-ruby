#User object to act as a user when no one is logged in
class GuestUser < User
  #attr_accessor is to provide SETTER & GETTERS
  attr_accessor :name, :first_name, :last_name, :email
end