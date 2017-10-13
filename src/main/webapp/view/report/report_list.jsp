<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@ include file="../include/link.jsp"%>
        <script language="javascript" type="text/javascript">
          //查询每位客户每月的累计时长
			$(function(){
				$("#dl1").click(function(){
 					var c = $(this).attr("class");
 					if(c=="tab_on"){
 						alert("数据已更新！");
 					}else{
 						$(this).attr("class","tab_on");
 						$("#dl2").attr("class","tab_out");
 						$("#dl3").attr("class","tab_out");
 						$("#d").show();
 						$("#d1").hide();
 						$(".datalist2").hide();
//  						$.ajax({
//  							url:'${pageContext.request.contextPath}/report/ReportListAction1.do',
//  							type:'post',
//  							date:{},
//  							success:function(result){
//  									var allAcc = result.allAccounts;
//  									var s = "";
//  									for(var i=0;i<allAcc.length;i++){
//  										alert(allAcc[i].acc_id);
//  										$(".datalist").append("<tr>"+
// 		    	       							"<td>"+allAcc[i].acc_id+"</td>"+
// 		    	       							"<td>"+allAcc[i].acc_login+"</td>"+
// 		    	       							"<td>"+allAcc[i].acc_name+"</td>"+
// 		    	       							"<td>"+allAcc[i].acc_idcard+"</td>"+
// 		    	       							"<td>"+allAcc[i].acc_tel+"</td>"+
// 		    	       							"<td>"+allAcc[i].bill.bill_month.getYear()+'年'+(allAcc[i].bill.bill_month.getMonth()+1)+"月"+"</td>"+
// 		    	       							"<td>"+allAcc[i].acount_month_sumtime/60+'小时'+(allAcc[i].acount_month_sumtime %60)+'分钟'+"</td>"+
// 		    	       					"</tr>");
//  									}
//  							}	
//						})	
 					}
					
				})
			})
          	//每台服务器上累计时长最高的前三名客户
          	$(function(){
				$("#dl2").click(function(){
// 					alert($(this).attr("class"));
 					var c = $(this).attr("class");
 					if(c=="tab_on"){
 						alert("数据已更新！");
 					}else{
 						$(this).attr("class","tab_on");
 						$("#dl1").attr("class","tab_out");
 						$("#dl3").attr("class","tab_out");
 						$("#d").hide();
 						$("#d1").show();
 						$(".datalist2").hide();
 						var hide = $("#hide").text();
 						if(hide!=1){
 							$.ajax({
 	 							url:'${pageContext.request.contextPath}/report/ReportListAction2.do',
 	 							type:'post',
 	 							date:{},
 	 							success:function(result){
 	 									var reports = result.allReports2;
 	 									for(var i=0;i<reports.length;i++){
 	 										$(".datalist1").append("<tr>"+
 			    	       							"<td>"+reports[i].service.ser_ip+"</td>"+
 			    	       							"<td>"+reports[i].account.acc_login+"</td>"+
 			    	       							"<td>"+reports[i].account.acc_name+"</td>"+
 			    	       							"<td>"+reports[i].account.acc_idcard+"</td>"+
 			    	       							"<td>"+reports[i].seripSumTimeString+"</td>"+
 			    	       							"<td style="+"'display:none;'"+"id="+"'hide'"+">"+1+"</td>"+
 			    	       					"</tr>");
 	 									}
 	 							}	
 	 						})
 						}else{
 							//不执行操作
 							//alert(hide);
 						}
 							
 					}
					
				})
			})
          	//每台服务器每种资费标准的使用次数
          	$(function(){
				$("#dl3").click(function(){
 					var c = $(this).attr("class");
 					if(c=="tab_on"){
 						alert("数据已更新！");
 					}else{
 						$(this).attr("class","tab_on");
 						$("#dl1").attr("class","tab_out");
 						$("#dl2").attr("class","tab_out");
 						$(".datalist").hide();
 						$(".datalist1").hide();
 						$(".datalist2").show();
 					}
					
				})
			})
			//翻页
	        function showPage(cur){
	        	location.href='${pageContext.request.contextPath }/bill/BillListAction.do?acc_idcard=${ac.acc_idcard }&curPage='+cur
	        }
          
        </script>
    </head>
    <body name="report_off">
        <jsp:include page="../include/header.jsp"/>
        <!--主要区域开始-->        
        <div id="report_main">
        	<div class="tabs">
    	        <ul>
        	        <li><a id="dl1" class="tab_on" title="每位客户每月的累计时长">客户使用时长</a></li>
                    <li><a id="dl2" class="tab_out" title="每台服务器上累计时长最高的前三名客户">时长排行榜</a></li>
                    <li><a id="dl3" class="tab_out" title="每台服务器每种资费标准的使用次数">资费使用率</a></li>
                </ul>
            </div>
			<!--客户使用时长 Table1-->
            <div id="d" class="report_box">
	            <!--数据区域：用表格展示数据-->
	            <div id="report_data">
	            	<table  id="datalist" class="datalist">
	                	<tr>                            
	                    	<th>账号 ID</th>
	                        <th>账务帐号</th>
	                        <th>客户名称</th>
	                        <th class="width200">身份证号码</th>
	                        <th>电话</th>
	                        <th class="width150">月份</th>
	                        <th class="width150">累积时长</th>
	                    </tr> 
	                    <c:forEach items="${allReports}" var="report">
	                    	<tr>
		                    	<td>${report.account.acc_id}</td>
		                        <td>${report.account.acc_login}</td>
		                        <td>${report.account.acc_name}</td>
		                        <td>${report.account.acc_idcard}</td>
		                        <td>${report.account.acc_tel}</td>
		                        <td>${report.bmonth}</td>
		                        <td>${report.accountSumTimeString}</td>
	                        </tr>                 
	                    </c:forEach>
	               	</table>
		       	</div>
		        <!--分页-->
		        <div id="pages">
					<a href="" id="fisrt">首页</a>
			        <a href="#" id="">上一页</a>
			        <a href="#" class="current_page">1</a>
		            <a href="#">2</a>
		            <a href="#">下一页</a>
				    <a href="#">末页</a>
	            </div>
         	</div>
            <!--时长排行旁Table2 -->
        	<div id="d1"> 
				<div id="d1" class="report_box">
                	<!--数据区域：用表格展示数据-->
	                <div id="report_data">
	                    <table id="datalist" style="display:none" class="datalist1">
	                    	<tr>                            
	                        	<th class="width300">Unix 服务器IP</th>
	                            <th>账务帐号</th>
	                            <th>客户名称</th>
	                            <th class="width200">身份证号码</th>
	                            <th class="width150">累积时长</th>
	                        </tr>
	                    </table>
	                </div>
		            <div id="pages">
				        <a href="" id="fisrt">首页</a>
				        <a href="#" id="">上一页</a>
				        <a href="#" class="current_page">1</a>
			            <a href="#">2</a>
			            <a href="#">下一页</a>
			            <a href="#">末页</a>
                    </div>
                 </div>
