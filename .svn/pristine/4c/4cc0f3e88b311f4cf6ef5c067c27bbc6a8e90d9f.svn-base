<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
            //修改前验证
            function updateAdmin(){
            	var name =$("#name").val();
            	var a = 0;
            	var tel = $("#tel").val();
            	var email = $("#email").val();
            	
            	//正则表达式
      			 var resEmail = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/; //邮箱
      			 var resTel =  /^1[34578]\d{9}$/;//电话
      			 var resName = /^[\u4E00-\u9FA5A-Za-z0-9]{2,20}$/;//名字
      			 
            	if(!resName.test(name) || name==""){
            		a = 1;
            		$(".save_success").text("请填写正确的姓名！");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500);  
            	}
            	else if(!resTel.test(tel) || tel==""){
            		a = 1;
            		$(".save_success").text("请填写正确的电话！");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500); 
            	}
            	else if(!resEmail.test(email)||email==""){
            		a = 1;
            		$(".save_success").text("请填写正确的邮箱！");
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500); 
            	}
            	else if($(":checkbox[name=rol]:checked").size() == 0){
            		a = 1;
            		$(".save_success").text("请至少选择一种角色！")
					$(".save_success").fadeIn(100);
					$(".save_success").fadeOut(2500);  
            	}
            	if(a=='0'){
            		$.ajax({
           				url :'${pageContext.request.contextPath}/admin/adminUpdate.do',
           				type : 'post',
           				data :$("#form").serialize(),
           				success : function(date){
	           				if(date=="1"){
	       						$(".save_success").text("修改成功！2秒后跳转！");
	       						$(".save_success").fadeIn(100);
	    						$(".save_success").fadeOut(2500);
	    						setTimeout("window.location.href ='${pageContext.request.contextPath}/admin/adminList.do?cur=1'",2500);
	       					}
	           				if(date=="0"){
 	           					$(".save_success").text("修改失败!");
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
        <div id="main">            
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form action="" method="post" class="main_form" id="form">
                    <div class="text_info clearfix"><span>姓名：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" value="${requestScope.adminShow.admin_name}" name="name" id="name"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium">20长度以内的汉字、字母、数字的组合</div>
                    </div>
                    <div class="text_info clearfix"><span>管理员账号：</span></div>
                    <div class="input_info">
                    <input type="text" readonly="readonly" class="readonly width200" value="${requestScope.adminShow.admin_account}"  /></div>
                    <div class="text_info clearfix"><span>电话：</span></div>
                    <div class="input_info">
                        <input type="text"  class="width200" value="${requestScope.adminShow.admin_tel}" name="tel" id="tel"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium">正确的电话号码格式：手机</div>
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" class="width200" value="${requestScope.adminShow.admin_email}" name="email" id="email"/>
                        <span class="required">*</span>
                        <div class="validate_msg_medium">50长度以内，正确的 email 格式</div>
                    </div>
                    <div class="text_info clearfix"><span>角色：</span></div>
                    <div class="input_info_high">
                        <div class="input_info_scroll">
                            <ul>
	                            <c:forEach items="${role}" var="role">
	                               <li><input type="checkbox" value="${role.role_id}" name="rol"
	                               		<c:forEach items="${requestScope.adminShow.admin_role}" var="r">
	                               			<c:if test="${r.role_id == role.role_id }">checked</c:if>
	                               		</c:forEach>
	                               />${role.role_name}</li>
	                  			</c:forEach>
                            </ul>
                        </div>
                        <span class="required">*</span>
                        <div class="validate_msg_tiny">至少选择一个</div>
                    </div>
                    <input type="hidden" name="id" value="${requestScope.adminShow.admin_id}"/>
                    <div class="button_info clearfix">
                        <input type="button" value="保存" class="btn_save" onclick="updateAdmin()" />
                        <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/admin/adminList.do?cur=1'"/>
                    </div>
                </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
