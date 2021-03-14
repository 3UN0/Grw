<%@ page contentType="text/html; charset=utf-8" %>
<script src="/js/validate.js"></script>
<script type="text/javascript">

	$(document).ready(function(){

		/******************************************
		**** function
		******************************************/
		var upd = function(_obj){

			swalInit.fire({
				title: "입력하신 정보로 저장을 하시겠습니까?",
				text: "",
				type: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: "저장",
				cancelButtonText: "취소"
			}).then(function(result){
				if (result.value) {
					
					$.ajax({
			            type : "post",
			            url : "/grw/part/partUpd.do",
				        dataType : "json",
				        data : $("#frmUpd").serialize(),
			            error : function(){
			            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            },
			            success : function(_data){
			            	if(_data.result == "success"){
				            	document.location = "/grw/part/partLst.do";
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
		$("button[name=upd]").on("click", function(){
			upd($(this));
		});
		
	});

</script>

