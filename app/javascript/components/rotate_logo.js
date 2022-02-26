import { event } from "jquery";

// console.log('test ok');

const rotationLogo = () => {
  // console.log("function entered")
  const logo = document.getElementById("navbarDropdown");
  // const div = document.querySelector(".nav-item-dropdown");
  logo.addEventListener("click", (event) => {
    // console.log("hello")
    logo.classList.toggle("active")
    // console.log("world")
  })
}




export { rotationLogo };
