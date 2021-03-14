<%@ page contentType="text/html; charset=utf-8" %>
<script src="/js/validate.js"></script>
<script>

$(document).ready(function(){

	/******************************************
	**** function
	******************************************/
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
				var formData = new FormData($("#frmIns")[0]);

				$.ajax({
		            type : "post",
		            url : "/grw/empl/emplIns.do",
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
			            	document.location = "/grw/empl/emplLst.do";
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
		ins($(this));
	});
	
});

</script>