<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>Starter Template - Materialize</title>
 <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- CSS  -->
</head>

<style>

   #map {
      	width:100%;
        height: 300px;
      }
	#content .container .row {
	    /* margin-bottom: 0; */
	    padding-left: 10px;
	}
</style>



<body onload="loadDemo()">
<div class="container">
  <nav>
    <div class="nav-wrapper">
      <div class="col s12">
        <a href="#!" class="breadcrumb">First</a>
        <a href="#!" class="breadcrumb">Second</a>
        <a href="#!" class="breadcrumb">Third</a>
      </div>
    </div>
  </nav>
  
<p id="latitude">?</p>
<p id="longitude">?</p>
<p id="accuracy">?</p>

<div id="map"></div>


<div class="card-content">                    
                    <a class="btn-floating activator btn-move-up waves-effect waves-light darken-2 right">
                        <i class="mdi-editor-mode-edit"></i>
                    </a>

                    <div class="row">
                      <div class="col s12 m6">
                        <form action="reg" method="post"class="contact-form">
                          <div class="row">
                            <div class="input-field col s12">
                              <input id="name" type="text">
                              <label for="first_name" class="">Name</label>
                            </div>
                          </div>
                          <div class="row">
                            <div class="input-field col s12">
                              <input id="email" type="email">
                              <label for="email" class="">Email</label>
                            </div>
                          </div>
                          <div class="row">
                            <div class="input-field col s12">
                              <input id="website" type="text">
                              <label for="website" class="">Website</label>
                            </div>
                          </div>
                          <div class="row">
                            <div class="input-field col s12">
                              <textarea id="message" class="materialize-textarea"></textarea>
                              <label for="message" class="">Message</label>
                            </div>
                            <div class="row">
                              <div class="input-field col s12">
                                <button class="btn cyan waves-effect waves-light right" type="submit" name="action">Send
                                  <i class="mdi-content-send right"></i>
                                </button>
                              </div>
                            </div>
                          </div>
                        </form>
                      </div>                      
                      <div class="col s12 m6">
                        <ul class="collapsible collapsible-accordion" data-collapsible="accordion">
                          <li>
                            <div class="collapsible-header"><i class="mdi-communication-live-help"></i> FAQ</div>
                            <div class="collapsible-body" style="">
                              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            </div>
                          </li>
                          <li class="active">
                            <div class="collapsible-header active"><i class="mdi-communication-email"></i> Need Help?</div>
                            <div class="collapsible-body" style="display: block;">
                              <p>We welcome your inquiries at the email address <a mailto="support@geekslabs.com">support@geekslabs.com</a>.We will get in touch with you soon.</p>
                              <p>As a creative studio we believe no client is too big nor too small to work with us to obtain good advantage.By combining the creativity of artists with the precision of engineers we develop custom solutions that achieve results. <a href="http://themeforest.net/user/geekslabs/portfolio" target="_blank">See our work.</a></p>
                            </div>
                          </li>
                          <li>
                            <div class="collapsible-header"><i class="mdi-editor-insert-emoticon"></i> Testimonial</div>
                            <div class="collapsible-body" style="">
                              <blockquote>Fantastic product, my sites all run super fast and the support is excellent!<br>The website you designed helped a lot! </blockquote>
                            </div>
                          </li>
                        </ul>
                      </div>
                    </div>

                </div>



    <script>
      var map;
      function initMap(x,y) {
    
        map = new google.maps.Map(document.getElementById('map'), {
       
          center: new google.maps.LatLng(x,y),
          zoom: 18
        });
        
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(x,y),
            map: map
          });
        

      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrt3JIkcXTts0sgMlRYN47SEReOOGl3lQ&callback=initMap"
    async defer></script>

		

	</div>
</body>

<script>
    function loadDemo() {
        if (navigator.geolocation) {
            //alert("Your browser supports geolocation service.");
            getloc();
        } else {
            alert("Your browser doesn't support geolocation service.");
        }
    }
    var geo_options = {
    		  enableHighAccuracy: true, 
    		  maximumAge        : 30000, 
    		  timeout           : 20000
    		};
    
    function getloc() {
        //navigator.geolocation.getCurrentPosition(updateLocation, handleLocationError);
        navigator.geolocation.watchPosition(updateLocation, handleLocationError, geo_options);
 
        
    }

    function updateLocation(position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;
        var accuracy = position.coords.accuracy;

        document.getElementById("latitude").innerHTML = "latitude: " + latitude;
        document.getElementById("longitude").innerHTML = "longitude: " + longitude;
        document.getElementById("accuracy").innerHTML = "accuracy: " + accuracy;
        
        initMap(latitude,longitude);
        
   		
    }

    function handleLocationError(error) {
        switch(error.code) {
        case error.UNKNOWN_ERROR:
            alert("unknown error");
            break;
        case error.PERMISSION_DENIED:
            alert("Permission to use Geolocation was denied");
            break;
        case error.POSITION_UNAVAILABLE:
            alert("unavailable");
            break;
        case error.TIMEOUT:
            alert("timeout error");
            break;
        }
    }

</script>
</head>