/*
 * map.js
 * This file is the Javascript for the map embedded in the homepage
 */

var map = null;
var markers = [];
var infoWindow = null;
var markerImagePath = "";

/*
 * Initializes a new map when the page loads
 */
function initialize() {
  $.ajaxSetup({
    accepts: {
      json: 'application/json'
    }
  });
  
  markerImagePath = $("#marker_image").attr('src');
  
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
    // url: $('.map-canvas').attr("data-api"),
    url: "/locations.json",
    // header: { "Accept": "application/json" },
    success: function(resp){ addMarkers(map, resp); },
    error: function(resp) { console.log(resp); alert("Something went wrong"); }
  });
}

function addMarkers(map,resp) {
  markers = [];
  
  // console.log(resp);

  _.each(resp.locations, function(loc) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(loc.latitude, loc.longitude),
      icon: markerImagePath
    });

    // masterlist of markers
    markers.push(marker);
    marker.setMap(map);

    // register a click event, close on the loc object
    google.maps.event.addListener(marker, 'click', function() {
      map.panTo(marker.getPosition());
      getStories(marker, loc);
    });
  });
}

function getStories(marker, loc){
  $.ajax({
    url: ("/locations/" + loc.id + "/stories.json"),
    success: function(resp){ addStories(resp, loc, marker); },
    error: function() { alert("Something went wrong"); }
  });
}

function addStories(resp, loc, marker) {
  var stories = resp.stories;
  console.log(resp);
  // canned response until the API is built

  // get the container for the stories
  var content = $("<div></div>");
  content.append("<h2>" + loc.name + "</h2>");
  
  // go through and add story elements
  _.each(stories, function(story) {
    content.append(storyToHtml(story));
  });
  
  infoWindow.close();

  console.log("clicked " + loc.id);
  // $('#content').append("<p>clicked " + loc.id + "</p>");
  console.log("threeSixtyPlayer started");
  infoWindow.setContent(content.html());
  
  infoWindow.open(map, marker);
  threeSixtyPlayer.init();
}

function storyToHtml(story) {
  return _.template(
    '<div class="story" id="<%= story.id %>">'   + 
      '<div class="ui360">'                      +
        '<a href="<%= story.audio %>"></a>'      + 
      '</div>'                                   + 
      '<div class="story-info">'                 +
      '<h3><%= story.title %></h3>'              + 
      '<h4>Told by <%= story.storyteller %></h4>'+
      '<p class="date"><%= story.date %></p>'    +
    '</div>')({story: story});
}

/*
function openInfoWindow(marker) {
  var content = '<div id="infoWindowContent">'
    + '<div id="audio">'
}
*/
