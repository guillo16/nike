import "bootstrap";
import { initSweetalert } from '../plugins/init_sweetalert';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

initSweetalert('#sweet-alert-demo', {
  title: "Are you sure?",
  text: "This action cannot be reversed",
  icon: "warning",
  buttons: true,
  dangerMode: true,

}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-link');
    link.click();
  }
});
