﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />       
        <title></title>
         <%@include file ="../include/bootstraplink.jsp"%>

        <script>
        	//删除前判断
        	function delRoleCheck(rol_id){
        		if(confirm("确定删除？")){
        			$.ajax({
           				url :'${pageContext.request.contextPath}/role/roleUseNow.do',
           				type : 'post',
           				data :{role_id : rol_id},
           				success : function(date){
           					if(date=="1"){
           						$(".operate_success").text("当前对象已被使用，不能删除！")
           						$(".operate_success").fadeIn(100);
        						$(".operate_success").fadeOut(2500);          						
           					}
           					if(date=="0"){
        						getId(rol_id);
           					}
           				}
        			})
        		}
        	}
        	//删除
           	function getId(rol_id){
           			$.ajax({
           				url :'${pageContext.request.contextPath}/role/roleDelete.do',
           				type : 'post',
           				data :{role_id : rol_id},
           				success : function(date){
           					if (date=="0"){
           						$(".operate_success").text("删除失败！")
           						$(".operate_success").fadeIn(100);
        						$(".operate_success").fadeOut(2500);
           					}
           					if(date=="1"){
           						$(".operate_success").text("删除成功！");
           						$("#"+rol_id).remove();
           						$(".operate_success").fadeIn(100);
        						$(".operate_success").fadeOut(2500);
           					}
           				}
           			}) 									
        	}

        </script>
    </head>
    <body name="role_off">
        <%@include file ="/view/include/header.jsp"%>
        <!--主要区域开始-->
        <div id="main">
            <form action="" method="post" id="f2" name="f2">
                <!--查询-->
                <div class="search_add">
                    <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/view/role/role_add.jsp';" />
                </div>  
                <!--删除的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../../images/close.png" onclick="this.parentNode.style.display='none';" />
                   		 删除成功！
                </div> <!--删除错误！该角色被使用，不能删除。-->
                <!--数据区域：用表格展示数据-->     
                <div id="data">  
                <div id="msg"><p></p></div>                    
                    <table id="datalist"  class="table  table-hover table-condensed table-striped">
                      <thead>  
                        <tr>                            
                            <th>角色 ID</th>
                            <th>角色名称</th>
                            <th class="width500">拥有的权限</th>
                            <th class="width150"></th>
                        </tr> 
                      </thead>
                      <tbody>
                        <c:forEach items="${requestScope.list}" var="list">
                        		<tr id="${list.role_id}">
                        			<td class="id">${list.role_id}</td>
                        			<td>${list.role_name}</td>
                        			<td>${list.powers}</td>
                        			<td>
		                                <input type="button" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/role/roleUpdateShow.do?rol_id=${list.role_id}'" />
		                                <input type="button" value="删除" class="btn_delete" id="del" onclick="delRoleCheck(${list.role_id})" /> 
		                            </td>
                        		</tr>
                        </c:forEach>
                      </tbody>                     
                    </table>
                </div> 
                <!--分页-->
                 <div id="pages">
                     <span>第      ${requestScope.cur} 页</span>
        	        <a href="${pageContext.request.contextPath}/role/roleList.do?cur=1">首页</a>
        	        	<c:if test="${requestScope.cur!=1}">
        	        	<a href="${pageContext.request.contextPath}/role/roleList.do?cur=${requestScope.cur-1}">上一页</a>
        	        	</c:if>
        	        <c:forEach var="i" begin="1" end="${requestScope.count}">
                    	<a href="${pageContext.request.contextPath}/role/roleList.do?cur=${i}" class="current_page" ><c:out value="${i}"/></a>
					</c:forEach>
                    <a href="${pageContext.request.contextPath}/role/roleList.do?cur=${requestScope.count}">尾页</a>
                     	<c:if test="${requestScope.cur!=requestScope.count}">
        	        	<a href="${pageContext.request.contextPath}/role/roleList.do?cur=${requestScope.cur+1}">下一页</a>
        	        	</c:if>
                     <span>共       ${requestScope.sum} 条记录</span>
            	</div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
