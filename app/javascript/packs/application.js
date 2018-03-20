import 'bootstrap';
import { bindNewMemoryGeolocation, initGeolocation } from '../components/geolocation'

if (initGeolocation()) {
  bindNewMemoryGeolocation();
}

