function test_item(n) {
	var menu = document.getElementById("menu");
	var menuli = menu.getElementsByTagName("li");
	for ( var i = 0; i < menuli.length; i++) {
		menuli[i].className = "";
		menuli[n].className = "yes";
		document.getElementById("test" + i).className = "no";
		// document.getElementById("test" + (i + 3)).className = "buttonno";
		document.getElementById("test" + n).className = "content";
		// document.getElementById("test" + (n + 3)).className =
		// "buttoncontent";
	}
}
/*用户发表失物信息验证*/
function validateLost() {
	var lostTitle = $(".lostTitle").val();
	var lostTypeRadios = $(".lostTypeRadio");
	var lostTypeRadiosflag = false;
	var lostAreaRadios = $(".lostAreaRadio");
	var lostAreaRadiosflag = false;
	var lostDate = $(".lostDateTd .Wdate").val();
	var lostDescribe = $(".lostDescribe").val();
	var lostUserNickname = $(".lostUserNickname");
	var lostUserPhone = $(".lostUserPhone");
	/*验证标题*/
	if(lostTitle==""||lostTitle==null){
		$(".lostTitle").css("border", "1px solid red");
		return false;
	}else {
		$(".lostTitle").css("border", "1px solid green");
	}
	/*验证类型*/
	for ( var i = 0; i < lostTypeRadios.length; i++) {
		if (lostTypeRadios[i].checked) {
			$("#lostTypeDiv").css("border", "1px solid green");
			lostTypeRadiosflag = true;
		}
	}
	if (!lostTypeRadiosflag) {
		$("#lostTypeDiv").css("border", "1px solid red");
		return false;
	}
	/*验证区域*/
	for ( var i = 0; i < lostAreaRadios.length; i++) {
		if (lostAreaRadios[i].checked) {
			$("#lostAreaDiv").css("border", "1px solid green");
			lostAreaRadiosflag = true;
		}
	}
	if (!lostAreaRadiosflag) {
		$("#lostAreaDiv").css("border", "1px solid red");
		return false;
	}
	/*验证时间*/
	if(lostDate==""){
		$(".lostDateTd .Wdate").css("border", "1px solid red");
		return false;
	}else {
		$(".lostDateTd .Wdate").css("border", "1px solid green");
	}
	/*验证描述*/
	if(lostDescribe==""){
		$(".lostDescribe").css("border", "1px solid red");
		return false;
	}else{
		$(".lostDescribe").css("border", "1px solid green");
	}
	/*验证用户昵称*/
	if(lostUserNickname==""){
		$(".lostUserNickname").css("border", "1px solid red");
		return false;
	}else{
		$(".lostUserNickname").css("border", "1px solid green");
	}
	/*验证用户电话*/
	if(lostUserPhone==""){
		$(".lostUserPhone").css("border", "1px solid red");
		return false;
	}else{
		$(".lostUserPhone").css("border", "1px solid green");
	}
	return true;
}
/*用户发表招领信息验证*/
function validateFound() {
	var foundTitle = $(".foundTitle").val();
	var foundTypeRadios = $(".foundTypeRadio");
	var foundTypeRadiosflag = false;
	var foundAreaRadios = $(".foundAreaRadio");
	var foundAreaRadiosflag = false;
	var foundDate = $(".foundDateTd .Wdate").val();
	var foundDescribe = $(".foundDescribe").val();
	var foundUserNickname = $(".foundUserNickname");
	var foundUserPhone = $(".foundUserPhone");
	/*验证标题*/
	if(foundTitle==""){
		$(".foundTitle").css("border", "1px solid red");
		return false;
	}else {
		$(".foundTitle").css("border", "1px solid green");
	}
	/*验证类型*/
	for ( var i = 0; i < foundTypeRadios.length; i++) {
		if (foundTypeRadios[i].checked) {
			$("#foundTypeDiv").css("border", "1px solid green");
			foundTypeRadiosflag = true;
		}
	}
	if (!foundTypeRadiosflag) {
		$("#foundTypeDiv").css("border", "1px solid red");
		return false;
	}
	/*验证区域*/
	for ( var i = 0; i < foundAreaRadios.length; i++) {
		if (foundAreaRadios[i].checked) {
			$("#foundAreaDiv").css("border", "1px solid green");
			foundAreaRadiosflag = true;
		}
	}
	if (!foundAreaRadiosflag) {
		$("#foundAreaDiv").css("border", "1px solid red");
		return false;
	}
	/*验证时间*/
	if(foundDate==""){
		$(".foundDateTd .Wdate").css("border", "1px solid red");
		return false;
	}else {
		$(".foundDateTd .Wdate").css("border", "1px solid green");
	}
	/*验证描述*/
	if(foundDescribe==""){
		$(".foundDescribe").css("border", "1px solid red");
		return false;
	}else{
		$(".foundDescribe").css("border", "1px solid green");
	}
	/*验证用户昵称*/
	if(foundUserNickname==""){
		$(".foundUserNickname").css("border", "1px solid red");
		return false;
	}else{
		$(".foundUserNickname").css("border", "1px solid green");
	}
	/*验证用户电话*/
	if(foundUserPhone==""){
		$(".foundUserPhone").css("border", "1px solid red");
		return false;
	}else{
		$(".foundUserPhone").css("border", "1px solid green");
	}
	return true;
}