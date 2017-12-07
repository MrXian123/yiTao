// JavaScript Document

$(document).ready(function(){
	//清空输入框
	$(".inputField").each(function(){
		$(this).val("");
	});

	//placeholder IE
	$('input[placeholder]').placeholder().css({
	});

	//显示“国家区号“
	$(".selectedArea").click(function(event){
		if( $(this).hasClass("selectedAreaActive") ) {
			//隐藏“国家区号”列表
			$(this).removeClass("selectedAreaActive")
			$(".phoneCode").css("display", "none");
		}else{
			//显示“国家区号”列表
			$(this).addClass("selectedAreaActive");
			$(".phoneCode").css("display", "block");
		}
		event.stopPropagation(); // 阻止事件冒泡
	});

	//点击“国家区号”外的区域，隐藏“国家区号“
	$("body").click(function(){
		if( $(".selectedArea").hasClass("selectedAreaActive") ) {
			//隐藏“国家区号”列表
			$(".selectedArea").removeClass("selectedAreaActive")
			$(".phoneCode").css("display", "none");
		}
	});

	//选择“国家区号”
	$(".phoneCode").find("li").click(function(){
		$(this).addClass("selected").siblings().removeClass("selected");
		$(".selectedArea").html($(this)[0].innerText + '<span class="selectedAreaIcon"></span>');
		$(".selectedArea").removeClass("selectedAreaActive");
		$(".selectedArea").attr("item_id", $(this).attr("item_id"));
		$(".phoneCode").css("display", "none");
	});


	//检查“用户名”
	//“用户名”获得焦点
	inputHadFocus(".inputUserName", ".hintUserName", ".inputUserNameError", ".inputUserNameResult");

	//“用户名”失去焦点
	inputNotFocus(".inputUserName", ".hintUserName");
	
	//“用户名”有输入，动态检查
	$("#idUserName").bind("input propertychange", function(){
		inputDynamicCheck(".hintUserName", ".inputUserNameError", ".inputUserNameDiv", ".inputUserNameResult");
		//输入格式错误，有规定外的其它字符
		if( /[^0-9-_\u4e00-\u9fa5a-zA-Z]/.test($(".inputUserName").val()) ){
			$(".inputUserNameDiv").css("borderColor", "#e22");
			$(".inputUserNameError").html('<span class="inputErrorIcon"></span>' + "格式错误，仅支持汉字、字母、数字、“-”“_”的组合");
			$(".inputUserNameError").css("display", "block").addClass("active");
			$(".hintUserName").css("display", "none").removeClass("active");
		}
	});

	//“用户名”有输入，完成输入时检查
	$(".inputUserName").change(function(){
		var userNmaeText = $(this).val();
		//输入有规定外的其它字符
		if( $(".inputUserNameError").hasClass("active") ){
			return;
		}
		//输入框没有输入
		if( userNmaeText.length == 0 ){
			return;
		}
		if(userNmaeText.length < 4 || userNmaeText.length > 20 ){
			$(".inputUserNameDiv").css("borderColor", "#e22");
			$(".inputUserNameError").html('<span class="inputErrorIcon"></span>' + "长度只能在4-20个字符之间");
			$(".inputUserNameError").css("display", "block").addClass("active");
			return;
		}
		//检查输入类型（全数字）
		var allNum = /^\d*$/g;
		if( allNum.test(userNmaeText) ) {
			$(".inputUserNameDiv").css("borderColor", "#e22");
			$(".inputUserNameError").html('<span class="inputErrorIcon"></span>' + "用户名不能是纯数字，建议使用中文、字母、数字的组合！");
			$(".inputUserNameError").css("display", "block").addClass("active");
			return;
		}
		//检查输入类型（规定外的其它字符)
		if( /[^0-9-_\u4e00-\u9fa5a-zA-Z]/.test(userNmaeText) ){
			//输入格式错误，有规定外的其它字符
			$(".inputUserNameDiv").css("borderColor", "#e22");
			$(".inputUserNameError").html('<span class="inputErrorIcon"></span>' + "格式错误，仅支持汉字、字母、数字、“-”“_”的组合");
			$(".inputUserNameError").css("display", "block").addClass("active");
			$(".hintUserName").css("display", "none").removeClass("active");
			return;
		}
		$(".inputUserNameResult").addClass("active").css("visibility", "visible");
	});

	//使用推荐用户名
	$(".hadUserName").find("li").click(function(){
		$(".inputUserNameResult").addClass("active").css("visibility", "visible");
		$(".inputUserName").val($(this).text()).css("color", "#333").focus();
		$(".hadUserName").css("visibility", "hidden");
	});

	//检查“设置密码“
	//“设置密码”获得焦点
	inputHadFocus(".inputPassword", ".hintPassword", ".inputPasswordError", ".inputPasswordResult");

	//“设置密码”失去焦点
	inputNotFocus(".inputPassword", ".hintPassword");

	//“设置密码”有输入，动态检查
	$("#idPassword").bind("input propertychange", function(){
		inputDynamicCheck(".hintPassword", ".inputPasswordError", ".inputPasswordDiv", ".inputPasswordResult");
		//检查是否输入中文
		if( /[\u4e00-\u9fa5]/.test($(".inputPassword").val()) ){
			$(".inputPasswordDiv").css("borderColor", "#e22");
			$(".inputPasswordError").html('<span class="inputErrorIcon"></span>' + "格式错误，仅支持字母、数字、符号的组合");
			$(".inputPasswordError").css("display", "block").addClass("active");
			$(".hintPassword").css("display", "none").removeClass("active");
			return;
		}
		//当密码输入正确后修改输入框使输入字符少于6个
		if( $(".inputPassword").val().length < 6 ){
			$(".hintPasswordStrength").css("display", "none").removeClass("active");
			$(".hintPassword").css("display", "block").addClass("active");
			return;
		}
		
	});
	
	
	//“设置密码”有输入，完成输入时检查
	$(".inputPassword").change(function(){
		var passwordText = $(this).val();
		//没有输入
		if( passwordText.length == 0 ){
			return;
		}
		
		//检查是否输入中文
		if( /[\u4e00-\u9fa5]/.test(passwordText) ){
			$(".inputPasswordDiv").css("borderColor", "#e22");
			$(".inputPasswordError").html('<span class="inputErrorIcon"></span>' + "格式错误，仅支持字母、数字、符号的组合");
			$(".inputPasswordError").css("display", "block").addClass("active");
			$(".hintPassword").css("display", "none").removeClass("active");
			return;
		}
		//检查输入长度
		if(passwordText.length < 6 || passwordText.length > 20 ){
			$(".inputPasswordDiv").css("borderColor", "#e22");
			$(".inputPasswordError").html('<span class="inputErrorIcon"></span>' + "长度只能在6-20个字符之间");
			$(".inputPasswordError").css("display", "block").addClass("active");
			return;
		}
		var allNum = /^\d*$/g;
		if( allNum.test(passwordText) ) {
			$(".inputPasswordDiv").css("borderColor", "#e22");
			$(".inputPasswordError").html('<span class="inputErrorIcon"></span>' + "密码不能是纯数字，建议至少使用两种字符！");
			$(".inputPasswordError").css("display", "block").addClass("active");
			return;
		}
		$(".inputPasswordResult").addClass("active").css("visibility", "visible");
		//检查“设置密码”是否匹配“确认密码“
		if( passwordText.localeCompare($(".inputPasswordConfirm").val()) == 0 ){
			//匹配
			$(".inputPasswordConfirmResult").addClass("active").css("visibility", "visible");
			$(".inputPasswordConfirmError").css("display", "none").removeClass("active");
			$(".inputPasswordConfirmDiv").css("borderColor", "#ddd");
			return;
		}else if( $(".inputPasswordConfirm").val().length > 0 ) {
			//不匹配
			$(".inputPasswordConfirmResult").removeClass("active").css("visibility", "hidden");
			$(".inputPasswordConfirmDiv").css("borderColor", "#e22");
			$(".inputPasswordConfirmError").html('<span class="inputErrorIcon"></span>' + "两次密码输入不一致");
			$(".inputPasswordConfirmError").css("display", "block").addClass("active");
			$(".hintPasswordConfirm").css("display", "none").removeClass("active");
			return;
		}
	});

	//检查“确认密码“
	//“确认密码”获得焦点
	inputHadFocus(".inputPasswordConfirm", ".hintPasswordConfirm", ".inputPasswordConfirmError", ".inputPasswordConfirmResult");
	
	//“确认密码”失去焦点
	inputNotFocus(".inputPasswordConfirm", ".hintPasswordConfirm");
	
	//“确认密码”有输入，动态检查
	$("#idPasswordConfirm").bind("input propertychange", function(){
		inputDynamicCheck(".hintPasswordConfirm", ".inputPasswordConfirmError", ".inputPasswordConfirmDiv", ".inputPasswordConfirmResult");
		//检查是否输入中文
		if( /[\u4e00-\u9fa5]/.test($(".inputPassword").val()) ){
			$(".inputPasswordConfirmDiv").css("borderColor", "#e22");
			$(".inputPasswordConfirmError").html('<span class="inputErrorIcon"></span>' + "格式错误，仅支持字母、数字、符号的组合");
			$(".inputPasswordConfirmError").css("display", "block").addClass("active");
			$(".hintPasswordConfirm").css("display", "none").removeClass("active");
			return;
		}
	});
	
	//“确认密码”有输入，完成输入时检查
	$(".inputPasswordConfirm").change(function(){
		var passwordConfirmText = $(this).val();
		//检查是否输入中文
		if( /[\u4e00-\u9fa5]/.test(passwordConfirmText) ){
			$(".inputPasswordConfirmDiv").css("borderColor", "#e22");
			$(".inputPasswordConfirmError").html('<span class="inputErrorIcon"></span>' + "格式错误，仅支持字母、数字、符号的组合");
			$(".inputPasswordConfirmError").css("display", "block").addClass("active");
			$(".hintPasswordConfirm").css("display", "none").removeClass("active");
			return;
		}
		//检查输入长度
		if(passwordConfirmText.length < 6 || passwordConfirmText.length > 20 ){
			return;
		}
		//检查“确认密码”是否匹配“设置密码“
		if( passwordConfirmText.localeCompare($(".inputPassword").val()) == 0 ){
			//匹配
			$(".inputPasswordConfirmResult").addClass("active").css("visibility", "visible");
			return;
		}else{
			//不匹配
			$(".inputPasswordConfirmDiv").css("borderColor", "#e22");
			$(".inputPasswordConfirmError").html('<span class="inputErrorIcon"></span>' + "两次密码输入不一致");
			$(".inputPasswordConfirmError").css("display", "block").addClass("active");
			$(".hintPasswordConfirm").css("display", "none").removeClass("active");
			return;
		}
		$(".inputPasswordConfirmResult").addClass("active").css("visibility", "visible");
	});
	
	//检查“姓名”
	//“姓名”获得焦点
	inputHadFocus(".inputName", ".hintName", ".inputNameError", ".inputNameResult");

	//“姓名”失去焦点
	inputNotFocus(".inputName", ".hintName");
	//“姓名”有输入，动态检查
	$("#idName").bind("input propertychange", function(){
		inputDynamicCheck(".hintName", ".inputNameError", ".inputNameDiv", ".inputNameResult");
		var allnum= /^[0-9]*$/
		//输入格式错误，有规定外的其它字符
		if( allnum.test($(".inputName").val()) ){
			$(".inputNameDiv").css("borderColor", "#e22");
			$(".inputNameError").html('<span class="inputErrorIcon"></span>' + "格式错误，仅支持汉字");
			$(".inputNameError").css("display", "block").addClass("active");
			$(".hintName").css("display", "none").removeClass("active");
		}
	});

	//检查“手机号“
	//“手机号“获得焦点
	inputHadFocus(".inputPhone", ".hintPhone", ".hintPhoneError", ".inputPhoneResult");

	//“手机号”失去焦点
	inputNotFocus(".inputPhone", ".hintPhone");

	//“手机号”有输入，动态检查
	$("#idPhone").bind("input propertychange", function(){
		inputDynamicCheck(".hintPhone", ".hintPhoneError", ".inputPhoneDiv", ".inputPhoneResult");
		//检查输入是否有数字外的其它字符
		if( /\D/.test($(".inputPhone").val()) ){
			$(".inputPhoneDiv").css("borderColor", "#e22");
			$(".hintPhoneError").html('<span class="inputErrorIcon"></span>' + "格式有误");
			$(".hintPhoneError").css("display", "block").addClass("active");
			$(".hintPhone").css("display", "none").removeClass("active");
			return;
		}
	});

	//“手机号”有输入，完成时检查
	$(".inputPhone").change(function(){
		var phoneText = $(".inputPhone").val();
		//输入框没有输入
		if( phoneText.length == 0 ) {
			return;
		}
		//匹配号码（国内）
		if( !(/0?(13|14|15|18)[0-9]{9}/.test(phoneText)) ){
			$(".inputPhoneDiv").css("borderColor", "#e22");
			$(".hintPhoneError").html('<span class="inputErrorIcon"></span>' + "格式有误");
			$(".hintPhoneError").css("display", "block").addClass("active");
			$(".hintPhone").css("display", "none").removeClass("active");
			return;
		}
		$(".inputPhoneResult").css("visibility", "visible").addClass("active");
	});

	//检查“验证码“
	//“验证码“获得焦点
	inputHadFocus(".inputVerification", ".hintVerification", ".hintVerificationError", "");

	//“验证码”失去焦点
	inputNotFocus(".inputVerification", ".hintVerification");
	
	//“验证码”有输入，动态检查
	$("#idVerification").bind("input propertychange", function(){
		inputDynamicCheck(".hintVerification", ".hintVerificationError", ".verificationTextDiv", "");
	});

	//点击”验证码“，更换另一张验证码
	$(".verificationImg").click(function(){
		$(this).attr("src", "./images/imagedff.jpeg");
		$(".inputVerification").focus().val("");
	})

	//检查“手机验证码“
	//“手机验证码“获得焦点
	inputHadFocus(".inputPhoneVerification", ".hintPhoneVerification", ".hintPhoneVerificationError", "");

	//“手机验证码”失去焦点
	inputNotFocus(".inputPhoneVerification", ".hintPhoneVerification");
	
	//“手机验证码”有输入，动态检查
	$("#idPhoneVerification").bind("input propertychange", function(){
		inputDynamicCheck(".hintPhoneVerification", ".hintPhoneVerificationError", ".inputPhoneVerificationDiv", "");
	});

	//点击“获取验证码”
	$(".phoneVerificationHint").click(function(){
		//判断验证码是否发送
		if( $(this).hasClass("active") ){
			//已发送验证码，等待当前验证码实效
		}else{
			//未发送验证码，开始发送验证码
			//检查手机号是否有效
			var phoneText = $(".inputPhone").val();
			//没有输入手机号
			if( phoneText.length == 0 ){
				$(".inputPhoneDiv").css("borderColor", "#e22");
				$(".hintPhoneError").html('<span class="inputErrorIcon"></span>' + "请输入手机号");
				$(".hintPhoneError").css("display", "block").addClass("active");
				$(".hintPhone").css("display", "none").removeClass("active");
				return;
			}
			//输入手机号不正确
			if( !($(".inputPhoneResult").hasClass("active")) ){
				$(".hintPhoneVerificationError").html('<span class="inputErrorIcon"></span>' + "请输入正确的手机号");
				$(".hintPhoneVerificationError").css("display", "block").addClass("active");
				$(".hintPhoneVerification").css("display", "none").removeClass("active");
				return;
			}else{
				$(".hintPhoneVerificationError").css("display", "none").removeClass("active");
			}
			$(".hintPhoneVerification").css("display", "block").addClass("active");
			$(".phoneVerificationHint").addClass("active").css("cursor", "default").text("120s后重新获取").css("color", "#999");
			phoneVerificationTimer = setInterval("phoneVerificationClock()", 1000);
		}
	})
	timeLong = 120;	//重新获取验证码时长（秒）
	phoneVerificationTimer = 0;	//获取验证码计时器



	//点击“同意协议”
	$("#agreementCheck").click(function(){
		$(".agreementDiv").css("borderColor", "#ddd");
		$(".hintAgreementError").css("display", "none").removeClass("active");
	});

	//点击“立即注册“按钮
	$(".registerBtn").click(function(){
		//检查“用户名“
		if( !registerCheck(".inputUserNameResult", ".inputUserName", ".inputUserNameDiv", ".hintUserName", ".inputUserNameError", "请输入用户名") ) {
			return false;
		}

		//检查“设置密码”
		if( !registerCheck(".inputPasswordResult", ".inputPassword", ".inputPasswordDiv", ".hintPassword", ".inputPasswordError", "请输入密码") ) {
			return false;
		}

		//检查“确认密码”
		if( !registerCheck(".inputPasswordConfirmResult", ".inputPasswordConfirm", ".inputPasswordConfirmDiv", ".hintPasswordConfirm", ".inputPasswordConfirmError", "请再次输入密码") ) {
			return false;
		}
		
		//检查“姓名“
		if( !registerCheck(".inputNameResult", ".inputName", ".inputNameDiv", ".hintName", ".inputNameError", "请输入姓名") ) {
			return false;
		}

		//检查“手机号”
		if( !registerCheck(".inputPhoneResult", ".inputPhone", ".inputPhoneDiv", ".hintPhone", ".hintPhoneError", "请输入手机号") ) {
			return false;
		}
		
		
		
		//检查“邮箱“
		if( !registerCheck(".inputyxResult", ".inputyx", ".inputyxDiv", ".hintyx", ".inputyxError", "请输入邮箱") ) {
			return false;
		}
		return true;
	});	
});	//end of ready