<!--         	</div> -->
        	
        	 
        </div>
        <div id="footer">
        </div>     
                    
<!--                 <div id="d1"> -->
<!-- 		                数据区域：用表格展示数据 -->
<!-- 		                <div id="report_data"> -->
<!--                     		<table id="datalist" style="display:none" class="datalist1"> -->
<!--                         <tr>                             -->
<!--                             <th class="width300">Unix 服务器IP</th> -->
<!--                             <th>账务帐号</th> -->
<!--                             <th>客户名称</th> -->
<!--                             <th class="width200">身份证号码</th> -->
<!--                             <th class="width150">累积时长</th> -->
<!--                         </tr> -->
<!--                     </table> -->
<!--                      </div> -->
                      <!--分页-->
<!-- 	                <div id="pages"> -->
<!-- 				        <a href="" id="fisrt">首页</a> -->
<!-- 				        <a href="#" id="">上一页</a> -->
<!-- 				        <a href="#" class="current_page">1</a> -->
<!-- 			            <a href="#">2</a> -->
<!-- 			            <a href="#">下一页</a> -->
<!-- 			            <a href="#">末页</a> -->
<!--                     </div> -->
<!--                  </div> -->
                   
                     
<!--                     <table id="datalist" style="display:none"  class="datalist2"> -->
<!--                         <tr>                             -->
<!--                             <th class="width300">Unix 服务器IP</th> -->
<!--                             <th>包月</th> -->
<!--                             <th>套餐</th> -->
<!--                             <th>计时</th> -->
<!--                         </tr>                       -->
<!--                         <tr> -->
<!--                             <td>192.168.0.23</td> -->
<!--                             <td>32</td> -->
<!--                             <td>221</td> -->
<!--                             <td>314</td> -->
<!--                         </tr>  -->
<!--                     </table> -->
                    
