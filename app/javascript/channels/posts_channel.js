import consumer from "./consumer";

const initPostsCable = () => {
  const postsContainer = document.getElementById("messages");
  if (postsContainer) {
    console.log("hey");
    const id = postsContainer.dataset.chatroomId;

    consumer.subscriptions.create(
      { channel: "PostsChannel", id: id },
      {
        received(data) {
          postsContainer.insertAdjacentHTML("beforeend", data);
        },
      }
    );
  }
};

export { initPostsCable };
