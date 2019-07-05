import "bootstrap";
import { initSweetalert } from '../plugins/init_sweetalert';


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
