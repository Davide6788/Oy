import consumer from "./consumer";

const initMessageroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.messageroomId;

    consumer.subscriptions.create({ channel: "MessageroomChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initMessageroomCable };
