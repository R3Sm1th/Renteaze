import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map", though stimulus
export default class extends Controller {
  // These are the values we pass to the DOM, we can also call it
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    // hide the mapbox token
    mapboxgl.accessToken = this.apiKeyValue
    console.log("hello")
    // In JVscript, keyword this. makes the map a instance variable(@), so it can be accessed below
    this.map = new mapboxgl.Map({
      // make container for the map to exist in, this.element refers to the stimulus controller's HTML element instance variable (in flats index.html)
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    // create 2 private methods for the markers
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  // private method for adding markers, starts with a hashtag
  #addMarkersToMap() {
    // iterate through each Hash values of markers (incl. lng and lat)
    this.markersValue.forEach((marker) => {
      // add pop up for the markers here, which we can pass in as html
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker()
        // look for dynamic marker value: lng and lat, rather than static, which is achieved by passing the keys as array in the static values
        .setLngLat([ marker.lng, marker.lat ])
        // set popup to the marker(s)
        .setPopup(popup)
        // this.map again refers to the instance variable of map, you can now add markers on your map!
        .addTo(this.map)
    })
  }

  // private method for zooming into the markers
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    // when we extend the bounds we are including all the markers in the bound, so you can see all the markers in one view
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    // after bounds, we are passing options to customize the view
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 450 })
  }

}
