<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@ include file ="../include/link.jsp"%>     
    </head>
    <body name="fee_off">
       <!-- 导航栏与当前用户 -->
        	<%@include file="../include/header.jsp" %>
        
        <div id="main">            
            <form action="" class="main_form">
                <div class="text_info clearfix"><span>资费ID：</span></div>
                <div class="input_info"><input type="text" class="readonly"  value="${fee.fee_id}" /></div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info"><input type="text" class="readonly"  value="${fee.fee_name}"/></div>
                <div class="text_info clearfix"><span>资费状态：</span></div>
                <div class="input_info">
                    <select class="readonly" disabled="disabled">
                         <c:choose>
                       		<c:when test="${fee.fee_state==0}"><option>暂停</option></c:when>
                       		<c:when test="${fee.fee_state==1}"><option>开通</option></c:when>
                   		</c:choose>
                    </select>                        
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info fee_type">
                    <input type="radio" name="radFeeType" id="monthly" disabled="disabled" value="1"
                    	 <c:if test="${fee.fee_type==1}">checked="checked"</c:if>
                    />
                    <label for="monthly">包月</label>
                    <input type="radio" name="radFeeType" id="package" disabled="disabled" value="2"
                    	<c:if test="${fee.fee_type==2}">checked="checked"</c:if>
                    />
                    <label for="package">套餐</label>
                    <input type="radio" name="radFeeType" id="timeBased" disabled="disabled" value="3"
                    	<c:if test="${fee.fee_type==3}">checked="checked"</c:if>
                    />
                    <label for="timeBased">计时</label>
                </div>
                <div class="text_info clearfix"><span>基本时长：</span></div>
                <div class="input_info">
                    <input type="text" class="readonly" readonly="readonly" value="${fee.fee_time}"/>                    />
                    <span>小时</span>
                </div>
                <div class="text_info clearfix"><span>基本费用：</span></div>
                <div class="input_info">
                    <input type="text"  class="readonly" readonly="readonly" value="${fee.fee_basecost}" />
                    <span>元</span>
                </div>
                <div class="text_info clearfix"><span>单位费用：</span></div>
                <div class="input_info">
                    <input type="text"  class="readonly" readonly="readonly" value="${fee.fee_unitcost}" />
                    <span>元/小时</span>
                </div>
                <div class="text_info clearfix"><span>创建时间：</span></div>
                <div class="input_info"><input type="text"  class="readonly" readonly="readonly" value="${fee.fee_startdate}" /></div>      
                <div class="text_info clearfix"><span>启动时间：</span></div>
                <div class="input_info"><input type="text"  class="readonly" readonly="readonly" value="${fee.fee_date}" /></div>      
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70 readonly" readonly="readonly">${fee.fee_comment}</textarea>
                </div>                    
                <div class="button_info clearfix">
                    <input type="button" value="返回" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/fee/feeList.do';" />
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
