import consumer from "./consumer";

const initAddStampCable = () => {
  const stampContainer = document.getElementById("stamp-container");
  if (stampContainer) {
    const id = stampContainer.dataset.chatroomId;

    consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: id },
      {
        received(data) {

          stampContainer.innerHTML = data
          const stampCounter = stampContainer.querySelectorAll(".stamp-active").length
          const reward = document.querySelector(".reward-discount")
          console.log(stampCounter)
          if (stampCounter == 10) {
            console.log('hello world')
            const flashBox = document.querySelector('.flash-box')
            flashBox.insertAdjacentHTML("beforeend", `<div class='alert alert-info alert-dismissible fade show m-1' role='alert'>Congrats ! You've reached your reward: ${reward.textContent} ! <button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div >`)
          }
        },
      }
    );
  }
};

export { initAddStampCable };
