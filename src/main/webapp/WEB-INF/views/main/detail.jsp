<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>			
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

		
<style>

.view-page{
/* 	position: relative;
    padding-bottom: 56.25%;
    height: 0; */
}
.profile-box{
	height :84px;
	background: #000;
}

.chat-pane{
	position: relative;
	height : 180px;
	/* height: calc(84vh - 56.25vw - 68px - 71px); */
}

.chat-list {
    overflow-y: auto;
    overflow-x: hidden;
    height: 100%;
    padding-bottom: 10px;
}


#chat-client{
	border: 1px solid #e9e9e9;
	box-sizing: border-box;
	/* padding: 10px; */
	height: 304px;
}
#chat-list-box{
    overflow-y: auto;
    overflow-x: hidden;
    height: 100%;
    padding-bottom: 10px;
    min-height: 300px;
}
#chat-panel{
    margin-top: 10px;
}
  #map {
      	
      box-sizing: content-box;
  } 
    
</style>

<link href="/Motherbirds/resource/css/ion.rangeSlider.css" type="text/css" rel="stylesheet" media="screen,projection">
<link href="/Motherbirds/resource/css/ion.rangeSlider.skinFlat.css" type="text/css" rel="stylesheet" media="screen,projection">

<main id="main">
<div class="container">
<%-- ${n.id }</br>
${n.title }</br>
${n.content }</br>
${n.memberId }</br> --%>
	<div class="row">


	<!-- <div class="carousel carousel-slider center" data-indicators="true">
		<div class="carousel-fixed-item center">
		<a class="btn waves-effect white grey-text darken-text-2">button</a>
		</div>

		<div class="carousel-item amber white-text" href="#two!">
		<h2>Vote Panel</h2>
		<p class="white-text">This is your vote panel</p>
		<form action="#">
			<p>
			<input class="with-gap" name="group1" type="radio" id="test1"  />
			<label for="test1">Green</label>
			</p>
				<p>
			<input class="with-gap" name="group1" type="radio" id="test2"  />
			<label for="test2">Green</label>
			</p>
			<p>
			<input class="with-gap" name="group1" type="radio" id="test3"  />
			<label for="test3">Green</label>
			</p>
			<p>
			<input class="with-gap" name="group1" type="radio" id="test4"  />
			<label for="test4">Green</label>
			</p>
		<p>
			<input class="with-gap" name="group1" type="radio" id="test5"  />
			<label for="test5">Green</label>
			</p>
		
		</form>
		</div>
		<div class="carousel-item green white-text" href="#three!">
		<h2>VoteResult Panel</h2>
		<p class="white-text">This is your vote result panel</p>
		<div id="range_01" class="irs"></div>
		<div id="range_02" class="irs"></div>
		<div id="range_03" class="irs"></div>
		<div id="range_04" class="irs"></div>
		<div id="range_05" class="irs"></div>
		</div>

		<div class="carousel-item" id="map">
		<h2>Map Panel</h2>
		</div>
		
	</div> -->
 <div class="slider">
    <ul class="slides">
      <li>
        <img src="http://lorempixel.com/580/250/nature/1"> <!-- random image -->
        <div class="caption center-align">
          <h3>This is our big Tagline!</h3>
          <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        </div>
      </li>
      <li>
        <img src="http://lorempixel.com/580/250/nature/2"> <!-- random image -->
        <div class="caption left-align">
			<div id="range_01" class="irs"></div>
			<div id="range_02" class="irs"></div>
			<div id="range_03" class="irs"></div>
			<div id="range_04" class="irs"></div>
			<div id="range_05" class="irs"></div>
        </div>
      </li>
      <li>
        <img src="http://lorempixel.com/580/250/nature/3"> <!-- random image -->
        <div class="caption right-align">
          <h3>Right Aligned Caption</h3>
          <h5 class="light grey-text text-lighten-3">Here's our small slogan.</h5>
        </div>
      </li>
      <li>
        <!-- <img src="http://lorempixel.com/580/250/nature/4"> random image -->
        <div id="map" class="caption center-align">
     
        </div>
      </li>
    </ul>
  </div>
	<script type="text/javascript" src="/Motherbirds/resource/js/ion.rangeSlider.js"></script>


		<div>
			<input id="conn-button" type="button" value="접속" />
		</div>
		<div id="chat-client">
			<div id="chat-list-box">
				<ul id="chat-list" class="collection">
				<c:forEach var="v" items="${n.comments }">
				<li class="collection-item">[${v.memberId }] ${v.comment} </li>
				</c:forEach>

				</ul>
			</div>
			<div id="chat-panel" >
				<form id="comment-add-form" action="freeBoard-comment-add" method="post">
					<textarea id="chat-input"name="message"></textarea>
					<input id="send-button" type="button" value="전송"  />
				
					<input type="hidden" name="boardId" value=${n.id }>
					<input type="hidden" name="memberId" value=<security:authentication property="name"/>>
				</form>
			</div>
			
		</div>
		<div class="userlistbox">

		</div>

	</div>
</div>




     

    <script>
    
    
