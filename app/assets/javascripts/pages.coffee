locationss = []

getMosques = (callback) ->
  if callback == undefined
    return
  $.ajax
    type: 'GET'
    url: '/api/v1/mosques'
    cache: false
    success: (data) ->
      callback data
      return
  return

$map = $('#map-canvas')
map = undefined
lat = undefined
lng = undefined
color = '#007bff'
getMosques (mosques) ->
  console.log mosques
  # console.log(mosques[0].latitude)
  infowindow = new (google.maps.InfoWindow)
  marker = undefined
  i = undefined
  map = document.getElementById('map-canvas')
  lat = parseFloat(mosques[0].latitude)
  lng = parseFloat(mosques[0].longitude)
  myLatlng = new (google.maps.LatLng)(lat, lng)
  mapOptions = 
    zoom: 5
    scrollwheel: false
    center: myLatlng
    mapTypeId: google.maps.MapTypeId.ROADMAP
    styles: [
      {
        'featureType': 'administrative'
        'elementType': 'labels.text.fill'
        'stylers': [ { 'color': '#444444' } ]
      }
      {
        'featureType': 'landscape'
        'elementType': 'all'
        'stylers': [ { 'color': '#f2f2f2' } ]
      }
      {
        'featureType': 'poi'
        'elementType': 'all'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'road'
        'elementType': 'all'
        'stylers': [
          { 'saturation': -100 }
          { 'lightness': 45 }
        ]
      }
      {
        'featureType': 'road.highway'
        'elementType': 'all'
        'stylers': [ { 'visibility': 'simplified' } ]
      }
      {
        'featureType': 'road.arterial'
        'elementType': 'labels.icon'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'transit'
        'elementType': 'all'
        'stylers': [ { 'visibility': 'off' } ]
      }
      {
        'featureType': 'water'
        'elementType': 'all'
        'stylers': [
          { 'color': color }
          { 'visibility': 'on' }
        ]
      }
    ]
  map = new (google.maps.Map)(map, mapOptions)
  i = 0
  while i < mosques.length
    # mosquesArray = [mosques[i].name, mosques[i].latitude, mosques[i].longitude];
    # console.log(mosques[i].address);
    marker = new (google.maps.Marker)(
      position: new (google.maps.LatLng)(parseFloat(mosques[i].latitude), parseFloat(mosques[i].longitude))
      map: map
      animation: google.maps.Animation.DROP
      title: 'Hello There !')
    google.maps.event.addListener marker, 'click', do (marker, i) ->
      contentMosque = '<h2>' + mosques[i].name + '</h2> <p>' + mosques[i].address + '</p>' + '<img src="' + mosques[i].avatar + '" width="100">'
      ->
        infowindow.setContent contentMosque
        infowindow.open map, marker
        return
    i++
  return