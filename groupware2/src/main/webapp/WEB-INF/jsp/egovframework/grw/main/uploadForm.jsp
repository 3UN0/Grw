<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"				prefix="c" %>


<script
	src = "http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous">
</script>
	
<script>
$(document).ready(function(){
	
	
	/* var cloneObj = $(".uploadDiv").clone();
	
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
	}
	 */

	 	var formObj = $("form[name='frmWrt']");
	 	$("button[type='button']").on("click", function(e){
	 		e.preventDefault();
	 		console.log("submit clicked");
	 		
	 		var str="";
	 		
	 		/* $(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				console.dir(jobj);
				
				str += "<input type = 'hidden' name = 'attachList["+i+"].origFileName' value = '" + jobj.data("origFileName")+"'>";
				str += "<input type = 'hidden' name = 'attachList["+i+"].uuid' value = '" + jobj.data("uuid") + "'>";
				str += "<input type = 'hidden' name = 'attachList["+i+"].uploadPath' value = '" + jobj.data("path") + "'>";
				str += "<input type = 'hidden' name = 'attachList["+i+"].fileType' value = '" + jobj.data("type") + "'>";
		
			});
			formObj.append(str).submit(); */
	 	});
	 
	 
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
			
			  /* if(!obj.image){
			       
			       var fileCallPath =  encodeURIComponent( "/"+obj.origFileName);
			       
			       var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
			       
			       str += "<li><a href='/grw/download.do?fileId="+obj.fileId+"'>"
			    		   +obj.origFileName+"</a>" + "<span data-file=\ '"+ fileCallPath+"\' data-type='file'> x </span>"
			    		   + "<div></li>"

			     }else{
			       
			       var fileCallPath =  encodeURIComponent("/s_"+obj.origFileName);
			       var originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.origFileName;
			       originPath = originPath.replace(new RegExp(/\\/g),"/");
			       
			       str += "<li><span data-file=\'" + fileCallPath + "\' data-type='image'> x </span><li>";
			     }

			  uploadResult.append(str); */
			
			 
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
		  
		  /* $.ajax({
		  	url : 'deleteFile',
		  	data : {fileName : targetFile, type : type},
		  	dataType : 'text',
		  	type : 'POST',
		  		success : function(result) {
		  			alert(result);
		  			targetLi.remove();
		  		}
		  }); */
		  
		  
	  });
	
});
</script>


		<!-- <form action ="/grw/main/uploadForm.do" method="post" enctype="multipart/form-data">
			<input type="file" name="uploadFile" multiple>
			<button>submit</button>
		</form> -->
		
		
		<!-- <div class="uploadDiv">
			<input type="file" name="uploadFile" multiple>
		</div>
		
		<div class="uploadResult">
			<ul>
				
			
			</ul>
		</div>
		
		<button id="uploadbtn">upload</button> -->
		



<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">게시글 작성</h6>
	</div>
	<div class="card-body px-2 py-2">

		<form id="frmWrt" name="frmWrt" method="post" enctype="multipart/form-data">
		<input type="hidden" name="brdId" value="${param.brdId }" />
		<input type="hidden" name="userId" value="${login.userId }" />
		<input type="hidden" name="fileUrl" value="${param.fileUrl }" />
		
 
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">제목</label><strong class="text-danger pl-1">*</strong> 
				<input type="text" id="title" name="title" maxlength="120" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>

			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">첨부파일</label><strong class="text-danger pl-1">*</strong> 
				<div class="uploadDiv">
					<input type="file" name="uploadFile" class="form-control form-control-sm maxlength-badge-position" multiple>
				</div>
					
				<div class="uploadResult">
					<ul>
						
					
					</ul>
				</div>
			</div>
			
				
			<div class="form-group mb-0">
				<label class="form-label-sm mb-0">내용</label><strong class="text-danger pl-1">*</strong> 
				<textarea name="contents" class="form-control form-control-sm" rows="5"></textarea>
			</div>
			
	<!-- 		
			/.panel-heading
			<div class = "panel-body">
				<div class = "panel-body">
					<div class = "uploadDiv">
						<input type = "file" name = 'uploadFile' multiple>
					</div>
					
					<div class = 'uploadResult'>
						<ul>
						
						</ul>
					</div>
					
					<button id="uploadbtn">upload</button>
		
				</div>
			</div> -->

		</form>
		
	</div>
</div>

<div class="row">
	<div class="col-12 d-flex justify-content-between align-items-center">
		<a href="/grw/board/brdLst.do?brdId=${param.brdId}" class="btn btn-outline bg-danger border-grey-800 text-dark">취소</a>
		<button type="button" name="ins" class="btn btn-dark border-grey-800">저장</button>
	</div>
</div>
