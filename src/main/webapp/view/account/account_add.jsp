<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <%@include file="../include/link.jsp" %>
        <style type="text/css">
            .xx{
            	color: red;
            }
        </style>
        <script language="javascript" type="text/javascript">
        //初始化表单验证
        	$(function(){
        		$(".xx").hide();
        	})
            //保存成功的提示信息
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

            //显示选填的信息项
            function showOptionalInfo(imgObj) {
                var div = document.getElementById("optionalInfo");
                if (div.className == "hide") {
                    div.className = "show";
                    imgObj.src = "../../images/hide.png";
                }
                else {
                    div.className = "hide";
                    imgObj.src = "../../images/show.png";
                }
            } 
            //表单验证,验证姓名
            function addName(){
            	var reg =  /^[\w\u4e00-\u9fa5]{1,20}$/; 
            	var r = $("[name='acc_name']").val().match(reg); 
            	if($("[name='acc_name']").val()==null || $("[name='acc_name']").val()==""){
            		$("#name1").hide();
            		$("#name2").show();
            		$("#name3").hide();
            		return false;
            	}else if(r==null){
            		$("#name1").hide();
            		$("#name3").show();
            		$("#name2").hide();
            		return false;
            	}else{
            		$("#name1").hide();
            		$("#name2").hide();
            		$("#name3").hide();
            		return true;
            	}
            }
            //验证省份证
            function addIdcard(idc){
            	var reg=/^[1-9]\d{5}(19|20)\d{2}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}[\d|x]$/;
            	var r=$("[name='acc_"+idc+"']").val().match(reg); 
            	var birth=$("[name='acc_"+idc+"']").val().substring(10,14);
            	if($("[name='acc_"+idc+"']").val()==null || $("[name='acc_"+idc+"']").val()==""){
            		$("#"+idc+"1").hide();
            		$("#"+idc+"2").show();
            		$("#"+idc+"3").hide();
            		return false;
            	}else if(r==null){
            		$("#"+idc+"1").hide();
            		$("#"+idc+"3").show();
            		$("#"+idc+"2").hide();
            		return false;
            	}else if(checkbirth(birth)){
            		$("#"+idc+"1").hide();
            		$("#"+idc+"2").hide();
            		$("#"+idc+"3").hide();
            		return true;
            	}else{
            		$("#"+idc+"1").hide();
            		$("#"+idc+"3").show();
            		$("#"+idc+"2").hide();
            		return false;
            	}
            }
            //验证生日
            function checkbirth(birth){
            	var m=birth.substring(0,2);
            	var d=birth.substring(2,4);
            	if((m==01||m==03||m==05||m==07||m==08||m==10||m==12)&&d<32&&d>0){
            		return true;
            	}else if((m==04||m==06||m==09||m==11)&&d<31&&d>0){
            		return true;
            	}else if(m==02&&d<30&&d>0){
            		return true;
            	}else{
            		return false;
            	}
            }
            //登录账号和密码
            function addLogin(aa){
            	var reg =  /^[\w\u4e00-\u9fa5]{1,30}$/;
            	var r = $("[name='acc_"+aa+"']").val().match(reg); 
            	if($("[name='acc_"+aa+"']").val()==null || $("[name='acc_"+aa+"']").val()==""){
            		$("#"+aa+"1").hide();
            		$("#"+aa+"2").show();
            		$("#"+aa+"3").hide();
            		return false;
            	}else if(r==null){
            		$("#"+aa+"1").hide();
            		$("#"+aa+"3").show();
            		$("#"+aa+"2").hide();
            		return false;
            	}else{
            		$("#"+aa+"1").hide();
            		$("#"+aa+"2").hide();
            		$("#"+aa+"3").hide();
            		return true;
            	}
            }
            //重复密码
            function addpsw(){
            	if($("[name='acc_psw']").val()==$("[name='password']").val()){
            		$("#password").hide();
            		return true;
            	}else{
            		$("#password").show();
            		return false;
            	}
            }
            //验证手机号
            function addTel(){
            	var reg=/^(1)\d{10}$/;
            	var r=$("[name='acc_tel']").val().match(reg);
            	if($("[name='acc_tel']").val()==null||$("[name='acc_tel']").val()==""){
            		$("#tel").hide();
            		return true;
            	}else if(r==null){
            		$("#tel").show();
            		return false;
            	}else $("#tel").hide();return true;
            }
            //验证推荐人省份证
            function recidcard(){
            	var reg=/^[1-9]\d{5}(19|20)\d{2}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}[\d|x]$/;
            	var idcr=$("[name='acc_recidcard']").val();
            	var birth =idcr.substring(10,14);
            	var r=idcr.match(reg);
            	if($("[name='acc_recidcard']").val()==null||$("[name='acc_recidcard']").val()==""){
            		$("#recidcard3").hide();
            		$("#recidcard2").hide();
            		return true;
            	}else if(r==null){
            		$("#recidcard3").show();
            		$("#recidcard2").hide();
            		return false;
            	}else if(checkbirth(birth)){
            		$("#recidcard3").hide();
            		$("#recidcard2").hide();
            		$("[name='birth']").val(birth);
            		return true;
            	}else{
            		$("#recidcard3").show();
            		$("#recidcard2").hide();
            		return false;
            	}
            }
            //验证邮箱
            function addEmail(){
            	var reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            	var r=$("[name='acc_email']").val().match(reg);
            	if($("[name='acc_email']").val()==null||$("[name='acc_email']").val()==""){
            		$("#email").hide();
            		return true;
            	}else if(r==null){
            		$("#email").show();
            		return false;
            	}else{
            		$("#email").hide();
            		return true;
            	}
            }
            //验证通信地址
            function address(){
            	var reg=/^[\w\u4e00-\u9fa5]{0,50}$/;
            	var r=$("[name='acc_address']").val().match(reg);
            	if(r==null){
            		$("#address").show();
            		return false;
            	}else $("#address").hide();return true;
            }
            //验证邮编
            function zipcode(){
            	var reg=/^\d{6}$/;
            	var r=$("[name='acc_zipcode']").val().match(reg);
            	if($("[name='acc_zipcode']").val()==null||$("[name='acc_zipcode']").val()==""){
            		$("#zipcode").hide();
            		return true;
            	}else if(r==null){
            		$("#zipcode").show();
            		return false;
            	}else $("#zipcode").hide();return true;
            }
            //验证qq
            function qq(){
            	var reg=/^\d{5,16}$/;
            	var r=$("[name='acc_qq']").val().match(reg);
            	if($("[name='acc_qq']").val()==null||$("[name='acc_qq']").val()==""){
            		$("#qq").hide();
            		return true;
            	}else if(r==null){
            		$("#qq").show();
            		return false;
            	}else $("#qq").hide();return true;
            }
            
            function addAccount(){
            	if(addName()&&addIdcard('idcard')&&addLogin('login')&&addLogin('psw')&&addpsw()&&addTel()&&recidcard()
            			&&addEmail()&&address()&&zipcode()&&qq()){
            		$("#form").submit();
            		/* $.ajax({
            			url:'${pageContext.request.contextPath }/account/AddAccountAction.do',
            			type:'post',
            			data:$("#form").serialize(),
            		}) 
            		*/
            	}else{
            		alert("请将信息填写完整（注意红色提示）");
            	}
            }  
        </script>
    </head>
    <body name="account_off">
        <!--Logo区域开始-->
        <!-- <div id="header">
            <img src="../../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div> -->
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <!-- <div id="navi"> -->
        <%@include file="../include/header.jsp" %>
        <!-- </div> -->
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">       
            <!--保存成功或者失败的提示消息-->     
            <!-- <div id="save_result_info" class="save_fail">保存失败，该身份证已经开通过账务账号！</div> -->
            <form action="${pageContext.request.contextPath }/account/AddAccountAction.do" method="post" class="main_form" id="form">
                <!--必填项-->
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info">
                    <input type="text" value="" name="acc_name" onblur="addName()" />
                   <!-- <span class="required">*</span>-->
                    <div class="validate_msg_long"><p id="name1">(必填)20长度以内的汉字、字母和数字的组合</p>
                    <p id="name2" class="xx" >姓名不能为空</p>
                    <p id="name3" class="xx" >姓名格式不正确</p>
                    </div>
                </div>
                <div class="text_info clearfix"><span>身份证：</span></div>
                <div class="input_info">
                    <input type="text" value="" name="acc_idcard" onblur="addIdcard('idcard')" />
                    <!-- <span class="required">*</span>-->
                    <div class="validate_msg_long">
                    		<p id="idcard1">(必填)正确的身份证号码格式</p>
                    	<p id="idcard2" class="xx">身份证不能为空</p>
                    	<p id="idcard3" class="xx">身份证格式错误</p>
                    </div>
                </div>
                <div class="text_info clearfix"><span>登录账号：</span></div>
                <div class="input_info">
                    <input type="text" value="创建即启用，状态为开通" name="acc_login" onblur="addLogin('login')" />
                    <!-- <span class="required">*</span>-->
                    <div class="validate_msg_long">
                    	<p id="login1">(必填)30长度以内的字母、数字和下划线的组合</p>
                    	<p id="login2" class="xx">登录账号不能为空</p>
                    	<p id="login3" class="xx">登录账号格式错误</p></div>
                </div>
                <div class="text_info clearfix"><span>密码：</span></div>
                <div class="input_info">
                    <input type="password" name="acc_psw" onblur="addLogin('psw')" />
                    <!-- <span class="required">*</span>-->
                    <div class="validate_msg_long">
                    	<p id="psw1">(必填)30长度以内的字母、数字和下划线的组合</p>
                    	<p id="psw2" class="xx">密码不能为空</p>
                    	<p id="psw3" class="xx">密码格式错误</p></div>
                </div>
                <div class="text_info clearfix"><span>重复密码：</span></div>
                <div class="input_info">
                    <input type="password" name="password" onblur="addpsw()" />
                    <!-- <span class="required">*</span>-->
                    <div class="validate_msg_long">
                    
                    <p class="xx" id="password">两次密码必须相同</p></div>
                </div>     
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input type="text" class="width200" name="acc_tel"  onblur="addTel()" />
                    <!-- <span class="required">*</span>-->
                    <div class="validate_msg_medium"><p id="tel" class="xx">请输入正确手机号</p></div>
                </div>                
                <!--可选项-->
                <div class="text_info clearfix"><span>可选项：</span></div>
                <div class="input_info">
                    <img src="../../images/show.png" alt="展开" onclick="showOptionalInfo(this);" />
                </div>
                <div id="optionalInfo" class="hide">
                    <div class="text_info clearfix"><span>推荐人身份证号码：</span></div>
                    <div class="input_info">
                        <input type="text" name="acc_recidcard" onblur="recidcard()" />
                        <div class="validate_msg_long">
                        <p id="recidcard2" class="xx">身份证不能为空</p>
                    	<p id="recidcard3" class="xx">身份证格式错误</p></div>
                    </div>
                    <div class="text_info clearfix"><span>生日：</span></div>
                    <div class="input_info">
                        <input type="text" value="由身份证号计算而来" readonly name="birth" class="readonly" />
                    </div>
                    <div class="text_info clearfix"><span>Email：</span></div>
                    <div class="input_info">
                        <input type="text" class="width350" name="acc_email" onblur="addEmail()"/>
                        <div class="validate_msg_tiny"><p class="xx" id="email">请输入正确的邮箱格式</p></div>
                    </div> 
                    <div class="text_info clearfix"><span>职业：</span></div>
                    <div class="input_info">
                        <select name="acc_job">
                            <option value="1">干部</option>
                            <option value="2">学生</option>
                            <option value="3">技术人员</option>
                            <option value="4">其他</option>
                        </select>                        
                    </div>
                    <div class="text_info clearfix"><span>性别：</span></div>
                    <div class="input_info fee_type">
                        <input type="radio" name="acc_sex" checked="checked" id="female" value="0" />
                        <label for="female">女</label>
                        <input type="radio" name="acc_sex" id="male" value="1" />
                        <label for="male">男</label>
                    </div> 
                    <div class="text_info clearfix"><span>通信地址：</span></div>
                    <div class="input_info">
                        <input type="text" class="width350" name="acc_address" onblur="address()" />
                        <div class="validate_msg_tiny"><p class="xx" id="address">不能使用符号五十长度以内</p></div>
                    </div> 
                    <div class="text_info clearfix"><span>邮编：</span></div>
                    <div class="input_info">
                        <input type="text" name="acc_zipcode" onblur="zipcode()"/>
                        <div class="validate_msg_long"><p class="xx" id="zipcode">6位数字</p></div>
                    </div> 
                    <div class="text_info clearfix"><span>QQ：</span></div>
                    <div class="input_info">
                        <input type="text" name="acc_qq" onblur="qq()" />
                        <div class="validate_msg_long"><p class="xx" id="qq">5到13位数字</p></div>
                    </div>                
                </div>
                <!--操作按钮-->
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="addAccount();" />
                    <input type="button" value="取消" class="btn_save" />
                </div>
            </form>  
        </div>
        <!--主要区域结束-->
        <div id="footer">
          
        </div>
    </body>
</html>
