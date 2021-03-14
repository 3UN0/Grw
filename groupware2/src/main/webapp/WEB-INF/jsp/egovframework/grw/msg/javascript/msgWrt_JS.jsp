<%@ page contentType="text/html; charset=utf-8" %>
<script src="/js/validate.js"></script>
<script>

$(document).ready(function(){

	<%-- var uid = '<%=(String)session.getAttribute("userId")%>';
	
	if(uid=="null"){
	//	swal("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요","error");
		alert("로그인이 필요한 항목입니다.","회원 가입 또는 로그인을 해주세요","error");

		location.replace("/grw/user/UserLogin.do")
	} else {
		location.href("/grw/msg/msgWrt.do")
	} --%>
	
	/******************************************
	**** function
	******************************************/
	var ins = function(_obj){

		swalInit.fire({
			title: "메세지를 보내시겠습니까?",
			text: "",
			type: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33'
		}).then(function(result){
			if (result.value) {
	
				$.ajax({
		            type : "post",
		            url : "/grw/msg/msgWrt.do",
			        dataType : "json",
			        data : $("#frmWrt").serialize(),
		            error : function(){
		            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
		            	console.log("실패");
		            },
		            success : function(_data){
		            	if(_data.result == "success"){
			            	document.location = "/grw/msg/sndMsgLst.do?senderId="+$("#frmWrt").find("input[name=senderId]").val();
		            	}else{
		            		swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
		            	}
		            }
		        });
	
			}
		});
	};
	
	/******************************************
	**** event
	******************************************/
	$("button[name=ins]").on("click", function(){
		console.log("클릭");
		ins($(this));
	});
	
});

</script>