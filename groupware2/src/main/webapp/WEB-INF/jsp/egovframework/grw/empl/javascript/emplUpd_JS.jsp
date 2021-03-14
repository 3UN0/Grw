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
					
					var formData = new FormData($("#frmUpd")[0]);

					$.ajax({
			            type : "post",
			            url : "/grw/empl/emplUpd.do",
				        dataType : "json",
				        contentType: false,
				        processData: false,
				        data : formData,
			            error : function(){
			            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            },
			            success : function(_data){
			            	if(_data.result == "success"){
				            	document.location = "/grw/empl/emplSel.do?userId="+$("#frmUpd").find("input[name=userId]").val();
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

