class MessagesController < ApplicationController
  # you only need a patch request for the message submit, no need to redirect
  # in the create method, we are dealing with 3 references: content, chatroom and user, for readability, i am adding the ids
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom_id = @chatroom.id
    @message.user_id = current_user.id

    @message.save
    ChatroomChannel.broadcast_to(
      @chatroom,
      # for styling the broadcasted message, we need to access the message's user id, aka sender_id
      message: render_to_string(partial: "messages/message", locals: { message: @message }),
      sender_id: @message.user.id
    )
    # instead of redirecting, we send a 200 status code with no view, so page doesn't reload when user submit a message
    head :ok
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
