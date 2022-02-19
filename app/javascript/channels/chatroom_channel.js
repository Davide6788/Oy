import consumer from "./consumer";

const initChatroomCable = () => {
  const postsContainer = document.getElementById("messages");
  if (postsContainer) {
    const id = postsContainer.dataset.chatroomId;

    consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: id },
      {
        received(data) {
          postsContainer.insertAdjacentHTML("afterbegin", data);
        },
      }
    );
  }
};

export { initChatroomCable };
