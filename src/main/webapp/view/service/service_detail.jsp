<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@include file="../include/link.jsp" %>
        <script language="javascript" type="text/javascript">
        	$(function(){	
        		$("#cancel").click(function(){
					location.href="${pageContext.request.contextPath}/view/service/service_list.jsp";
				});
        		$("#selstatus option[value='${service1.ser_state}']").attr("selected", "selected");
	        });
        </script>
    </head>
    <body name="service_off">
        <!--Logo区域开始-->
        <!--导航区域开始-->
        <%@include file="../include/header.jsp" %>
        <!--主要区域开始-->
        <!--导航区域结束-->
        <div id="main">            
            <form action="" method="" class="main_form">
                <!--必填项-->
                <div class="text_info clearfix"><span>业务账号ID：</span></div>
                <div class="input_info"><input type="text" value="${service1.ser_id}" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>账务账号ID：</span></div>
                <div class="input_info"><input type="text" value="${service1.account.acc_id}" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>客户姓名：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="${service1.account.acc_name}" /></div>
                <div class="text_info clearfix"><span>身份证号码：</span></div>
                <div class="input_info"><input type="text" readonly class="readonly" value="${service1.account.acc_idcard}" /></div>
                <div class="text_info clearfix"><span>服务器 IP：</span></div>
                <div class="input_info"><input type="text" value="${service1.ser_ip}" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>OS 账号：</span></div>
                <div class="input_info"><input type="text" value="${service1.ser_os}" readonly class="readonly" /></div>
                
                <div class="text_info clearfix"><span>开通时间：</span></div>
                <div class="input_info"><input value="${service1.ser_createtime}" type="text" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>状态：</span></div>
                <div class="input_info">
                    <select id="selstatus" disabled>
                        <option value="1">开通</option>
                        <option value="0">暂停</option>
                        <option value="2">删除</option>
                    </select>                        
                </div>      
                
                <div class="text_info clearfix"><span>暂停/删除时间：</span></div>
                <div class="input_info"><input value="${service1.ser_recordtime}" type="text" readonly class="readonly" /></div>
                <div class="text_info clearfix"><span>资费 ID：</span></div>
                <div class="input_info"><input value="${service1.fee.fee_id}" type="text" class="readonly" readonly /></div>
                <div class="text_info clearfix"><span>资费名称：</span></div>
                <div class="input_info"><input value="${service1.fee.fee_name}" type="text" readonly class="width200 readonly" /></div>
                <div class="text_info clearfix"><span>资费说明：</span></div>
                <div class="input_info_high">
                    <textarea class="width300 height70 readonly" readonly>${service1.fee.fee_comment}</textarea>
                </div>  
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input id="cancel" type="button" value="返回" class="btn_save" />
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
           
        </div>
    </body>
</html>
