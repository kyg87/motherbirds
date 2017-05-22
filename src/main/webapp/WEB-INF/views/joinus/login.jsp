<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	  $(document).ready(function(){
		  var myForm1 = $("#myForm1");
		  
	
		  $("#btn2").click(function(){
			  
			
		        myForm1.submit();
			
		  });

		});
	</script>
	

 <main>

	<h4>Modal Header</h4>
			<h1>로그인${validate}</h1>
				
			<form id="myForm1" action="${root}/j_spring_security_check" method="post">
				<c:if test="${param.error !=null }">
				<p>Login Error<p/>
				<p>message: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message }</p>
					${error}
	
				</c:if>
				<div class="row">
					<div class="input-field col s12">
						<input name="j_username"  id="email" type="email" class="validate"> <label
							for="email">Email</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input name="j_password" id="password" type="password" class="validate"> <label
							for="password">Password</label>
					</div>
				</div>

				<div>
					<input id="btn2" class="waves-effect waves-light btn" type="button" value="로그인" />
				</div>
		
			</form>
		
	
</main>





