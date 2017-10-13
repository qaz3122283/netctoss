﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@ include file ="../include/link.jsp"%>
        <script language="javascript" type="text/javascript">
            //保存结果的提示
            function showResult() {
                showResultDiv(true);
                window.setTimeout("showResultDiv(false);", 3000);
            }
            function showResultDiv(flag) {
                var divResult = $("#save_result_info");
                if (flag)
                    divResult.show();
                else
                    divResult.hide();
            }

            //切换资费类型
            $(function(){
            	$("#monthly").click(function(){
            		$("#ftime").hide();            		
            		$("#funitcost").hide();            		
            		$("#fcost").show();
            	    $("#ftime").val('0');
            		$("#funitcost").val('0'); 
            	})
            	
            	$("#timeBased").click(function(){
            		$("#ftime").hide();
            		$("#fcost").hide();
            		$("#funitcost").show();
            		$("#ftime").val('0');
            		$("#fcost").val('0');
            	})
            	
            	$("#package").click(function(){
            		$("#ftime").show();
            		$("#fcost").show();
            		$("#funitcost").show();
            	})
            	
            })
        </script>
    </head>
    <body name="fee_off">
        <!-- 导航栏与当前用户 -->
        	<%@include file="../include/header.jsp" %>
       
        <div id="main">            
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form action="${pageContext.request.contextPath}/fee/feeModi.do?fee_id=${fee.fee_id}" method="post" class="main_form">
                <div class="text_info clearfix"><span>资费ID：</span></div>
                <div class="input_info"><input type="text" class="readonly" readonly="readonly" value="${fee.fee_id}" /></div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info">
                    <input type="text" class="width300" value=" ${fee.fee_name} " name="fee_name"/>
                    <!-- <span class="required">*</span>
                    <div class="validate_msg_short">50长度的字母、数字、汉字和下划线的组合</div> -->
                </div>
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info fee_type">
                    <input type="radio" name="radFeeType" id="monthly" onclick="feeTypeChange(1);" value="1"
                    	<c:if test="${fee.fee_type==1}">checked="checked"</c:if>
                    />
                    <label for="monthly">包月</label>
                    <input type="radio" name="radFeeType" id="package" onclick="feeTypeChange(2);" value="2"
                    	<c:if test="${fee.fee_type==2}">checked="checked"</c:if>
                    />
                    <label for="package">套餐</label>
                    <input type="radio" name="radFeeType" id="timeBased" onclick="feeTypeChange(3);" value="3"
                    	<c:if test="${fee.fee_type==3}">checked="checked"</c:if>
                    />
                    <label for="timeBased">计时</label>
                </div>
                <div id="ftime">
	                <div class="text_info clearfix"><span>基本时长：</span></div>
	                <div class="input_info">
	                    <input type="text" value="${fee.fee_time}" class="width100" name="fee_time"/>
	                    <span class="info">小时</span>
	                    <!-- <span class="required">*</span>
	                    <div class="validate_msg_long">1-600之间的整数</div> -->
	                </div>
                </div>
                <div id="fcost">
	                <div class="text_info clearfix"><span>基本费用：</span></div>
	                <div class="input_info">
	                    <input type="text" value="${fee.fee_basecost}" class="width100" name="fee_basecost"/>
	                    <span class="info">元</span>
	                    <!-- <span class="required">*</span>
	                    <div class="validate_msg_long">0-99999.99之间的数值</div> -->
	                </div>
                </div>
               	<div id="funitcost">
	                <div class="text_info clearfix"><span>单位费用：</span></div>
	                <div class="input_info">
	                    <input type="text" value="${fee.fee_unitcost}" class="width100" name="fee_unitcost"/>
	                    <span class="info">元/小时</span>
	                    <!-- <span class="required">*</span>
	                    <div class="validate_msg_long">0-99999.99之间的数值</div> -->
	                </div>
                </div>   
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70" name="fee_comment">${fee.fee_comment}
                    </textarea>
                   <!--  <div class="validate_msg_short">100长度的字母、数字、汉字和下划线的组合</div> -->
                </div>                    
                <div class="button_info clearfix">
                    <input type="submit" value="保存" class="btn_save"  onclick="showResult();" />
                    <input type="button" value="取消" class="btn_save" />
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            
        </div>
    </body>
</html>
