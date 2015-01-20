/*
 * map.js
 * This file is the Javascript for the map embedded in any page
 */

var map = null;
var markers = [];
var infoWindow = null;

/*
 * Initializes a new map when the page loads
 */
function initialize() {
  var mapOptions = {
    center: {lat: 33.2109715, lng: -87.5386825},
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.SATELLITE,
    streetViewControl: false,
    minZoom: 15,

  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  infoWindow = new google.maps.InfoWindow({});
  fetchMarkers(map);
}


function fetchMarkers(map) {
  $.ajax({
    url: $('.map-canvas').attr("data-api"),
    success: function(resp){ addMarkers(map, resp); },
    error: function() { alert("Something went wrong"); }
  });
}

function addMarkers(map,resp) {
  markers = [];
  
  // canned response until I build the API
  resp = {
    "stories": [{
      "id" : "1",
      "lat" : "33.2135434",
      "lng" : "-87.5305181",
      "audio" : "/audios/sample_mpeg4.mp4",
      "storyteller" : "Cindy Rudd",
      "title" : "An Awkward Encounter with Gene Stallings",
      "date" : "November 18, 2000"
    }]
  };

  _.each(resp.stories, function(story) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(story.lat, story.lng)
    });
    // monkey patch the marker to contain our API data 
    marker["api-data"] = story;

    // masterlist of markers
    markers.push(marker);
    marker.setMap(map);
  });
}

function openInfoWindow(marker) {
  var content = '<div id="infoWindowContent">'
    + '<div id="audio">'
}
