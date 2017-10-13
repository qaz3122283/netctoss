﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@include file ="/view/include/link.jsp"%> 
        <script language="javascript" type="text/javascript">
        //写入下拉框中的年份和月份
        function initialYearAndMonth() {
            //写入最近3年
            var yearObj = document.getElementById("selYears");
            var year = (new Date()).getFullYear();
            for (var i = 0; i <= 2; i++) {
                var opObj = new Option(year - i, year - i);
                yearObj.options[i] = opObj;
                if(yearObj.options[i].value=='${year}'){
                	yearObj.options[i].selected=true;
                }
            }
            //写入 12 月
            var monthObj = document.getElementById("selMonths");
            var opObj = new Option("全部", "-1");
            monthObj.options[0] = opObj;
            for (var i = 1; i <= 12; i++) {
                var opObj = new Option(i, i);
                monthObj.options[i] = opObj;
                if(monthObj.options[i].value=='${month}'){
                	monthObj.options[i].selected=true;
                }
            }
        }
        
        /* 跳转明细页面 */
        function getitem(acc_id,bill_id){
        	location.href='${pageContext.request.contextPath }/billItem/BillItemListController.do?bill_id='+bill_id
        }
        //翻页
        function showPage(cur){
        	location.href='${pageContext.request.contextPath }/bill/BillListAction.do?acc_idcard=${ac.acc_idcard }&acc_login=${ac.acc_login }&acc_name=${ac.acc_name }&month=${month}&year=${year}&middle=${pc.middle}&curPage='+cur
        }
        </script>
    </head>
    <body name="bill_off" onload="initialYearAndMonth();">
         <%@include file ="/view/include/header.jsp"%>
        <!--主要区域开始-->
        <div id="main">
            <form action="${pageContext.request.contextPath }/bill/BillListAction.do" method="post">
                <!--查询-->
                <div class="search_add">
                    <div>身份证：<input type="text" name="acc_idcard" value="${ac.acc_idcard }" class="text_search" /></div>
                    <div>账务账号：<input type="text" name="acc_login" value="${ac.acc_login }" class="width100 text_search" /></div>                            
                    <div>姓名：<input type="text" name="acc_name" value="${ac.acc_name }" class="width70 text_search" /></div>
                    <div>
                        <select name="year" class="select_search" id="selYears">
                        </select>
                        年
                        <select name="month" class="select_search" id="selMonths">
                        </select>
                        月
                    </div>
                    <div><input type="submit" value="搜索" class="btn_search" /></div>
                </div>  
               </form>
                <!--数据区域：用表格展示数据-->  
              <form action="" method="">   
                <div id="data">            
                    <table id="datalist">
                    <tr>
                        <th class="width50">账单ID</th>
                        <th class="width70">姓名</th>
                        <th class="width150">身份证</th>
                        <th class="width150">账务账号</th>
                        <th>费用</th>
                        <th class="width100">月份</th>
                        <th class="width100">支付方式</th>
                        <th class="width100">支付状态</th>                                                        
                        <th class="width50"></th>
                    </tr>
                    <c:forEach items="${lb}" var="bill">
	                    <tr id="${bill.bill_id }item">
	                        <td>${bill.bill_id }</td>
	                        <td>${bill.acc.acc_name }</td>
	                        <td>${bill.acc.acc_idcard }</td>
	                        <td>${bill.acc.acc_login }</td>
	                        <td>${bill.bill_cost }</td>
	                        <td><fmt:formatDate value="${bill.bill_month}" pattern="yyyy年MM月"/></td>
	                        <c:choose>
	                        <c:when test="${bill.pstate=='已支付' }">
	                        	<td>${bill.payway }</td>
	                       	</c:when>
	                       	<c:otherwise>
	                       		<td></td>
	                       	</c:otherwise>
	                        </c:choose>
	                        <td>${bill.pstate }</td>                            
	                        <td><a href="javascript:getitem(${bill.acc.acc_id },${bill.bill_id })" title="账单明细">明细</a></td>
	                    </tr>
	                 </c:forEach>
                </table>
                
                <p>业务说明：<br />
                1、设计支付方式和支付状态，为用户自服务中的支付功能预留；<br />
                2、只查询近 3 年的账单，即当前年和前两年，如2013/2012/2011；<br />
                3、年和月的数据由 js 代码自动生成；<br />
                4、由数据库中的ｊｏｂ每月的月底定时计算账单数据。</p>
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
