import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
  const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    // Create a HTML element for your custom marker
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('https://www.flaticon.com/svg/vstatic/svg/188/188418.svg?token=exp=1620211835~hmac=70165ccdacdecfa0ae58e7476d1a32bb')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '20px';
      element.style.height = '10px';
    // Pass the element as an argument to the new marker
    new mapboxgl.Marker(element)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
  });
    fitMapToMarkers(map,markers)
  }
};

export { initMapbox };
