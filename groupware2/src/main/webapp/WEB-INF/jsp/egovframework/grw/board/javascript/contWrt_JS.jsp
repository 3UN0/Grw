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
		            		//alert("success");
			            	document.location = "/grw/board/brdLst.do?brdId="+$("#frmWrt").find("input[name=brdId]").val();
		            	}else{
		            		swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
		            	}
		            }
		        });
	
			}
		});
	}; 
	
 
 
	$("input[type = 'file']").change(function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		for(var i=0; i<files.length; i++){
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : '/grw/main/uploadForm.do',
			processData : false,
			contentType : false, 
			data : formData,
			type : 'POST',
			dataType : 'json',
				success:function(result){
					console.log(result);
					showUploadResult(result);
				}
		});
	});
	 
	function showUploadResult(uploadResultArr){
		  if(!uploadResultArr || uploadResultArr.length == 0){return ;}
		  var uploadUL = $(".uploadResult ul");
		  var str = "";
		  
		  $(uploadResultArr).each(function(i, obj){
			
			        if(obj.image){
				      var fileCallPath =  encodeURIComponent("/"+obj.origFileName);
			          str += "<li><div>";
			          str += "<span> "+ obj.origFileName+"</span>";
			          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			          str += "</div>";
			          str +"</li>";
			        }else{
					    var fileCallPath =  encodeURIComponent("/"+obj.origFileName);
			            var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			              
			          str += "<li><div>";
			          str += "<span> "+ obj.origFileName+"</span>";
			          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			          str += "</div>";
			          str +"</li>";
			        } 
			  });
				uploadUL.append(str);
	}
	
	$(".uploadResult").on("click", "button", function(e){
		  console.log("delete file");
		  
		  var targetFile = $(this).data("file");
		  var type = $(this).data("type");
		  
		  var targetLi = $(this).closest("li");
		  
		  $.ajax({
			url : '/grw/fileDel.do',
		  	data : {fileName : targetFile, type : type},
		  	dataType : 'text',
		  	type : 'POST',
		  		success : function(result) {
		  			console.log(result);
		  			targetLi.remove();
		  		}
		  });
		  
		  
	  });
	 
	 
	/******************************************
	**** event
	******************************************/
	$("button[name=ins]").on("click", function(){
		
		ins($(this));
		
		//var formData = new formData(document.getElementById('frmWrt'));

	});
	
});

</script>