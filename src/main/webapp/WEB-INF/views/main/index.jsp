<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>			
	 <script type="text/javascript" src="/Motherbirds/resource/js/jquery-1.12.3.min.js"></script>
      <script type="text/css" src="/Motherbirds/resource/css/ion.rangeSlider.css"></script>
      <script type="text/css" src="/Motherbirds/resource/css/ion.rangeSlider.skinFlat.css"></script>
		
<main id="main">
 <c:forEach var="i" begin="1" end="5">
	<div class="row">
		<c:forEach var="i" begin="1" end="3">
			<div class="col s12 m4">
				<div class="card">
					<div class="card-image">
						<a href="detail"><img
							src="/Motherbirds/resource/images/79782505.1.jpg"></a> <span
							class="card-title">Card Title</span> <a
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

		</c:forEach>
	</div>
</c:forEach>


</main>
