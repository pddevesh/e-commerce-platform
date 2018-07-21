<!DOCTYPE html>
<html> 
<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
  <title>Google Maps Multiple Markers</title> 
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBs5ys4bKLGveeummPc7dFDerrFjcZLgJc&sensor=false" 
          type="text/javascript"></script>
</head> 
<body>
  <div id="map" style="width:100%; height: 900px;"></div>

  <script type="text/javascript">
    var locations = [
      ['Amazon Chennai Office', 13.0487415, 80.2434535, 4],
      ['Amazon Banglore office', 12.973689, 77.5523482, 5],
      ['Amazon hyderabad office', 17.44348, 78.3718221, 3],
      ['Amazon Delhi office', 28.6222707, 77.0357823, 2],
      ['Amazon Mumbai office', 19.0727458, 72.9111794, 1]
    ];

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 5,
      center: new google.maps.LatLng(13.0487415, 80.2434535),
      mapTypeId: google.maps.MapTypeId.HYBRID
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
  </script>
</body>
</html>