<!--                 </div> -->
                <!--分页-->
<!--                 <div id="pages"> -->
<!-- 			        <a href="" id="fisrt">首页</a> -->
<!-- 			        <a href="#" id="">上一页</a> -->
<!-- 			        <a href="#" class="current_page">1</a> -->
<!-- 		            <a href="#">2</a> -->
<!-- 		            <a href="#">下一页</a> -->
<!-- 		            <a href="#">末页</a> -->
<!-- 		        </div> -->
<!-- 				<div id="pages"> -->
<%-- 					<c:choose> --%>
<%--                 		<c:when test="${pageCount.curPage==1 }"> --%>
<!--                 			 <a >首页</a> -->
<!--         	      			 <a >上一页</a> -->
<%--                 		</c:when> --%>
<%--                 		<c:when test="${pageCount.curPage!=1 }"> --%>
<!--                 			 <a href="javaScript:showPage(1)">首页</a> -->
<%--         	      			 <a href="javaScript:showPage(${pageCount.curPage-1 })">上一页</a> --%>
<%--                 		</c:when> --%>
<%--                 	</c:choose> --%>
<%--                     <c:forEach var="i" begin="${pageCount.middle-pageCount.width>0?(pageCount.middle-pageCount.width):1}" end="${pageCount.middle+pc.width}"> --%>
<%--                     	<c:choose> --%>
<%--                     	 <c:when test="${pageCount.totlePage>=i&&i>0 }"> --%>
<%--                     	 <c:choose> --%>
<%-- 	                    	<c:when test="${pageCount.curPage==i }"> --%>
<%-- 	                    		<a class="current_page">${i}</a> --%>
<%-- 	                    	</c:when> --%>
<%-- 	                    	<c:otherwise> --%>
<%-- 	                    		<a href="javaScript:showPage(${i })" >${i}</a> --%>
<%-- 	                    	</c:otherwise> --%>
<%-- 	                     </c:choose> --%>
<%-- 	                   	 </c:when> --%>
<%--                     	</c:choose> --%>
<%--                     </c:forEach> --%>
<%--                     <c:choose> --%>
<%--                 		<c:when test="${pageCount.curPage==pageCount.totlePage }"> --%>
<!--                 			 <a >下一页</a> -->
<%--         	      			 <a >末页</a>共${pageCount.totlePage }页/${pageCount.totleNumber}条记录 --%>
<%--                 		</c:when> --%>
<%--                 		<c:when test="${pageCount.curPage!=pageCount.totlePage }"> --%>
<%--                 			 <a href="javaScript:showPage(${pageCount.curPage+1 })">下一页</a> --%>
<%--                     		 <a href="javaScript:showPage(${pageCount.totlePage })">末页</a>共${pageCount.totlePage }页/${pageCount.totleNumber}条记录 --%>
<%--                 		</c:when> --%>
<%--                 	</c:choose> --%>
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
        <!--主要区域结束-->
<!--         <div id="footer"> -->
<!--         </div> -->
    </body>
</html>
