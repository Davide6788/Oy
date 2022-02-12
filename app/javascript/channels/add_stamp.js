import consumer from "./consumer";

const initAddStampCable = () => {
  const stampContainer = document.getElementById("stamp-container");
  if (stampContainer) {
    const id = stampContainer.dataset.chatroomId;
    console.log(id);

    consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: id },
      {
        received(data) {
          console.log(data)
          stampContainer.innerHTML = data
        },
      }
    );
  }
};

export { initAddStampCable };
