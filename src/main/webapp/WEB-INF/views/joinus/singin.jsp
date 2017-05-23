<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



	<script type="text/javascript">
	  $(document).ready(function(){
		  
		  $("#btn1").click(function(){
			  
			  	var id = $("#id");
		        /* var user = document.querySelector("#userInput"); */
		        
		        var pass = $("#pass");
		        var pass1 = $("#pass1");
		    
		        var myForm = $("#myForm");
		        
		        var str = id.val();//이메일 데이터값
		         
		        str = str.trim();//공백 제거
		        
		        if(!str){
		            alert("이메일을 입력하세요");
		            id.focus();//해당입력란으로 포커싱
		            return;
		        }
		   
		   /*      if(!emailcheck(str)){
		            alert("정상적인 이메일을 입력하세요");
		            id.focus();
		            return;
		        } */
		/*         if(user.value.length ==0){
		            alert("유저네임을 입력하세요");
		            user.focus();
		            return;
		        } */
		        if(pass.val().length ==0){
		            alert("비밀번호를 입력하세요");
		            pass.focus();
		            return;
		        }
		        
		        console.log(pass.val());
		        console.log(pass1.val());
		        //패스워드 일치 체크
		        if(pass.val() != pass1.val()){
		            alert("패스워드가 같지 않습니다 확인해주세요");
		            pass.focus();
		            return;
		        }
		        
				$.post("isSingIn", id, function(d) {
					
					if(d == '1'){
						alert("중복된 아이디입니다");	
					}
					else
						 myForm.submit();
		
				});
			  
		  });
		  
		
		  
		  
		  
		  /*이메일 정규식 검사*/
		    function emailcheck(strValue)
		    {
		        var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
		        //입력을 안했으면
		        if(strValue.lenght == 0)
		        {return false;}
		        //이메일 형식에 맞지않으면
		        if (!strValue.match(regExp))
		        {return false;}
		        return true;
		    }

		});
	</script>
 <main id="main">

	<div class="container">
			<form id="myForm" action="singIn" method="post">
				<h4>Modal Header</h4>
				<div class="row">
					<div class="input-field col s12">
						<input name="id" id="id" type="text" class="validate" required="required" > <label
							for="email" >Id</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<input name="pass" id="pass" type="password" class="validate" required="required"> <label
							for="password">Password</label>
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<input id="pass1" type="password" class="validate" required="required"> <label
							for="password">Password</label>
					</div>
				</div>

				<div>

					<input id="btn1" type="button" class="waves-effect waves-light btn"
						value="가입하기" >
						
					
				</div>
			</form>
		
	</div>
</main>





