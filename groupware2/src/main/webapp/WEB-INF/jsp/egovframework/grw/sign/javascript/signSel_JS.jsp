<%@ page contentType="text/html; charset=utf-8" %>
<script src="/js/validate.js"></script>
<script>
	$(document).ready(function(){

		/******************************************
		**** function
		******************************************/
		
		var accept = function(_obj){

			swalInit.fire({
				title				: "승인 하시겠습니까?",
				text				: "",
				type				: "warning",
				showCancelButton	: true,
				confirmButtonColor	: "#3085d6",
				cancelButtonColor	: "#d33",
				confirmButtonText	: "확인",
				cancelButtonText	: "취소"
			}).then(function(result){
				if (result.value) {
					
					$.ajax({
			            type : "post",
			            url : "/grw/sign/acpSign.do",
				        data : {
				        	sid	:	$("#frmSel").find("input[name=sid]").val()
				        }, 
			            error : function(){
			            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            },
			            success : function(_data){
			            	if(_data.result == "failed"){
			            		swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            	}else{
				            	document.location = "/grw/sign/signReqLst.do";

			            	}
			            }
			        });

				}
			});

		};
		
		var acceptfnl = function(_obj){

			swalInit.fire({
				title				: "승인 하시겠습니까?",
				text				: "",
				type				: "warning",
				showCancelButton	: true,
				confirmButtonColor	: "#3085d6",
				cancelButtonColor	: "#d33",
				confirmButtonText	: "확인",
				cancelButtonText	: "취소"
			}).then(function(result){
				if (result.value) {
					
					$.ajax({
			            type : "post",
			            url : "/grw/sign/acpfnlSign.do",
				        data : {
				        	sid	:	$("#frmSel").find("input[name=sid]").val()
				        }, 
			            error : function(){
			            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            },
			            success : function(_data){
			            	if(_data.result == "failed"){
			            		swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            	}else{
				            	document.location = "/grw/sign/signFnlReqLst.do";

			            	}
			            }
			        });

				}
			});

		};
		
		var ret = function(_obj){

			swalInit.fire({
				title				: "반려 하시겠습니까?",
				text				: "",
				type				: "warning",
				showCancelButton	: true,
				confirmButtonColor	: "#3085d6",
				cancelButtonColor	: "#d33",
				confirmButtonText	: "확인",
				cancelButtonText	: "취소"
			}).then(function(result){
				if (result.value) {
					
					$.ajax({
			            type : "post",
			            url : "/grw/sign/returnSign.do",
				        data : {
				        	sid	:	$("#frmSel").find("input[name=sid]").val()
				        }, 
			            error : function(){
			            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            },
			            success : function(_data){
			            	if(_data.result == "failed"){
			            		swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            	}else{
				            	document.location = "/grw/sign/signReqLst.do";

			            	}
			            }
			        });

				}
			});

		};
		
		
		
		/******************************************
		**** event
		******************************************/

		$("button[name=accept]").on("click", function(){
			accept($(this));
		});


		$("button[name=acceptfnl]").on("click", function(){
			acceptfnl($(this));
		});
		
		
		$("button[name=ret]").on("click", function(){
			ret($(this));
		});
		
		
	});

	
</script>

