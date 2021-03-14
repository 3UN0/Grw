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
			            url : "/grw/board/contDel.do",
				        data : {
				        	contentId	:	$("#frmSel").find("input[name=contentId]").val()
				        }, 
			            error : function(){
			            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            },
			            success : function(_data){
			            	if(_data.result == "failed"){
			            		swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            	}else{
				            	document.location = "/grw/board/brdLst.do?brdId="+$("#frmSel").find("input[name=brdId]").val();

			            	}
			            }
			        });

				}
			});

		};
		
		
		function fn_writeComment(obj){
			console.log("댓글 작성");
			var formData = new FormData($("#frm")[0]);
					
			$.ajax({
				type : "post",
			    url : "/grw/comWrt.do",
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
			         	document.location = "/grw/board/contSel.do?contentId="+$("#frm").find("input[name=contentId]").val();
			       	}else{
		        		swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
		          	}
		        }
		   	});
			
		}
		
		
		function fn_commentModify(obj){
			console.log("댓글 업뎃 부분");
			
			var con = obj.parent().parent().find("#com_Div").find("#com_Con").val();
            var str = "<textarea name='comments_upd' class='form-control form-control-sm' rows='3'>"+con+"</textarea><p align='right' ><a href=''#this' name='com_Upd' class='btn'>수정</a></p>";
            var div = obj.parent().parent().find("#com_Div");
 
            div.empty();
            div.append(str)
			obj.parent().remove();
            
            $("a[name=com_Upd]").on("click",function(e){
                e.preventDefault();
                fn_updateComment($(this));
            })
			
		}
		
		
		function fn_updateComment(obj){
			  
			var url = "${pageContext.request.contextPath}/grw/comUpd.do";
			var replyEditContent = $(obj).parents().find("textarea[name=comments_upd]").val();
			var paramData = {"comId": $(obj).parent().parent().parent().find("#comId").val(),
							"comments_upd":replyEditContent
				};
				
			$.ajax({
				url: url,
				data : paramData,
		        type: "POST",
				dataType : "text",
				success : function(result){
			        //  	document.location = "/grw/board/contSel.do?contentId="+$("#frmSel").find("input[name=contentId]").val();
				}
				, error: function(error){
					console.log("에러:"+error);
				}
			});
			location.reload();
			  
        }
		
		
		function fn_deleteComment(obj){
		
			var url = "${pageContext.request.contextPath}/grw/comDel.do";

			$.ajax({
				url : url,
				data : {
			       	comId	:	$(obj).parent().parent().find("#comId").val()
			    }, 
				type : "POST",
				dataType : "text",
				success: function(result){
		          // 	document.location = "/grw/board/contSel.do?contentId="+$("#frmSel").find("input[name=contentId]").val();
				},
				error: function(error){
					console.log("에러: "+error);
				}
			});
			location.reload();
		}
		
		
		/******************************************
		**** event
		******************************************/
		
		$("button[name=del]").on("click", function(){
			del($(this));
		});
		
		
		 $("#com_Wrt").on("click",function(e){
            e.preventDefault();
            fn_writeComment();
        }) 
		
		
		$("a[name='com_Mod']").on("click", function(e){ //파일 삭제 버튼
			e.preventDefault();
			fn_commentModify($(this));

		});


		$("a[name='com_Del']").on("click", function(e){ //파일 삭제 버튼
			e.preventDefault();
			fn_deleteComment($(this));

		});
		
		
	});

	
</script>

