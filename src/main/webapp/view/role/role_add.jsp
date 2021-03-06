﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@include file ="../include/bootstraplink.jsp"%>
        <%@include file ="../include/link.jsp"%>
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
            //添加时表单验证
            function checkAddRole(){

            	var name = $("#per_name").val();
            	
            	//正则表达式
            	var resName = /^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$/;//名字
            	
            	var a = 0;
            	if(!resName.test(name) ||name==""){
            		a = 1;
            		$(".save_success").text("请填写正确的名字！");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500);  
            	}
            
            	else if($(":checkbox[name=per]:checked").size() == 0){
            		a = 1;
            		$(".save_success").text("请至少选择一种权限！")
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500);  
            	}
            	if(a=='0'){
            		$.ajax({
           				url :'${pageContext.request.contextPath}/role/roleAdd.do',
           				type : 'post',
           				data :$("#form").serialize(),
           				success : function(date){
	           				if(date=="1"){
	       						$(".save_success").text("添加成功！2秒后跳转！");
	       						$(".save_success").fadeIn(100);
	    						$(".save_success").fadeOut(2500);
	    						setTimeout("window.location.href ='${pageContext.request.contextPath}/role/roleList.do?cur=1'",2500);
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
    <body name="role_off">
         <%@include file ="/view/include/header.jsp"%>
        <!--主要区域开始-->
        <div id="main">            
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success">保存成功！</div><!--保存失败，角色名称重复！-->
            <form  class="bs-example bs-example-form main_form" role="form" id="form">
                <div class="text_info clearfix width150"><span>角色名称：</span></div>
                <div class="input_info">
                    <input type="text" class="width200" name="per_name" id="per_name"/>
                    <span class="required">*</span>
                    <div class="validate_msg_medium">不能为空，且为20长度的字母、数字和汉字的组合</div>
                </div>                
                <div class="text_info clearfix"><span>设置权限：</span></div>
                <div class="input_info_high">
                    <div class="input_info_scroll">
                        <ul> 
                            <li><input type="checkbox" value=1 name="per"/>角色管理</li>
                            <li><input type="checkbox" value=2 name="per"/>管理员管理</li>
                            <li><input type="checkbox" value=3 name="per"/>资费管理</li>
                            <li><input type="checkbox" value=4 name="per"/>账务账号</li>
                            <li><input type="checkbox" value=5 name="per"/>业务账号</li>
                            <li><input type="checkbox" value=6 name="per"/>账单</li>
                            <li><input type="checkbox" value=7 name="per"/>报表</li>
                        </ul>
                    </div>
                    <span class="required">*</span>
                    <div class="validate_msg_tiny">至少选择一个权限</div>
                </div>
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick= "checkAddRole()" />
                    <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/role/roleList.do?cur=1'"/>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
        </div>
    </body>
</html>
