// app/javascript/channels/messages_channel.js
import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const messagesElement = document.getElementById('messages');
  if (messagesElement) {
    const chatId = messagesElement.dataset.chatId;

    const subscription = consumer.subscriptions.create(
      { channel: "MessagesChannel", chat_id: chatId },
      {
        connected() {
          console.log("Connected to MessagesChannel for chat " + chatId);
        },

        disconnected() {
          console.log("Disconnected from MessagesChannel");
        },

        received(data) {
          const parser = new DOMParser();
          const doc = parser.parseFromString(data, 'text/html');
          const message = doc.body.firstChild;
          messagesElement.appendChild(message);
        },

        speak(message) {
          this.perform('speak', { message: message });
        }
      }
    );

    const form = document.querySelector('form');
    form.addEventListener('submit', event => {
      event.preventDefault();
      const messageInput = form.querySelector('textarea');
      subscription.speak(messageInput.value);
      messageInput.value = '';
    });
  }
});
