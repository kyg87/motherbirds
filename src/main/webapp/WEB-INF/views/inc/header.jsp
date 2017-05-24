<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<header id="header">
  <div class="header">
  
  	<a href="#" data-activates="nav-mobile"
		class="button-collapse top-nav full hide-on-large-only"><i
		class="material-icons">menu</i></a>
		
		<a href="${root }/main/index" class="logo">Wiyn</a> 
		
		<security:authentication property="authorities" var="auths"/>
		<security:authentication property="name" var="name" />
		
		<security:authorize access="isAnonymous()">
			<a class="login" href="${root}/joinus/login">Login</a>
		</security:authorize>
		<security:authorize access="isAuthenticated()">
		<a class="login" href="${root}/j_spring_security_logout">LogOut</a>
		<a class="login" href="${root}/user/mypage"> <security:authentication
					property="name" /> MyPage</a>
			
		</security:authorize>
		
		<a class="singin" href="${root}/joinus/singin">Singin</a>




</div>

	

</header>

	