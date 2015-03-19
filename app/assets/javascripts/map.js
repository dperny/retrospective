/*
 * map.js
 * This file is the Javascript for the map embedded in the homepage
 */

var map = null;
var markers = [];
var infoWindow = null;

/*
 * Initializes a new map when the page loads
 */
function initialize() {
  $.ajaxSetup({
    accepts: {
      json: 'application/json'
    }
  });
  
  var mapOptions = {
    center: {lat: 33.2109715, lng: -87.5386825},
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
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
    error: function(resp) { console.log(resp), alert("Something went wrong"); }
  });
}

function addMarkers(map,resp) {
  markers = [];
  
  console.log(resp);
  // canned response until I build the API
  /*
  resp = {
    "links" : {
      "locations.stories" : "/locations/{location.id}/stories"
    },
    "locations": [{
      "id" : "1",
      "name" : "Hardaway Hall",
      "latitude" : "33.213157",
      "longitude" : "-87.544732",
      "links" : {
        "stories" : [ "1", "3" ]
      }
    },{
      "id" : "2",
      "name" : "Palmer Hall",
      "latitude" : "33.216990",
      "longitude" : "-87.546491",
      "links" : {
        "stories" : [ "2", "4" ]
      }
    }]
  }
  */

  _.each(resp.locations, function(loc) {
    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(loc.latitude, loc.longitude),
      icon: "/assets/retro_tab_small.png"
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
  /*
  var resp;
  if(loc.id == 1) {
    resp = {
      "stories" : [{
        "id" : "1",
        "date" : "April 2012",
        "title" : "Wow such story",
        "description" : "many description. wow",
        "storyteller" : "Mr Doge",
        "location_id" : loc.id,
        "audio" : "/assets/ogg.ogg"
      },{
        "id" : "3",
        "date" : "the year 9001",
        "title" : "story 2.0",
        "description" : "lern 2 code scrub",
        "storyteller" : "someone else",
        "location_id" : loc.id,
        "audio" : "/assets/wav.wav"
      }]
    }
  } else {
    resp = {
      "stories" : [{
        "id" : "2",
        "date" : "August 1999",
        "title" : "Fight with a Professor",
        "description" : "a description",
        "storyteller" : "Ms. Pea",
        "location_id" : loc.id,
        "audio" : "/assets/ogg.ogg"
      },{
        "id" : "4",
        "date" : "January 1988",
        "title" : "Lesson on the Stairs",
        "description" : "another desc",
        "storyteller" : "Mr. Brown",
        "location_id" : loc.id,
        "audio" : "/assets/wav.wav"
      }]
    }
  }
  return resp.stories
  // addStories(resp, loc);
  */
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
