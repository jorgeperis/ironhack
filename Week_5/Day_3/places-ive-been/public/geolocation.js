$(document).ready( function(){
var map;
var infowindow;
var geocoder = new google.maps.Geocoder();
var addressInfo;


if ("geolocation" in navigator){
  navigator.geolocation.getCurrentPosition(onLocation, onError);
}

function saveToStorage (position) {
  var i = localStorage.length;
  localStorage.setItem(i,JSON.stringify(position));
}

function loadFromStorage () {
  for ( key_name in localStorage) {
    createMarker(JSON.parse(localStorage.getItem(key_name)));
  }
}

function onLocation(position){
  var myPosition = {
    lat: position.coords.latitude,
    lng: position.coords.longitude
  };

  createMap(myPosition);
}

function onError(err){
  console.log("What are you using, IE 7??", err);
}

function createMap(position){
  var mapOptions = {
    center: position,
    zoom: 17
  };
  map = new google.maps.Map($('#map')[0], mapOptions);
  loadFromStorage ();
  if (localStorage.length == 0) {
    codeLatLng(position);
  }
  setupAutocomplete();
}

function codeLatLng(position) {
  var latlng = new google.maps.LatLng(position.lat, position.lng);
  geocoder.geocode({'latLng': latlng}, function(results, status) {
   if (status == google.maps.GeocoderStatus.OK) {
     addressInfo = results[0].formatted_address;
     saveToStorage(ToSave(position,addressInfo));
     createMarker(ToSave(position,addressInfo));
   }
  });
}


function createMarker(position) {
  var marker = new google.maps.Marker({
   position: position,
   map: map
 });

 marker.addListener('click', function() {
   setInfoWindow(position['info']);
   infowindow.open(map, marker);
 });
}

function setInfoWindow (place) {
  infowindow = new google.maps.InfoWindow({
      content: place
    });
}

function setupAutocomplete(){
  var input = $('#get-places')[0];
  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.addListener('place_changed', function(){
    var place = autocomplete.getPlace();
    if (place.geometry.location) {
      map.setCenter(place.geometry.location);
      map.setZoom(17);
      var save = hashToSave(place.geometry.location,place.formatted_address);
      saveToStorage(save);
      createMarker(save);
    } else {
      alert("The place has no location...?")
    }
  });
}

  function hashToSave(location,address) {
    save = {lat: location.lat(),
            lng: location.lng(),
            info: address
          };
    return save;
  }
  function ToSave(location,address) {
    save = {lat: location.lat,
            lng: location.lng,
            info: address
          };
    return save;
  }
});
