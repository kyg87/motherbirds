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

#main{
    margin-top: 47px;
}

#chat-client{
	width: 500px;
	border: 1px solid #e9e9e9;
	box-sizing: border-box;
	padding: 10px;
	height: 300px;
}
#chat-list-box{
    overflow-y: auto;
    overflow-x: hidden;
    height: 100%;
    padding-bottom: 10px;
    
    min-height: 300px;
}

    
</style>



<main id="main">
<div class="container">
${n.id }</br>
${n.title }</br>
${n.content }</br>
${n.memberId }</br>
<div class="row">
<div class="col l8 s12">
<div class="view-page">
   <img width="800" height="600" src="https://adbeus.com/wp-content/uploads/2016/10/14524533_1298243536854871_8745558600512087503_o-1-800x600.jpg" class="single-photo responsive-img z-depth-3 wp-post-image" alt="Shaughnessy Café" title="Shaughnessy Café" srcset="https://adbeus.com/wp-content/uploads/2016/10/14524533_1298243536854871_8745558600512087503_o-1-800x600.jpg 800w, https://adbeus.com/wp-content/uploads/2016/10/14524533_1298243536854871_8745558600512087503_o-1-300x225.jpg 300w, https://adbeus.com/wp-content/uploads/2016/10/14524533_1298243536854871_8745558600512087503_o-1-768x576.jpg 768w, https://adbeus.com/wp-content/uploads/2016/10/14524533_1298243536854871_8745558600512087503_o-1-1024x768.jpg 1024w, https://adbeus.com/wp-content/uploads/2016/10/14524533_1298243536854871_8745558600512087503_o-1-305x229.jpg 305w" sizes="(max-width: 800px) 100vw, 800px">             
</div>


</div>
<div class="col l4 s12" style ="min-height:500px;">
</div >
</div>


<div class="profile-box">
</div>
<!-- 채팅  -->
<div>
	<input id="conn-button" type="button" value="접속" />
</div>
<div id="chat-client">
	<div id="chat-list-box">
		<ul id="chat-list">

		</ul>
	</div>
	<div id="chat-panel" >
		<textarea id="chat-input"></textarea>
		<input id="send-button" type="button" value="전송" />
	</div>
</div>

     

</div>

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
		
		sendbutton.click(function(){
			var chatIput = $("#chat-input");
			var msg = chatIput.val();

			
			if('${loginID}'=='anonymousUser'){
				
				var anonymousUser = '${loginID}'  +":"+ random;
				var data =	{"id":anonymousUser,"msg":msg};
			}
			else{
				var data =	{"id":'${loginID}',"msg":msg};
			}

			
			wsocket.send(JSON.stringify(data));
		});

		connButton.click(function(event){
		
			wsocket = new WebSocket("ws://125.129.60.149:8080/Motherbirds/chat/chatserver");
			wsocket.onopen = function(event){
				alert("접속 되었습니다.");
				console.log(event);
			};

			wsocket.onmessage = function(event){
		 		var li = document.createElement("li");
				var data = JSON.parse(event.data);
				li.textContent = "[" + data.id + "]"+data.msg;
				
				chatList.append(li); 
				
		/* 		console.log($("#chat-client").scrollTop());
				console.log($("#chat-list-box").scrollTop());
				console.log($("#chat-list").scrollTop()); */
				/* console.log($("#chat-list-box").scrollTop()); */
				
				
				console.log($("#chat-list-box").height());
				console.log($("#chat-list-box").scrollTop());
				$("#chat-list-box").scrollTop(10000);
			};

			wsocket.onclose = function(){
				alert("접속이 끊겼습니다.")
			};
		});
	 });
</script>