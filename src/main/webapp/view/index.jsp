﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@ include file ="/view/include/link.jsp"%>
        <script language="javascript" type="text/javascript">
		$(function(){
			 $("#menu a").each(function(){
				if($(this).attr("class")==$("body").attr("name")){
					$(this).attr("class",$("body").attr("name").replace("off","on"));
				}
			});
		})
</script>
    </head>
    <body name="index_off">
    	<!-- logo区域开始  --> 
		<div id="header" > 
			<img src ="${pageContext.request.contextPath}/images/logo.png" alt = "Logo" class="left" >
			当前用户：<font color="blue"><B>${admin.admin_name}</B></font><a href="${pageContext.request.contextPath}/view/login.jsp">[退出]</a>
		</div>
		<!--导航区域开始-->
		<div id="index_navi">
	        <ul id="menu">
	        		<li><a href="${pageContext.request.contextPath}/view/index.jsp" class="index_off"></a></li>
            	<c:forEach var="admin_power" items="${admin.admin_power}">      
	            	<li><a id="a" href="${pageContext.request.contextPath}${admin_power.pow_class}?cur=1" class="${admin_power.pow_url}"></a></li>
				</c:forEach>
				<li><a href="${pageContext.request.contextPath}/view/user/user_info.jsp" class="information_off"></a></li>
        		<li><a href="${pageContext.request.contextPath}/view/user/user_modi_pwd.jsp" class="password_off"></a></li>
	        </ul>
	    </div>
		<!--导航区域结束-->
    </body>
</html>
