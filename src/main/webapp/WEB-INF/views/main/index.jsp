<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>			
	 <script type="text/javascript" src="/Motherbirds/resource/js/jquery-1.12.3.min.js"></script>
      <script type="text/css" src="/Motherbirds/resource/css/ion.rangeSlider.css"></script>
      <script type="text/css" src="/Motherbirds/resource/css/ion.rangeSlider.skinFlat.css"></script>

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
      	
      width :100%;
      height: 300px;
  } 
    
</style>
<main id="main">
<div class="container">

	<div class="row">
<%-- 	 <c:forEach var="i" items="${boardList }">
				<div class="col s12 m6 l4">
		

				<div class="card">
					<div class="card-image">
						<a href="detail?c=${i.id }"><img
							src="/Motherbirds/resource/images/79782505.1.jpg"></a> <span
							class="card-title">Card Title${i.id}</span> <a
							class="btn-floating halfway-fab waves-effect waves-light red"><i
							class="material-icons">add</i></a>
					</div>
					<div class="card-content">
						<p>I am a very simple card. I am good at containing small bits
							of information. I am convenient because I require little markup
							to use effectively.</p>
					</div>
				</div>
		


			</div>
	 </c:forEach> --%>
	     <div id="map">
     
        </div>
        
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
	

      

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrt3JIkcXTts0sgMlRYN47SEReOOGl3lQ&callback=initMap"
    async defer></script>
    
</main>
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
	    
	      var map;
	      function initMap(x,y,data) {

	        map = new google.maps.Map(document.getElementById('map'), {
	       
	          center: new google.maps.LatLng(x,y),
	          zoom: 13
	        });
	       
	        
	      }
	    
	    function loadDemo() {
	        if (navigator.geolocation) {
	           /* alert("Your browser supports geolocation service.");  */
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
			
			if(msg.room !='')
				onCreate();
			
			$("#chat-list-box").scrollTop(10000);
			chatIput.val('');
			chatIput.focus(); 
		});

		connButton.click(function(event){
			
			wsocket = new WebSocket("ws://125.129.60.152:8080/Motherbirds/chat/chatserver");
			wsocket.onopen = function(event){
				alert("접속 되었습니다.");
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
				//getloc();
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
							
							var latLng = new google.maps.LatLng(data.userlist[i].latitude,data.userlist[i].longitude);
						    var marker = new google.maps.Marker({
					            position: latLng,
					            map: map
					          });
						}
						$(".userlistbox").text(ul);  
						break;
					default:
						break;
				}
		
				
			};

			wsocket.onclose = function(){
				alert("접속이 끊겼습니다.");
			
			
			};
		});
	 });
</script>