import 'bootstrap';
import { bindNewMemoryGeolocation } from '../components/geolocation';
import { bindSearchButtonClick } from '../components/search';
if ("geolocation" in navigator) {
  bindNewMemoryGeolocation();
}
bindSearchButtonClick();
