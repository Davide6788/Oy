import consumer from "./consumer";

const initAddStampCable = () => {
  const stampContainer = document.getElementById("stamp-container");
  if (stampContainer) {
    const id = stampContainer.dataset.userId;
    const reward = stampContainer.dataset.reward;
    const counter = stampContainer.dataset.counter;

    consumer.subscriptions.create(
      { channel: "UserChannel", id: id },
      {
        received(data) {

          stampContainer.innerHTML = data
          const stampCounter = stampContainer.querySelectorAll(".stamp-active").length
          const discount = reward
          if (stampCounter == counter) {
            const flashBox = document.querySelector('.flash-box')
            flashBox.insertAdjacentHTML("beforeend", `<div class='alert alert-info alert-dismissible fade show m-1' role='alert'>Congrats ! You've reached your reward: ${discount} ! <button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div >`)
          }
        },
      }
    );
  }
};

export { initAddStampCable };
