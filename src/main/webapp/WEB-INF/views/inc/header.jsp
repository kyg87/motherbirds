<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<header id="header">
  <div class="header">
  
<%--   	<a href="#" data-activates="nav-mobile"
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
		
		<a class="singin" href="${root}/joinus/singin">Singin</a> --%>

  <nav>
    <div class="nav-wrapper">
      <a href="#!" class="brand-logo center">Logo</a>
      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
      <ul class="right hide-on-med-and-down">
      	<security:authentication property="authorities" var="auths"/>
		<security:authentication property="name" var="name" />
		
		<security:authorize access="isAnonymous()">
			<a class="login" href="${root}/joinus/login">Login</a>
		</security:authorize>
        <li><a href="sass.html">Sass</a></li>
        <li><a href="badges.html">Components</a></li>
        <li><a href="collapsible.html">Javascript</a></li>
        <li><a href="mobile.html">Mobile</a></li>
      </ul>
      <ul class="side-nav" id="mobile-demo">
		 <li><div class="userView">
		      <div class="background">
		        <img src="images/office.jpg">
		      </div>
		      <a href="#!user"><img class="circle" src="images/yuna.jpg"></a>
		      <a href="#!name"><span class="white-text name">John Doe</span></a>
		      <a href="#!email"><span class="white-text email">jdandturk@gmail.com</span></a>
		    </div></li>
		    <li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li>
		    <li><a href="#!">Second Link</a></li>
		    <li><div class="divider"></div></li>
		    <li><a class="subheader">Subheader</a></li>
		    <li><a class="waves-effect" href="#!">Third Link With Waves</a></li>
      </ul>
    </div>
  </nav>


</div>

	

</header>

	