//当输入框获得焦点
function inputHadFocus(inputClassName, normalHintClassName, errorHintClassName, resultIconClassName){
	$(inputClassName).focus(function(){
		if( !$(errorHintClassName).hasClass("active") && !$(resultIconClassName).hasClass("active") ){
			$(normalHintClassName).css("display", "block").addClass("active");
		}
		$(this).css("color", "#333");
	})
}

//当输入框失入焦点
function inputNotFocus(inputClassName, normalHintClassName){
	$(inputClassName).blur(function(){
		$(normalHintClassName).css("display", "none").removeClass("active");
	})
}

//当输入框有输入，动态检查
function inputDynamicCheck(normalHintClassName, errorHintClassName, inputFatherNodeClassName, resultIconClassName){
	//隐藏输入错误提示信息
	if( $(errorHintClassName).hasClass("active") ){
		$(errorHintClassName).css("display", "none").removeClass("active");
		$(inputFatherNodeClassName).css("borderColor", "#ddd");
	}
	//隐藏输入正确提示图标
	if( $(resultIconClassName).hasClass("active") ){
		$(resultIconClassName).removeClass("active").css("visibility", "hidden");
	}
	//显示输入提示信息
	if( !$(normalHintClassName).hasClass("active")){
		$(normalHintClassName).css("display", "block").addClass("active");
	}
}

