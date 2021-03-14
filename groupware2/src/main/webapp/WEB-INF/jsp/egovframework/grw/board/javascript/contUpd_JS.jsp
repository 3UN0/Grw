<%@ page contentType="text/html; charset=utf-8" %>
<script src="/js/validate.js"></script>
<script type="text/javascript">

	$(document).ready(function(){

		/******************************************
		**** function
		******************************************/
		var upd = function(_obj){
			 console.log($("#frmUpd")[0]);

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
			            url : "/grw/board/contUpd.do",
				        dataType : "json",
				        contentType: false,
				        processData: false,
				        data : formData,
			            error : function(){
			            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            },
			            success : function(_data){
			            	if(_data.result == "success"){
				            	document.location = "/grw/board/contSel.do?contentId="+$("#frmUpd").find("input[name=contentId]").val();
			            	}else{
			            		swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            	}
			            }
			        });
		
				}
			});

		};

		
		function fn_deleteFile(obj){
			console.log($(obj).parents().find("input[name=fileUrl]").val());
			
			obj.parent().remove();
			var str = "<div class='card-body px-2 py-2'><input type='file' name='fileUrl'/></div> ";
			$("#fileDiv").append(str);

			console.log($(obj).parents().find("input[name=fileUrl]").val());

		}
		
		
		function fn_deleteFile2(obj){
			console.log($(obj).parents().find("input[name=uploadFile]").val());
			console.log(obj.parent());
			
			obj.parent().remove();
			//var str = "<div class='card-body px-2 py-2'><input type='file' name='uploadFile' multiple/></div> ";
			//$("#fileDiv").append(str);

		}
		
		(function(){
			var bno = '<c:out value = "${contUpd.contentId}"/>';
			
			$.getJSON("/board/getAttachList", {bno:bno}, function(arr){
				console.log(arr);
				var str = "";
				
				$(arr).each(function(i, attach){
					
					// image type
					if(attach.fileType){
						var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
						
						str+= "<li data-path = '" + attach.uploadPath + "' data-uuid = '" + attach.uuid + "'data-filename='"
						+ attach.fileName + "' data-type = '" + attach.fileType + "'><div>";
						str+= "<img src = '/display?fileName=" + fileCallPath + "'>";
						str+= "</div>";
						str+ "</li>";
					}else {
						str += "<li data-path = '" + attach.uploadPath + "' data-uuid = '" + attach.uuid + "'data-filename = '"
						+ attach.fileName + "'data-type = '" + attach.fileType + "'><div>";
						str += "<span>" + attach.fileName + "</span><br/>";
						str += "<img src = '/resources/img/attach.png'></a>";
						str + "</li>";
					}
				});
				
				$(".uploadResult ul").html(str);
			});
		})(); 
		
		
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
		
		
		
		/******************************************
		**** event
		******************************************/
		$("button[name=upd]").on("click", function(){
			console.log($("#frmUpd").find("input[name=fileUrl]").val());
			upd($(this));
		});

		
		$("a[name='filedel']").on("click", function(e){ //파일 삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));

		});
		
		
		$("a[name='filedel2']").on("click", function(e){ //파일 삭제 버튼
			e.preventDefault();
			fn_deleteFile2($(this));

		});
	});

		
	
</script>

