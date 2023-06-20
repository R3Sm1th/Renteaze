import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"


// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  //static targets are event listeners
  static targets = ["messages"]
  static values = {
    chatroomId: Number,
    currentUserId: Number
  }

  connect() {
    // allow users to connect to radio tower via websocket, the connect method allows people to subscribe as soon as they are on the show page
    // debugging for jvscript - check if the chatroom number matches the console log, if not, ask TA tmrw
    // create a channel with the key and value, the value id is provided in the show controller (params)
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue},
      // the hash tag is calling the private method, like in
      { received: data => {this.#insertMessageAndScrollDown(data)}}
    )
    console.log(`Connected to the ActionCable channel with the id ${this.chatroomIdValue}`)
  }

  // unsubscribe users who left the chat, prevent background listeners from pilling up
  disconnect(){
    this.channel.unsubscribe()
  }

  resetForm(event) {
    event.target.reset()
  }

  // private method below
  #insertMessageAndScrollDown(data){
    // logic to know if the sender is the current user
    const currentUserIsSender = this.currentUserIdValue === data.sender_id

    // Creating the whole message from the `data.message` String
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)

    // Inserting the `message` in the DOM
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  #buildMessageElement(currentUserIsSender, message) {
    return `
      <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
        <div class="${this.#userStyleClass(currentUserIsSender)}">
          ${message}
        </div>
      </div>
    `
  }
  // for the buildmessageelement function, we call two other functions to return the relevant classes to position and styling for message
  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }
}
