var map;
var canvas;

$(function(){
  $('button').click(send_json_request_to_rails);
});





function send_json_request_to_rails()

{
  $.ajax({
    type: "POST",
    url: "/map/data"
    
  }).done(function(msg) {
    display_graph(msg);
  });
}



function display_graph(maps)
{
  Morris.Bar({
    element: 'mapgraph',
    data: maps,
    xkey: 'zip',
    ykeys: ['kwh'],
    labels: ['kwh', 'zip']
  });
}








function display_map(lat, long, zoom)
{
  var mapOptions = {
    center: new google.maps.LatLng(lat, long),
    zoom: zoom,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  canvas = $('#map_canvas')[0];
  map = new google.maps.Map(canvas, mapOptions);
}

function add_marker(lat, long, title)
{
  var latlng = new google.maps.LatLng(lat, long);
  var marker = new google.maps.Marker({position: latlng, map: map, title:title});
}