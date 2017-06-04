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
/* 	#content .container .row {
	    /* margin-bottom: 0; */
	    padding-left: 10px;
	} */
</style>



<main id="main" >
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
  
  <!-- content -->
	<div id="content">
	
		<form action = "board-reg" method="post" enctype="multipart/form-data">
			<table id="main-table">
				<thead>
					<tr>
						<td>제목</td>
						<td><input name ="title" id="TITLE" class="box green-box" type="text"
							placeholder="제목을입력하세요." required/></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>내용</td>
						<td>
						<textarea name ="content" id="content-box" rows="30" cols="80"></textarea>
						</td>
					</tr>
				</tbody>
				<tbody id="toDoList">
					<tr>
						<td>1번</td>
						<td><input name ="select" id="task" class="box" type="text"
							placeholder="항목을입력하세요." required/></td>
					</tr>
					<tr>
						<td>2번</td>
						<td><input name ="select" class="box" type="text" placeholder="항목을입력하세요." required/>
						</td>
					</tr>
				</tbody>
			</table>
			
			
			<div class="info-add">
				<input type="button" id="addTaskBtn" value ="╂"/>
			</div>
			
		
			
			
			<div id="option-field">
				<div id="image-option">
					
					<label>사진첨부</label>
					<input name ="file" type="file"  id="getfile" class="upload-box" required>
					   <img id="thumbnail" src="" width="140px" height="140px"/>
				</div>
			</div>
			
			
			<div id="option-bottom">
				<input class="back-box btn" type="button" value="목록으로" /> 
			<input name="memberId" type="hidden" value=<%=request.getSession().getAttribute("member") %> />
				<input id="reg-button" class="success-box btn" type="submit" value="등록하기" />
			</div>
			
		</form>

				<!-- ENDS content -->
	
	
	</div>


</main>
<script type="text/javascript" src="/Motherbirds/resource/js/toDoListAdd.js"></script>
<script type="text/javascript" src="/Motherbirds/resource/js/fileUpload.js"></script>

</head>