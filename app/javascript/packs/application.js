// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
// import "slick-carousel/slick/slick.css";
// import "slick-carousel/slick/slick-theme.css";


// Internal imports, e.g:
<<<<<<< HEAD
// import { initCarousel } from '../components/carousel';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initCarousel();
=======
import { initMapbox } from '../plugins/init_mapbox';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
   initMapbox();
>>>>>>> 323218a52b5e4a0fb2ed73d04f38950e57952d4a
});
