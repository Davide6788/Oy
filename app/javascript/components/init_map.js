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
      map.fitBounds(bounds, { padding: 70, maxZoom: 15, minZoom: 12, duration: 0 });
    };

    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infowindow);

      const element = document.createElement('div');
      element.className = 'marker';
      const markerPoints = document.createElement('p');
      markerPoints.className = 'marker-points'
      markerPoints.textContent = `${marker.card_points != null ? marker.card_points : 0}/${marker.card_total != null ? marker.card_total : 10}`;
      const markerLogo = document.createElement('img');
      markerLogo.className = 'marker-logo'
      markerLogo.src = `${marker.image_url}`;
      element.appendChild(markerLogo);
      element.appendChild(markerPoints);
      // element.style.backgroundImage = `url('${marker.image_url}')`;

      // element.style.backgroundSize = 'contain';
      element.style.width = '2rem';
      element.style.height = '2rem';
      element.style.borderRadius = '50%';

      new mapboxgl.Marker(element)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
  }
}

export { initMapbox }
