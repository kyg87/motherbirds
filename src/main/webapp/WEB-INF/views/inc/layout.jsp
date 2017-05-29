<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="en">
    <head>
      <!--Import Google Icon Font-->
      <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="/Motherbirds/resource/css/materialize.css"  media="screen,projection"/>
	  <!-- <link type="text/css" rel="stylesheet" href="/Motherbirds/resource/css/style.css"  media="screen,projection"/> -->
      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      
  <!--     <script type="text/css" src="/Motherbirds/resource/css/ion.rangeSlider.css"></script>
      <script type="text/css" src="/Motherbirds/resource/css/ion.rangeSlider.skinFlat.css"></script> -->
      

    </head>
<body>
<!-- <div class="wrapper">	 -->
		<tiles:insertAttribute name="header" />

<main>


		<%-- <tiles:insertAttribute name="aside" /> --%>
		<tiles:insertAttribute name="main" />


	<!-- 풋터 -->
	</main>
<%-- <tiles:insertAttribute name="footer" /> --%>
<!-- </div>	 -->
	
	<!-- Modal Structure -->
	<div id="modal1" class="modal">
		<div class="modal-content">
			<h4>Modal Header</h4>
			<p>A bunch of text</p>
		</div>
		<div class="modal-footer">
			<a href="#!"
				class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
		</div>
	</div>

	 <!--Import jQuery before materialize.js-->
	 
     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
     <script type="text/javascript" src="/Motherbirds/resource/js/materialize.min.js"></script>
     
	 <script type="text/javascript">
	 
	 	 //사이드메뉴 초기화
     	 $(".button-collapse").sideNav();
     	 
	 	 //모달창 초기화
     	 $(document).ready(function(){
     	    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
     	    $('.modal').modal();
     	  });
     	 //Toasts tooltips 초기화
     	 $(document).ready(function(){
     	    $('.tooltipped').tooltip({delay: 50});
     	  });
     	 //슬라이드 초기화
		  $(document).ready(function(){
		      $('.slider').slider({
		    	 height : 200,
		    	 interval: 100000
		    
		      });
		    });
     </script>
      
      
</body>
</html>
