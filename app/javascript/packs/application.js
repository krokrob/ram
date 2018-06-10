import 'bootstrap';
import '@mdi/font/scss/materialdesignicons.scss';
import { bindNewMemoryGeolocation } from '../components/geolocation';
import { bindSearchButtonClick } from '../components/search';
import '../components/popover';

if ("geolocation" in navigator) {
  bindNewMemoryGeolocation();
}
bindSearchButtonClick();
bindShareButtonClick();
