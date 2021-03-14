<%@ page contentType="text/html; charset=utf-8" %>
<script src="/js/validate.js"></script>
<script>

$(document).ready(function(){

	/******************************************
	**** function
	******************************************/
	
	var uid = '<%=(String)session.getAttribute("userId")%>';
	
	if(uid=="null"){
	//	swal("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요","error");
		alert("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요","error");

		location.replace("/grw/user/UserLogin.do")
	} else {
		location.href("/grw/sign/signWrt.do")
	}
	
	
	var ins = function(_obj){
		
		swalInit.fire({
			title: "입력하신 정보로 저장을 하시겠습니까?",
			text: "",
			type: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33'
		}).then(function(result){
			if (result.value) {
	
				var formData = new FormData($("#frmWrt")[0]);
				
				$.ajax({
		            type : "post",
		            url : "/grw/sign/signWrt.do",
			        dataType : "json",
			        contentType: false,
			        processData: false,
			        data : formData,
		            error : function(){
		            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
		            	console.log("실패");
		            },
		            success : function(_data){
		            	if(_data.result == "success"){
			            	document.location = "/grw/sign/signIngLst.do";
		            	}else{
		            		swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
		            	}
		            }
		        });
	
			}
		});
	};

	
	<%-- function login_check(){
		console.log("체크");
		
		var uid = '<%=(String)session.getAttribute("login")%>';
		
		if(uid=="null"){
			swal("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요","error");
		}
		else {
			location.replace("/grw/user/UserLogin.do")
		}
	} --%>
	
	/******************************************
	**** event
	******************************************/
	$("button[name=ins]").on("click", function(){
		
		ins($(this));
		
		//var formData = new formData(document.getElementById('frmWrt'));

	});
	
});

</script>