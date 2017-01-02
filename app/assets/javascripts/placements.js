$(document).ready(function() {
  new google.maps.places.Autocomplete(
    /** @type {HTMLInputElement} */($('#placement_address')[0]),
    { types: ['geocode'] }
  );
})
