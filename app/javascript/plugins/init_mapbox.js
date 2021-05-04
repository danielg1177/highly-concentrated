import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    const markers = JSON.parse(mapElement.dataset.markers)
    markers.forEach((marker) => {

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contian';
      element.style.width = '45px';
      element.style.height = '45px';

      new mapboxgl.Marker()
      .setLnglat([marker.lng, marker.lat])
      .addTo(map);
    });
    fitMapToMarkers(map,markers)
    map.addControl(new Mapbox({accessToken: mapboxgl.accessToken,mapboxgl: mapboxgl}));
  }
};

export { initMapbox };
