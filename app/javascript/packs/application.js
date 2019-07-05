import "bootstrap";
import { initSweetalert } from '../plugins/init_sweetalert';
// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

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
