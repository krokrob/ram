import 'bootstrap';
import { bindNewMemoryGeolocation } from '../components/geolocation';
import { bindSearchButtonClick } from '../components/search';
import { bindShareButtonClick } from '../components/share';

if ("geolocation" in navigator) {
  bindNewMemoryGeolocation();
}
bindSearchButtonClick();
bindShareButtonClick();
