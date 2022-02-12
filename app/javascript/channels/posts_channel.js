import consumer from "./consumer";

const initPostsCable = () => {
  const messagesContainer = document.getElementById("messages");
  if (messagesContainer) {
    const id = messagesContainer.dataset.postsId;

    consumer.subscriptions.create(
      { channel: "PostsChannel", id: id },
      {
        received(data) {
          messagesContainer.insertAdjacentHTML("beforeend", data);
        },
      }
    );
  }
};

export { initPostsCable };
