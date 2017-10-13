<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@ include file ="../include/link.jsp"%>
        <%@ include file ="../include/bootstraplink.jsp"%>
        
        <script language="javascript" type="text/javascript">
            //排序按钮的点击事件
            function sort(btnObj) {
            	if (btnObj.className == "sort_desc"){
                    btnObj.className = "sort_asc";
                    location.href = "${pageContext.request.contextPath}/fee/FeeRankAction.do?rank="+btnObj.name+"&order=asc";
                }else{
                	btnObj.className = "sort_desc";
                	location.href = "${pageContext.request.contextPath}/fee/FeeRankAction.do?rank="+btnObj.name+"&order=desc";
                }
            }

            //启用
            function startFee(fee_id) {
                var r = window.confirm("确定要启用此资费吗？资费启用后将不能修改和删除。");
                if(r)
                location.href="${pageContext.request.contextPath}/fee/feeStart.do?fee_id="+fee_id; 
            }
            
            //提交
            function init(){
		         var msg = "${msg}";
		         if(msg > 0){
		        	 $("#operate_result_info").show();
		              setTimeout("hide()", 1000);
		         }
		    }
            //删除
            function deleteFee(fee_id) {
                var r = window.confirm("确定要删除此资费吗？");
                location.href="${pageContext.request.contextPath}/fee/feeDel.do?fee_id="+fee_id; 
            }
            //翻页
            function showPage(cur){
            	location.href='${pageContext.request.contextPath }/fee/TurnPage.do?middle=${pc.middle}&curPage='+cur
            }
            
            $(function(){
            	$("th").attr('class','text-center');
            	$("td").css('vertical-align','middle');
            	$("td,th").css('line-height','28px');
            	
            })
        </script>        
    </head>
    <body name="fee_off">
   
        <!-- 导航栏与当前用户 -->
        	<%@include file="../include/header.jsp" %>
        
        <div id="main">
            <form action="" method="get">
                <!--排序-->
                <div class="search_add">
                    <div>
                        <input type="button" name="fee_unitcost" value="单价" class="${classfee_unitcost }" onclick="sort(this);" />
                        <input type="button" name="fee_basecost" value="基费" class="${classfee_basecost }" onclick="sort(this);" />
                        <input type="button" name="fee_time" value="时长" class="${classfee_time }" onclick="sort(this);" />
                    </div>
                    <a href="${pageContext.request.contextPath}/view/fee/fee_add.jsp" class="btn btn-info btn-sm" style="font-size: 15px">
                		<span class="glyphicon glyphicon-plus">增加</span>
                	</a>
                    <%-- <input type="button" value="增加" class="btn_add" onclick="location.href='${pageContext.request.contextPath}/view/fee/fee_add.jsp';" /> --%>
                </div> 
                <!--启用操作的操作提示-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    删除成功！
                </div>    
                <!--数据区域：用表格展示数据-->     
                <div id="data">
                	<div class="table-responsive">            
                    <table class="table table-striped table-bordered text-center table-condensed">
                        <tr>
                            <th style="width:8%">资费ID</th>
                            <th style="width:8%">资费名称</th>
                            <th style="width:8%">基本时长</th>
                            <th style="width:8%">基本费用</th>
                            <th style="width:12%">单位费用</th>
                            <th style="width:15%">创建时间</th>
                            <th style="width:15%">开通时间</th>
                            <th style="width:5%">状态</th>
                            <th style="width:21%"></th>
                        </tr> 
                        
                        <c:forEach items="${lf}" var="fee">
                        	<tr>
                            <td>${fee.fee_id}</td>
                            <td><a href="${pageContext.request.contextPath}/fee/feeDetail.do?fee_id=${fee.fee_id}">${fee.fee_name}</a></td>
                            <td>${fee.fee_time} 小时</td>
                            <td>${fee.fee_basecost} 元</td>
                            <td>${fee.fee_unitcost} 元/小时</td>
                            <td><fmt:formatDate value="${fee.fee_startdate}" pattern="yyyy/MM/dd hh:mm:ss"/></td>
                            <td><fmt:formatDate value="${fee.fee_date}" pattern="yyyy/MM/dd hh:mm:ss"/></td>
                            
                            <td>
                       		 <c:choose>
                       		 	<c:when test="${fee.fee_state==0}">暂停</c:when>
                       		 	<c:when test="${fee.fee_state==1}">开通</c:when>
                   			</c:choose>
                         	</td>
                            <td>
                            <c:choose>
                            	<c:when test="${fee.fee_state==0}">
                            		<input type="button" value="启用" class="btn_start" onclick="startFee(${fee.fee_id});" />
                            		<%-- <a href="${pageContext.request.contextPath}/fee/feeMessage.do?fee_id=${fee.fee_id}" class="btn btn-success btn-xs">
          							<span class="glyphicon glyphicon-pencil"></span> 修改
        							</a> --%>
                               		<input type="button" value="修改" class="btn_modify" onclick="location.href='${pageContext.request.contextPath}/fee/feeMessage.do?fee_id=${fee.fee_id}'"/>
                                	<input type="button" value="删除" class="btn_delete" onclick="deleteFee(${fee.fee_id});" />
                            	</c:when>
                            
                            	<c:otherwise></c:otherwise>
                            </c:choose>                                
                                
                            </td>
                        </tr>
                        </c:forEach>  
                                   
                    </table>
                    </div>
                </div>
                <!--分页-->
                <div id="pages">
        	       <c:choose>
                		<c:when test="${pc.curPage==1 }">
                			 <a >首页</a>
        	      			 <a >上一页</a>
                		</c:when>
                		<c:when test="${pc.curPage!=1 }">
                			 <a href="javaScript:showPage(1)">首页</a>
        	      			 <a href="javaScript:showPage(${pc.curPage-1 })">上一页</a>
                		</c:when>
                	</c:choose>
                    <c:forEach var="i" begin="${pc.middle-pc.width>0?(pc.middle-pc.width):1}" end="${pc.middle+pc.width}">
                    	<c:choose>
                    	 <c:when test="${pc.totlePage>=i&&i>0 }">
                    	 <c:choose>
	                    	<c:when test="${pc.curPage==i }">
	                    		<a class="current_page">${i}</a>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<a href="javaScript:showPage(${i })" >${i}</a>
	                    	</c:otherwise>
	                     </c:choose>
	                   	 </c:when>
                    	</c:choose>
                    </c:forEach>
                    <c:choose>
                		<c:when test="${pc.curPage==pc.totlePage }">
                			 <a >下一页</a>
        	      			 <a >末页</a>共${pc.totlePage }页/${pc.totleNumber}条记录
                		</c:when>
                		<c:when test="${pc.curPage!=pc.totlePage }">
                			 <a href="javaScript:showPage(${pc.curPage+1 })">下一页</a>
                    		 <a href="javaScript:showPage(${pc.totlePage })">末页</a>共${pc.totlePage }页/${pc.totleNumber}条记录
                		</c:when>
                	</c:choose>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
