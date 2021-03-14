<%@ page contentType="text/html; charset=utf-8" %>
<script src="/js/validate.js"></script>
<script>
	$(document).ready(function(){

		/******************************************
		**** function
		******************************************/
		var del = function(_obj){

			swalInit.fire({
				title				: "삭제 하시겠습니까?",
				text				: "",
				type				: "warning",
				showCancelButton	: true,
				confirmButtonColor	: "#3085d6",
				cancelButtonColor	: "#d33",
				confirmButtonText	: "삭제",
				cancelButtonText	: "취소"
			}).then(function(result){
				if (result.value) {

					$.ajax({
			            type : "post",
			            url : "/grw/empl/emplDel.do",
				        data : {
				        	userId	:	$("#frmESel").find("input[name=userId]").val()
				        },
			            error : function(){
			            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            },
			            success : function(_data){
			            	if(_data.result == "failed"){
			            		swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            	}else{
				            	document.location = "/grw/empl/emplLst.do";

			            	}
			            }
			        });

				}
			});

		};

		/******************************************
		**** event
		******************************************/
		$("button[name=del]").on("click", function(){
			del($(this));
		});
	
		$('#myModal').on('shown.bs.modal', function() {
			$('myInput').trigget('focus');
		});
		

		$('#myModal').on('shown.bs.modal', function() {
			$('myInput').trigget('show');
		});
		

		$('#myModal').on('shown.bs.modal', function() {
			$('myInput').trigget('hide');
		});
		
		$("#confirm").click(function() {
			$("#exmodal").modal("show");
		});
		
	});

</script>

