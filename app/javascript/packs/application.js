import 'bootstrap';
import { bindNewMemoryGeolocation } from '../components/geolocation';
import { bindShareButtonClick } from '../components/share';
if ("geolocation" in navigator) {
  bindNewMemoryGeolocation();
}
bindShareButtonClick();

