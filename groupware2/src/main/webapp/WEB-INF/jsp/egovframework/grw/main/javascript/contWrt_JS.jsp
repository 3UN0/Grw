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
	
				var formData = new FormData($("#frmWrt")[0]);
				/* var formData = new FormData();
				var inputFile = $("input[name='fileUrl']");
				var files = inputFile[0].files;
				
				for(var i=0;i<files.length;i++){
					formData.append("fileUrl", files[i]);
				} */
				
				
				$.ajax({
		            type : "post",
		            url : "/grw/board/contWrt.do",
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
		            		alert("success");
			            	//document.location = "/grw/board/brdLst.do?brdId="+$("#frmWrt").find("input[name=brdId]").val();
		            	}else{
		            		swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
		            	}
		            }
		        });
	
			}
		});
	}; 
	
	/* 
var cloneObj = $(".uploadDiv").clone();
	
	$("#uploadbtn").on("click", function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		for(var i=0;i<files.length;i++){
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : '/grw/main/uploadForm.do',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success : function(result){
				console.log(result);
				showUploadedFile(result);
				$(".uploadDiv").html(cloneObj.html());
			}
		});
		
	});
	
	var uploadResult = $(".uploadResult ul");
	function showUploadedFile(uploadResultArr){
		var str = "";
		$(uploadResultArr).each(function(i,obj){

			str += "<li>" + obj.origFileName + "</li>";
		});
		uploadResult.append(str);
	} */
	
	/* 
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
				var formData = new Form();
				var inputFile = $("input[name='uploadFile']");
				var files = inputFile[0].files;
				console.log(files);
				
				for(var i=0;i<files.length; i++){
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
		            type : "post",
		            url : "/grw/board/contWrt.do",
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
			            	document.location = "/grw/board/brdLst.do?brdId="+$("#frmWrt").find("input[name=brdId]").val();
		            	}else{
		            		swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
		            	}
		            }
		        });
	
			}
		});
	};
	 */
	 
	 
	 
	 
	 
	/******************************************
	**** event
	******************************************/
	$("button[name=ins]").on("click", function(){
		
		ins($(this));
		
		//var formData = new formData(document.getElementById('frmWrt'));

	});
	
});

</script>