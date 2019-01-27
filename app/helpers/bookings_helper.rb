module BookingsHelper

  def get_room_name(id)
   Room.find(id).name
end

def get_user_name(id)
 User.find(id).name
end





end
