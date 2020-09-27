// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)


// 1. Select all the grids of stars likes
const clickmeStar = document.querySelectorAll(".clickable");


const alvo = (event) => {
  event.currentTarget.classList.toggle("active");
};

const escuta = (star) => {
  star.addEventListener("click", alvo);
};

clickmeStar.forEach(escuta);
