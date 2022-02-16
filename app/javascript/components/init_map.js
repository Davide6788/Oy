import mapboxgl from "mapbox-gl"; // or "const mapboxgl = require('mapbox-gl');"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

const initMapbox = () => {
  const mapElement = document.getElementById("map");

  if (mapElement) {
    const markers = JSON.parse(mapElement.dataset.markers);

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: "map", // container ID
      style: "mapbox://styles/victorpln/ckz7eim5k006l14mif3mo037f",
    });

    map.addControl(
      new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl,
        placeholder: 'Search'
      })
    );

    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach((marker) => bounds.extend([marker.lng, marker.lat]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
    };

    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infowindow);

      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundColor = `$light-gray`;
      element.style.backgroundSize = 'contain';
      element.style.width = '1rem';
      element.style.height = '2rem';

      new mapboxgl.Marker(element)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
  }
}

export { initMapbox }
