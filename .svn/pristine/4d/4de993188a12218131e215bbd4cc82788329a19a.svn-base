<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
        <title></title>
        <%@ include file="../include/link.jsp"%>
        <script language="javascript" type="text/javascript">
			$(document).ready(function(){
				//验证用户姓名
				$("#admin_name").blur(function(){
					var admin_name = $("#admin_name").val();
					var regs = /^[\u4e00-\u9fa5A-Za-z]{2,12}$/; //长度为2-12以内的字母汉字组合
					if(admin_name!= null && admin_name!=""){
						if(regs.test(admin_name)){
							$("#name_span1").remove();
							$("#name_span").remove();
							$("#name_div1").remove();
							$("#name_div").remove();
						}else{
							$("#name_span1").remove();
							$("#name_span").remove();
							$("#name_div1").remove();
							$("#name_div").remove();
							$("#admin_name").after("<div id="+"'name_div'"+"class="+"'validate_msg_long error_msg'>"+"12长度以内的汉字、字母的组合"+"</div>");
						}
					}else{
						$("#name_span1").remove();
						$("#name_span").remove();
						$("#name_div1").remove();
						$("#name_div").remove();
						$("#admin_name").after("<div id="+"'name_div'"+"class="+"'validate_msg_long error_msg'>"+"姓名不能为空"+"</div>");
					}
				});
				//验证用户电话
				$("#admin_tel").blur(function(){
					var admin_tel = $("#admin_tel").val();
					var regs = /^0\d{2,3}-?\d{7,8}|1\d{10}$/;//验证手机和固话
					if(admin_tel!= null && admin_tel!=""){
						if(regs.test(admin_tel)){
							$("#tel_span1").remove();
							$("#tel_div1").remove();
							$("#tel_span").remove();
							$("#tel_div").remove();
						}else{
							$("#tel_span1").remove();
							$("#tel_div1").remove();
							$("#tel_span").remove();
							$("#tel_div").remove();
							$("#admin_tel").after("<div id="+"'tel_div'"+"class="+"'validate_msg_medium error_msg'>"+"手机或固话格式不符合规范"+"</div>");
						}
					}else{
						$("#tel_span1").remove();
						$("#tel_div1").remove();
						$("#tel_span").remove();
						$("#tel_div").remove();
						$("#admin_tel").after("<div id="+"'tel_div'"+"class="+"'validate_msg_medium error_msg'>"+"手机或固话不能为空"+"</div>");
					}
				});
				//验证用户email
				$("#admin_email").blur(function(){
					//alert("enter");
					var admin_email = $("#admin_email").val();
					var regs = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)$/;//验证邮箱
					if(admin_email!= null && admin_email!=""){
						if(regs.test(admin_email)){
							$("#email_span1").remove();
							$("#email_div1").remove();
							$("#email_span").remove();
							$("#email_div").remove();
						}else{
							$("#email_span1").remove();
							$("#email_div1").remove();
							$("#email_span").remove();
							$("#email_div").remove();
							$("#admin_email").after("<div id="+"'email_div'"+"class="+"'validate_msg_medium error_msg'>"+"email格式不符合规范"+"</div>");
						}
					}else{
						$("#email_span1").remove();
						$("#email_div1").remove();
						$("#email_span").remove();
						$("#email_div").remove();
						$("#admin_email").after("<div id="+"'email_div'"+"class="+"'validate_msg_medium error_msg'>"+"email不能为空"+"</div>");
					}
				});
				//按钮提交保存
				$("#button_save").click(function(){
					 save();
 				});
				//回车提交保存
				$(document).keydown(function(event){
 		        	if (event.keyCode ==13){
 		        		 save();
		        	}
				});
				//判断信息是否发被修改
				//可以像点击图标一样返回到该页面
// 				function change(){
// 					var admin_name = $("#admin_name").val();
// 					var admin_tel = $("#admin_tel").val();
// 	        		var admin_email = $("#admin_email").val();
// 	        		var name = '${admin.admin_name}';
// 	        		var tel = '${admin.admin_tel}';
// 	        		var email = '${admin.admin_email}';
// 	        		if(admin_name==name && admin_tel==tel && admin_email==email){
// 						$(".save_fail").show().delay(1000).fadeOut("slow");
// 					}else{
// 						save();
// 					}
// 				}
				//更新重置信息
				$("#cancel").click(function(){
					var admin_name = $("#admin_name").val();
					var admin_tel = $("#admin_tel").val();	
					var admin_email = $("#admin_email").val();
					alert(admin_name);
					$("#admin_name").val(admin_name);
					$("#admin_tel").val(admin_tel);	
					$("#admin_email").val(admin_email);
				})
				//提交保存修改
				function save(){
	        		var name_div = $("#name_div");
					var tel_div = $("#tel_div");
	        		var email_div = $("#email_div");
	        		if(name_div.length>0){
	        			$("#admin_name").shake(4,3,200);
	        		}else{
	        			if(tel_div.length>0){
		        			$("#admin_tel").shake(4,3,200);
		        		}else{
		        			if(email_div.length>0){
		        				$("#admin_email").shake(4,3,200);
		        			}else{
		        				$("#name_span").remove();
								$("#name_div").remove();
								$("#tel_span").remove();
								$("#tel_div").remove();
								$("#email_span").remove();
								$("#email_div").remove();
								//Ajax提交
								$.ajax({
					       			url: '${pageContext.request.contextPath}/admin/modifyAdminInfo.do',
					       			type: 'post',
					       			data:{
					       				admin_id:$("#admin_id").val(),
					       				admin_name:$("#admin_name").val(),
					       				admin_tel: $("#admin_tel").val(),
					       				admin_email:$("#admin_email").val()
					       			},
					       			success:function(data){
					       				var msg = data.msg;
					     				if(msg==1){
					     					var adminModi = data.adminModi;
					     					$(".save_success").show().delay(1000).fadeOut("slow");
					     					$("#admin_name").val(adminModi.admin_name);
					     					$("#admin_tel").val(adminModi.admin_tel);
					     					$("#admin_email").val(adminModi.admin_email);					
					     					$("#font").text(adminModi.admin_name);					
					     				}else{
					     					$(".save_fail").show().delay(1000).fadeOut("slow");
					     				}
					       			}
								})
		        			}
		        		}
	        		}
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
				//菜单图标样式
				$(function(){
					$("#menu a").each(function(){
						if($(this).attr("class")==$("body").attr("name")){
							$(this).attr("class",$("body").attr("name").replace("off","on"));
						}
					});
				})
			})
        </script>
    </head>
    <body name="information_off">
