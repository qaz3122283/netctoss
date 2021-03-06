﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
       <%@ include file ="../include/link.jsp"%>
      
        <script language="javascript" type="text/javascript">
        	
        	//提交表单数据
            $(function(){
            	$("#addfee").click(function(){
            		if(check()==undefined){           			
            		$.ajax({
            			url:"${pageContext.request.contextPath}/fee/feeAdd.do",
            			type:'post',
            			data:$("#addfee_form").serialize(),
            		    success:function(result){
            				if(result==1){
            					$("#save_success").show().delay(5000).hide(0);
            					$(location).attr('href','${pageContext.request.contextPath}/fee/feeList.do');
            				}else            					
        						$("#save_fail").text("数据不能为空！").show().delay(3000).hide(0);	
            			} 
            		})
            	}else{
            		if($("#fee_name").val()=='')
            			$("#save_fail").text("数据不能为空！").show().delay(3000).hide(0);
            	}
            	}) 	
            })
          
           //切换资费类型
            $(function(){
            	$("#monthly").click(function(){
            		$("#ftime").hide();
            		$("#funitcost").hide();
            		$("#fcost").show();
            	})
            	
            	$("#timeBased").click(function(){
            		$("#ftime").hide();
            		$("#fcost").hide();
            		$("#funitcost").show();
            	})
            	
            	$("#package").click(function(){
            		$("#ftime").show();
            		$("#fcost").show();
            		$("#funitcost").show();
            	})
            	
            })
          //表单验证
          function check(){
        	//验证资费名称正确性
        	
        		$("#fee_name").blur(function(){
        			var fee_name = $("#fee_name").val();
        			var regCode = /^[\u4E00-\u9FA5A-Za-z0-9_]{1,50}$/;
            		if(regCode.test(fee_name)==false){
            			$("#fnamePrompt").attr("class","validate_msg_short error_msg");
            			$("#fnameStart").text("*");
            			$("#fnamePrompt").text("50长度以内的字母、数字、汉字和下划线的组合");
            			return false;
            		}
            		$("#fnameStart").text("");
        			$("#fnamePrompt").text("");
        			$("#fnamePrompt").attr("class","");
        			return true;
        		})
        	        	
        	//验证基本时长        	
        		$("#fee_time").blur(function(){
        			var fee_time = $("#fee_time").val();
        			if(fee_time!=''){
	        			var regCode = /^\d{1,600}$/;
	            		if(regCode.test(fee_time)==false){
	            			$("#ftimePrompt").attr("class","validate_msg_short error_msg");
	            			$("#ftimeStart").text("*");
	            			$("#ftimePrompt").text("1-600之间的整数");
	            			return false;
	            		}
        			}
	            		$("#ftimeStart").text("");
	        			$("#ftimePrompt").text("");
	        			$("#ftimePrompt").attr("class","");
	        			return true;
        			
        		})
        	        	
        	//验证基本费用       	
        		$("#fee_cost").blur(function(){
        			var fee_cost = $("#fee_cost").val();
        			if(fee_cost!=''){
	        			var regCode = /^\d{1,6}(\.\d{1,2})?$/;
	            		if(regCode.test(fee_cost)==false){
	            			$("#fcostPrompt").css('display','block');
	            			return false;
	            		}
        			}
            		$("#fcostPrompt").css('display','none');
        			return true;
        		})        	
        	
        	//验证单位费用
        	
        		$("#funit_cost").blur(function(){
        			var funitcost = $("#funit_cost").val();
        			if(funitcost!=''){
	        			var regCode = /^\d{1,6}(\.\d{1,2})?$/;
	            		if(regCode.test(funitcost)==false){
	            			$("#funitcostPrompt").css('display','block');
	            			return false;
	            		}
        			}
            		$("#funitcostPrompt").css('display','none');
        			return true;
        		})        	
        	
        	//验证资费说明
        	
        		$("#fcomment").blur(function(){
        			var fcomment = $("#fcomment").val();
        			var regCode = /^[\u4E00-\u9FA5A-Za-z0-9_]{1,100}$/;
            		if(regCode.test(fcomment)==false){
            			$("#fcomment_msg").css('display','block');
            			return false;
            		}
            		$("#fcomment_msg").css('display','none');
        			return true;
        		})
        	
        }
        	 
        	       	
        </script>
    </head>
    <body name="fee_off">
       <!-- 导航栏与当前用户 -->
        	<%@include file="../include/header.jsp" %>
        
        <div id="main">            
            <div id="save_success" class="save_success">添加资费成功！</div>
            <div id="save_fail" class="save_fail">对不起，添加资费失败~</div>
            <form action="${pageContext.request.contextPath}/fee/feeAdd.do"  class="main_form" id="addfee_form">
                
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info">
                    <input type="text" class="width300" value="" name="fee_name" id="fee_name"/>
                    <span class="required" id="fnameStart"></span>
                    <div id="fnamePrompt"></div>
                </div>
                
                <div class="text_info clearfix"><span>资费类型：</span></div>
                <div class="input_info fee_type">
                    <input type="radio" name="fee_type" id="monthly"  value="1"/>
                    <label for="monthly">包月</label>
                    <input type="radio" name="fee_type" id="package"  value="2" checked="checked"/>
                    <label for="package">套餐</label>
                    <input type="radio" name="fee_type" id="timeBased"  value="3"/>
                    <label for="timeBased">计时</label>
                </div>
                
                <div id="ftime">
	                <div class="text_info clearfix" ><span>基本时长：</span></div>
	                <div class="input_info">
	                    <input type="text" value="" class="width100" name="time" id="fee_time"/>
	                    <span class="info">小时</span>
	                    <span class="required" id="ftimeStart"></span>
	                    <div id="ftimePrompt"></div>
	                </div>
                </div>
                
                <div id="fcost">
	                <div class="text_info clearfix"><span>基本费用：</span></div>
	                <div class="input_info" >
	                    <input type="text" value="" class="width100" name="basecost" id="fee_cost"/>
	                    <span class="info">元</span>	                    
	                    <span class="required" id="fcostStart">*</span>
	                    <div class="validate_msg_medium error_msg" id="fcostPrompt" style="display:none">0-99999.99之间的数值</div>
	                </div>
                </div>
                
                <div id="funitcost">
	                <div class="text_info clearfix" ><span>单位费用：</span></div>
	                <div class="input_info">
	                    <input type="text" value="" class="width100" name="unitcost" id="funit_cost"/>
	                    <span class="info">元/小时</span>
	                    <span class="required">*</span>
	                    <div class="validate_msg_medium error_msg" id="funitcostPrompt" style="display: none">0-99999.99之间的数值</div>
	                </div>
                </div>
                
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70" name="fee_comment" id="fcomment"></textarea>
                 	<div class="validate_msg_short error_msg" id="fcomment_msg" style="display: none">100长度的字母、数字、汉字和下划线的组合</div>
                </div> 
                                   
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" id="addfee"/>
                    <input type="button" value="取消" class="btn_save" onclick="location.href='${pageContext.request.contextPath}/view/fee/fee_add.jsp';"/>
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
