import 'bootstrap';
import { bindNewMemoryGeolocation } from '../components/geolocation'
if ("geolocation" in navigator) {
  bindNewMemoryGeolocation();
}