<%--     	<%@include file="../include/header.jsp" %> --%>
		<!-- logo区域开始  -->
		<div id="header" >
			<img src = "${pageContext.request.contextPath}/images/logo.png" alt = "Logo" class="left" />
			当前用户：<font id="font" color="blue"><B>${admin.admin_name}</B></font><a href="${pageContext.request.contextPath}/view/login.jsp">[退出]</a>
		</div>
		<!--导航区域开始 -->
		<div id="navi">
	        <ul id="menu">
	        		<li><a href="${pageContext.request.contextPath}/view/index.jsp" class="index_off"></a></li>
	            	<c:forEach var="admin_power" items="${admin.admin_power}">      
		            	<li><a id="a" href="${pageContext.request.contextPath}${admin_power.pow_class}?cur=1" class="${admin_power.pow_url}"></a></li>
					</c:forEach>
					<li><a href="${pageContext.request.contextPath}/view/user/user_info.jsp" class="information_off"></a></li>
	        		<li><a href="${pageContext.request.contextPath}/view/user/user_modi_pwd.jsp" class="password_off"></a></li>
	            </ul>
	        </div>
		<!--导航区域结束 -->
        <!--主要区域开始-->
        <div id="main">  
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success" >保存成功！</div>
            <div id="save_result_info" class="save_fail" >保存失败，数据并发错误！</div>
            <form action="${pageContext.request.contextPath}/admin/modifyAdminInfo.do" method="post" class="main_form">
                <div class="text_info clearfix" ><span>管理员账号：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${admin.admin_account}"/></div>
                <div class="text_info clearfix"><span>角色：</span></div>
                <div class="input_info">
                    <input type="text" readonly="readonly" class="readonly width400" value="${admin.admin_role_string}" />
                </div>
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info">
                    <input id="admin_name" type="text" value="${admin.admin_name}" name="admin_name" id="admin_name"/>
<!--                     <span id="name_span" class="required">*</span> -->
                    <span id="name_span1" class="required">*</span>
                    <div id="name_div1" class="validate_msg_medium">20长度以内的汉字、字母的组合</div>
                </div>
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input id="admin_tel" type="text" class="width200" value="${admin.admin_tel}" name="admin_tel" id="admin_tel"/>
                    <span id="tel_span1" class="required">*</span>
               		<div id="tel_div1" class="validate_msg_medium">电话号码格式：手机或固话</div>
                </div>
                <div class="text_info clearfix"><span>Email：</span></div>
                <div class="input_info">
                    <input id="admin_email" type="text" class="width200" value="${admin.admin_email}" name="admin_email" id="admin_email"/>
                    <span id="email_span1" class="required">*</span>
                    <div id="email_div1" class="validate_msg_medium">50长度以内，符合 email格式</div>
                </div>
                <div class="text_info clearfix"><span>创建时间：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${admin.admin_date}"/></div>
                <div class="button_info clearfix">
                    <input id="button_save" type="button" value="保存" class="btn_save" id="save" />
                    <input type="reset" value="取消" class="btn_save" id="cancel"/>
                </div>
                <input id="admin_id" type="hidden" name="admin_id" value="${admin.admin_id}"/> 
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
