<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	    <head>
	    <style type="text/css">
			#code{ 
					font-family:Arial; 
					font-style:italic; 
					font-weight:bold; 
					border:0; 
					letter-spacing:2px; 
					color:blue; 
			} 
		</style> 
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@ include file ="/view/include/link.jsp"%>
    	<script language="javascript" type="text/javascript">
			$(function(){
				var code ; //在全局定义验证码 
				//产生验证码 
				window.onload =  function createCode(){ 
					code = ""; 
					var codeLength = 4;//验证码的长度 
					var checkCode = document.getElementById("code"); 
					var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R', 
					'S','T','U','V','W','X','Y','Z');//随机数 
					for(var i = 0; i < codeLength; i++) {//循环操作 
						var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35） 
						code += random[index];//根据索引取得随机数加到code上 
					} 
					checkCode.value = code;//把code值赋给验证码 
				} 
				function createCode(){ 
					code = ""; 
					var codeLength = 4;//验证码的长度 
					var checkCode = document.getElementById("code"); 
					var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R', 
					'S','T','U','V','W','X','Y','Z');//随机数 
					for(var i = 0; i < codeLength; i++) {//循环操作 
						var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35） 
						code += random[index];//根据索引取得随机数加到code上 
					} 
					checkCode.value = code;//把code值赋给验证码 
				} 
				//校验验证码 
				function validate(){ 
					var inputCode = document.getElementById("input").value.toUpperCase(); //取得输入的验证码并转化为大写 
					if(inputCode.length <= 0) { 
						return -1;//验证为空
					}else if(inputCode != code ) { 
						//若输入的验证码与产生的验证码不一致时 
						createCode();//刷新验证码 
						document.getElementById("input").value = "";//清空文本框 
						return 2;//验证码错误
					}else { //输入正确时 
						//document.getElementById("login_from").submit();
						return 1;
					} 
				}
				//点击刷新验证码
				$("#code").click(function(){
					createCode();
				})
				//提示账号密码错误
 				var u = '${msg}';
 				if(u==-1){
 					$("#login_error_msg").remove();
					$("#login_msg").html("<span id="+"'login_error_msg'"+"class="+"'required'>"+"用户名或密码错误，请重试"+"</span>");
 				}
				//验证账务账号合法性
				$("#account").blur(function(){
					var account = document.getElementById("account").value;
					var regs =  /^[A-Za-z0-9_]{2,30}$/;
					if(account!= null && account!=""){
						if(regs.test(account)){	
							$("#account_msg_error").remove();
						}
						else{
							$("#account_msg_error").remove();
							$("#account_msg").html("<span id="+"'account_msg_error'"+"class="+"'required'>"+"账号为12以内的字母,数字和下划线"+"</span>");
						}
					}else{
						$("#account_msg_error").remove();
						$("#account_msg").html("<span id="+"'account_msg_error'"+"class="+"'required'>"+"账号不能为空"+"</span>");
					}
		    	});
	 			//验证输入密码的合法性
		 		$("#psw").blur(function(){
		 			var psw = document.getElementById("psw").value;
					var regs = /^[a-zA-Z0-9_]{1,12}$/;
					if(psw!= null && psw!=""){
			 			if(regs.test(psw)){
			 				$("#psw_msg_error").remove();
			 			}else{
			 				$("#psw_msg_error").remove();
							$("#psw_msg").html("<span id="+"'psw_msg_error'"+"class="+"'required'>"+"密码长度为10的字母、数字和下划线"+"</span>");
			 			}
			 		}else{
			 			$("#psw_msg_error").remove();
						$("#psw_msg").html("<span id="+"'psw_msg_error'"+"class="+"'required'>"+"密码不能为空"+"</span>");
			 		}
		 		 });
	 			//验证验证码
	 			//input
		 		//登录按钮提交
				$("img").click(function(){
					$("#login_error_msg").remove();
					var v = validate();
					if(v!= null && v!=""){
						if(v==-1){
							//验证码为空
							$("#code_msg_error").remove();
							$("#code_msg").html("<span id="+"'code_msg_error'"+"class="+"'required'>"+"验证码不能为空"+"</span>");
						}else{
							if(v==2){
								//验证码错误
								$("#code_msg_error").remove();
								$("#code_msg").html("<span id="+"'code_msg_error'"+"class="+"'required'>"+"验证码错误"+"</span>");
							}else{
								//验证码正确，提交登录验证
								$("#psw_msg_error").remove();
								login();
							}
						}
					}
					
 				}); 
				//回车登录
				$(document).keydown(function(event){
 		        	if (event.keyCode ==13){
 		        		$("img").click();
		        	}
				});
				//提交登录
				function login(){
					//var code_msg = $("#$code_msg_error");
					var account_msg = $("#account_msg_error");
	        		var psw_msg = $("#psw_msg_error");
// 		        	if(code_msg.length>0){
// 		        		$("#input").shake(4,3,200);
// 		        	}else{
		        		if(account_msg.length>0){
		        			$("#account").shake(4,3,200);
		        		}else{
		        			if(psw_msg.length>0){
			        			$("#psw").shake(4,3,200);
			        		}else{
			        			$("#login_error_msg").remove();
			        			$("#login_from").submit();
			        		}
		        		}
// 		        	}
				}
				//抖动效果
	 			jQuery.fn.shake = function(intShakes , intDistance , intDuration ) {
	     			this.each(function() {
		 		        var jqNode = $(this);
		 		        jqNode.css({position: 'relative'});
		 		        for (var x=1; x<=intShakes; x++){
		 		            jqNode.animate({ left: (intDistance * -1) },(((intDuration / intShakes) / 4)))
		 		            .animate({ left: intDistance },((intDuration/intShakes)/2))
		 		            .animate({ left: 0 },((intDuration/intShakes)/4));
		 		        }
	 	    		});
	 	    		return this;
				}
				
			})
		</script>
    </head>
    <body class="index">
    	<form id="login_from" name="login" method="post" action="${pageContext.request.contextPath}/admin/login.do"/>
	        <div class="login_box">
	            <table>
	                <tr>
	                    <td class="login_info">账号：</td>
	                    <td colspan="2"><input id="account" name="admin_account" type="text" class="width150" placeholder="账号" value="${admin.admin_account }"/></td>          
	                	<td id="account_msg" class='login_error_info'></td>
	                </tr>
	                <tr>
	                    <td class="login_info">密码：</td>
	                    <td colspan="2"><input id="psw" name="admin_psw" type="password" class="width150" placeholder="登录密码" value="${admin.admin_psw }"/></td>
	                	<td id="psw_msg" class='login_error_info'></td>  
	                </tr>
	                <tr>
		                <td class="login_info">验证码：</td>
	                    <td class="width70"><input type = "text" id ="input" class="width70"/></td>  
					   	<td><input type="button" id="code" onclick="createCode()" title="点击更换"/> </td>
					   	<td id="code_msg"></td>
	                </tr>            
	                <tr>
	                    <td></td>
	                    <td class="login_button" colspan="2">
	                        <img id="img" src="${pageContext.request.contextPath}/images/login_btn.png"  />
	                    </td>
	                    <td id="login_msg"></td>
	                </tr>
	            </table>
	        </div>
    </body>
</html>
