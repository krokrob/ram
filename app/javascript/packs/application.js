import 'bootstrap';
import { bindNewMemoryGeolocation, initGeolocation } from '../components/geolocation'

if (initGeolocation()) {
  console.log('geoloc possible');
  bindNewMemoryGeolocation();
}