function onCreate(){
	
 		var count = 0;
		
		var text = $("#comment-add-form").find("input");
		
	
		var tt= text.val();
		tt = tt.trim();//공백 제거
        
        if(!tt){
            alert("내용이 없습니다.");
            text.focus();//해당입력란으로 포커싱
            return;
        }
		

		var data = $("#comment-add-form").serialize();
	
	
		
		$.post("board-comment-add", data, function(z) {
		
			if(z =="1"){
			
/* 				page(1);
	 		 	count++;
				if(count <100)onCreate();   */
			}
			
		}); 
		
	}
	
    $("#range_01").ionRangeSlider({
    	
    	min :0,
    	max:100,
    	from:30,
    	 from_fixed: true,
    	    to_fixed: true
    });
    $("#range_02").ionRangeSlider({
    	
    	min :0,
    	max:100,
    	from:30,
    	 from_fixed: true,
    	    to_fixed: true
    });
    $("#range_03").ionRangeSlider({
    	
    	min :0,
    	max:100,
    	from:30
    });
    $("#range_04").ionRangeSlider({
    	
    	min :0,
    	max:100,
    	from:30
    });
    $("#range_05").ionRangeSlider({
    	
    	min :0,
    	max:100,
    	from:30
    });
      var map;
      function initMap(x,y) {
    
        map = new google.maps.Map(document.getElementById('map'), {
       
          center: new google.maps.LatLng(x,y),
          zoom: 13
        });
        initMarker(x,y)
        initMarker(37.5635,127.0189392);
        
      }
      
      function initMarker(x,y){
    	     var marker = new google.maps.Marker({
    	            position: new google.maps.LatLng(x,y),
    	            map: map
    	          });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrt3JIkcXTts0sgMlRYN47SEReOOGl3lQ&callback=initMap"
    async defer></script>

</main>

<security:authentication property="name" var="loginID"/>

<script type="text/javascript">
	$(function(){
		
		console.log('${loginID}');
		
		
		var connButton = $("#conn-button");
		var sendbutton = $("#send-button");
		var chatList = $("#chat-list");
		var wsocket = null;

		var random = Math.floor(Math.random() * 1000) + 1;
		
		var latitude = null;
	    var longitude = null;
	    
	    
	    function loadDemo() {
	        if (navigator.geolocation) {
	          /*   alert("Your browser supports geolocation service."); */
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
	        navigator.geolocation.getCurrentPosition(updateLocation, handleLocationError);
	        //navigator.geolocation.watchPosition(updateLocation, handleLocationError, geo_options);
	 
	        
	    }

	    function updateLocation(position) {
	        var _latitude = position.coords.latitude;
	        var _longitude = position.coords.longitude;
	        var accuracy = position.coords.accuracy;

	        latitude = _latitude;
	        longitude = _longitude;
	    /*     document.getElementById("latitude").innerHTML = "latitude: " + latitude;
	        document.getElementById("longitude").innerHTML = "longitude: " + longitude;
	        document.getElementById("accuracy").innerHTML = "accuracy: " + accuracy; */
	        
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
	    loadDemo();
	    
	    
		sendbutton.click(function(){
			var chatIput = $("#chat-input");
		

			var msg = {
					    type: "message",
					    text: chatIput.val(),
					    id:  '${loginID}',
					    room:'${n.id}',
					    date: Date.now()
			};
			


			
			wsocket.send(JSON.stringify(msg));
			onCreate();
			
			$("#chat-list-box").scrollTop(10000);
			chatIput.val('');
			chatIput.focus(); 
		});

		connButton.click(function(event){
		
			wsocket = new WebSocket("ws://125.129.60.149:8080/Motherbirds/chat/chatserver");
			wsocket.onopen = function(event){
				//alert("접속 되었습니다.");
				console.log(event);
				var msg = {
					    type: "enter",
					    text: "'${n.id}'접속했습니다",
					    id:  '${loginID}',
					    room:'${n.id}',
					    date: Date.now(),
						latitude :latitude,
			     		longitude :longitude
				};
				
				wsocket.send(JSON.stringify(msg));
				getloc();
			};

			wsocket.onmessage = function(event){
		 		var li = document.createElement("li");
				var data = JSON.parse(event.data);
				
				
				console.log(data.type);

				switch (data.type) {
					case "message":
						//<li class="collection-item">[${v.memberId }] ${v.comment} </li>
						var li = "<li class=collection-item>["+ data.id +"]"+ data.text+"</li>";
						chatList.append(li); 
						break;
				
					case "userlist":

						var ul = "";
						for(i = 0; i < data.userlist.length;i++){
							ul += data.userlist[i].id +"<br>";
						}
						$(".userlistbox").text(ul);
						break;
					default:
						break;
				}
	/* 			
				console.log(data);
				li.textContent = "[" + data.id + "]"+data.text;
				
				chatList.append(li); 		
				
				console.log($("#chat-list-box").height());
				console.log($("#chat-list-box").scrollTop());
				$("#chat-list-box").scrollTop(10000);
				var chatIput = $("#chat-input");
				chatIput.val('');
				chatIput.focus(); */
				
				
				
				
			};

			wsocket.onclose = function(){
				alert("접속이 끊겼습니다.");
			
			
			};
		});
	 });
</script>
<script>

</script>