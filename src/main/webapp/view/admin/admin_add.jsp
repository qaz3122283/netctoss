﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
         <%@include file ="/view/include/link.jsp"%>
        <script language="javascript" type="text/javascript">
            //保存成功的提示消息
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = document.getElementById("save_result_info");
                if (flag)
                    divResult.style.display = "block";
                else
                    divResult.style.display = "none";
            }
            //添加时验证
            function addAdmin(){
            	var a = 0;
            	var name =$("#name").val();
            	var tel = $("#tel").val();
            	var email = $("#email").val();
            	var username = $("#username").val();
            	var psw = $("#psw").val();
            	var psw1 = $("#psw1").val();
            	
            	 var strs = new Array(); 
        		 var pic1 = $("#file").val();
       			 strs = pic1.split('.');
       			 var suffix = strs[strs.length-1];
       			 
       			 //正则表达式
       			 var resEmail = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)$/; //邮箱
       			 var resTel = /^1[34578]\d{9}$/;
       			 var resName = /^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$/;//名字
       			 var resUsername = /^[A-Za-z0-9_]{2,30}$/;//用户名，密码
            	//姓名验证
            	if(!resName.test(name) || name==""){
            		a = 1;
            		$(".save_success").text("请填写正确的名字！");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500);  
            	}
            	//登录账号验证
            	else if(!resUsername.test(username) || username==""){
            		a = 1;
            		$(".save_success").text("请填写正确的管理员帐号！");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500);  
            	}
            	//密码验证
            	else if(!resUsername.test(psw) || psw==""){
            		a = 1;
            		$(".save_success").text("请填写正确的密码！");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500);  
            	}
            	//重复密码验证
            	else if(psw1==null || psw1=="" || psw!=psw1){
            		a = 1;
            		$(".save_success").text("两次密码不一致，请重新输入！");
            		$("#psw1").val("");
            		$("#psw").val("");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500);  
            	}
            	//上传图片验证           	
       			else if(suffix!='jpg' && suffix!='gif' && suffix!='jpeg' && suffix!='png'){
       				a = 1;
            		$(".save_success").text("上传文件不是图片，请重新上传！");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500); 
        		}
            	//电话验证
            	else if(!resTel.test(tel) || tel==""){
            		a = 1;
            		$(".save_success").text("请填写正确的电话！");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500); 
            	}
            	//邮箱验证
            	else if(!resEmail.test(email)||email==""){
            		a = 1;
            		$(".save_success").text("请填写正确的邮箱！");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500); 
            	}
            	//角色验证
            	else if($(":checkbox[name=rol]:checked").size() == 0){
            		a = 1;
            		$(".save_success").text("请至少选择一种角色！");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500);  
            	}
            	if(a=='0'){
            		$.ajax({
           				url  : '${pageContext.request.contextPath}/admin/adminAdd.do',
           				type : 'post',
           				data :$("#form").serialize(),
           				success : function(date){
	           				if(date=="1"){
	       						$(".save_success").text("添加成功！2秒后跳转！");
	       						$(".save_success").fadeIn(100);
	    						$(".save_success").fadeOut(2500);
	    						setTimeout("window.location.href ='${pageContext.request.contextPath}/admin/adminList.do?cur=1'",2500);
	       					}
	           				if(date=="0"){
 	           					$(".save_success").text("添加失败!");
	       						$(".save_success").fadeIn(100);
	    						$(".save_success").fadeOut(2500); 
	           				}
           				}
            		})
            	}
            }
        </script>
    </head>
    <body name="admin_off">
         <%@include file ="/view/include/header.jsp"%>
        <!--主要区域开始-->
        <div id="main" style="max-height: 500px">             
            <form action="" method="post" class="main_form" id="form" enctype="multipart/form-data">
             <div id="save_result_info" class="save_success">保存成功！</div>
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text" name="name" id="name" class="width200"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium">20长度以内的汉字、字母、数字的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>管理员账号：</span></div>
                    <div class="input_info">
                        <input type="text" name="username" id="username" class="width200"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium">30长度以内的字母、数字和下划线的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>密码：</span></div>
                    <div class="input_info">
                        <input type="password" name="psw" id="psw" class="width200"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium">30长度以内的字母、数字和下划线的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>重复密码：</span></div>
                    <div class="input_info">
                        <input type="password" name="psw1" id="psw1" class="width200"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium">两次密码必须相同</div>
                    </div>      
					<div class="text_info clearfix"><span>上传头像</span></div>
                    <div class="input_info">
                        <input class="width200" type="file" name="file" id="file" />
                        <span class="required">*</span>
                        <div class="validate_msg_medium">图片大小400*400px</div>
                    </div>  
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="tel" id="tel"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium">正确的电话号码格式：手机</div>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" name="email" id="email"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium">50长度以内，正确的 email 格式</div>
                    </div>
                    <div class="text_info clearfix"><span>角色：</span></div>
                    <div class="input_info_high">
                        <div class="input_info_scroll">
                            <ul>
                            	<c:forEach items="${requestScope.role}" var="role">
                               		 <li><input type="checkbox" value="${role.role_id}" name="rol"/>${role.role_name}</li>
                  				</c:forEach>
                            </ul>
                        </div>
                        <span class="required">*</span>
                        <div class="validate_msg_tiny">至少选择一个</div>
                    </div>
                    <div class="button_info clearfix">
                        <input type="button" value="保存" class="btn_save" onclick="addAdmin()" />
                        <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/admin/adminList.do?cur=1'"/>
                    </div>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