//获取验证码计时
function phoneVerificationClock(){
	timeLong --;
	$(".phoneVerificationHint").text( timeLong + "s后重新获取")
	if( timeLong == 0 ){
		clearInterval(phoneVerificationTimer);
		$(".phoneVerificationHint").text("获取验证码").css({color: "#333", cursor: "pointer"}).removeClass("active");
		timeLong = 120;
	}
}

//点击“立即注册”时检查输入框
function registerCheck(resultIconClassName, inputClassName, inputFatherDiv, hintNormalClassName, hintErrorClassName, hintText ){
	if( !($(resultIconClassName).hasClass("active")) ){
		var inputText = $(inputClassName).val();
		if( inputText.length == 0 ) {
			$(inputFatherDiv).css("borderColor", "#e22");
			$(hintErrorClassName).html('<span class="inputErrorIcon"></span>' + hintText);
			$(hintErrorClassName).css("display", "block").addClass("active");
			$(hintNormalClassName).css("display", "none").removeClass("active");
			$(inputClassName).focus();
			return false;
		}
		if( $(hintErrorClassName).hasClass("active") ){
			$(inputClassName).focus();
			return false;
		}
	}
	return true;
}

//点击“立即注册”时检查验证码输入框
function checkVerification(inputClassName, inputFatherDiv, hintNormalClassName, hintErrorClassName, hintText ){
	var verificationText = $(inputClassName).val();
	if( verificationText.length == 0 ) {
		$(inputFatherDiv).css("borderColor", "#e22");
		$(hintErrorClassName).html('<span class="inputErrorIcon"></span>' + hintText);
		$(hintErrorClassName).css("display", "block").addClass("active");
		$(hintNormalClassName).css("display", "none").removeClass("active");
		$(inputClassName).focus();
		return false;
	}else{
		$(inputFatherDiv).css("borderColor", "#ddd");
		$(hintErrorClassName).css("display", "none").removeClass("active");
		$(hintNormalClassName).css("display", "none").removeClass("active");
		return true;
	}
}
