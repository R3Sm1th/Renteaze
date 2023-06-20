class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    # adding this line will let Rails figure out which channel we are on, params will come from javascript -> rn this is finding the wrong value (1 minus)
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
