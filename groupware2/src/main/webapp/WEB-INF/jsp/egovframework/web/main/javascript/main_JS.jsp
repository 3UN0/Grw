<%@ page contentType="text/html; charset=utf-8" %>
<script src="/js/plugin/touch-table-row-sorter/RowSorter.js"></script>
<script src="/js/validate.js"></script>
<script>

var mmmm;

	$(document).ready(function(){

		/******************************************
		**** function
		******************************************/
		var reg = function(_obj){
			$("#frm1")[0].reset();
			$("#modal-menu").modal("show");
		};

		var save = function(_obj){

			if(validateTextLength("input[name=menuNm]", 2, $("input[name=menuNm]").attr("maxlength"), "메뉴 명", "#modal-menu")){
				return false;
			}

			$("#modal-menu").modal("hide");

			var server_url = "";
			// key 값이 있냐에 따라 ins, upd 처리
			if($("form#frm1").find("input[name=menuId]").val() == ""){
				server_url = "/cmmn/menu/ins.do";
			}else{
				server_url = "/cmmn/menu/upd.do";
			}
			
			swalInit.fire({
                title: "저장하시겠습니까?",
                text: "",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: "저장",
                cancelButtonText: "취소"
            }).then(function(result) {
			
				if (result.value) {

					$.ajax({
			            type : "post",
			            url : server_url,
				        dataType : "json",
				        data : $("#frm1").serialize(),
			            error : function(){
			            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            },
			            success : function(_data){
			            	if(_data.result == "success"){
			            		document.location.reload();
			            	}
			            }
			        });

				}else{
					$("#modal-menu").modal("show");
				}
			});

		};
		
		var updSel = function(_obj){

			$.ajax({
	            type : "post",
	            url : "/cmmn/menu/sel.do",
		        dataType : "json",
		        data : {
		        	menuId	:	$(_obj).parent().find("input[name=menuId]").val()
		        },
	            error : function(){
	            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
	            },
	            success : function(_data){
	            	$("form#frm1").find("input[name=menuId]").val(_data.menuId);
	            	$("form#frm1").find("input[name=menuNm]").val(_data.menuNm);
	            	$("form#frm1").find("input[name=icon]").val(_data.icon);
					$("form#frm1").find("input[name=url]").val(_data.url);
					$("form#frm1").find("input[name=param]").val(_data.param);
					$("#modal-menu").modal("show");
	            }
	        });
		};

		var del = function(_obj){
			
			if($(_obj).hasClass("disabled")){
				swalInit.fire("코드 삭제 실패!","하위 메뉴가 있을 경우 삭제가 불가능 합니다.","error")
				return false;
			}
			
			swalInit.fire({
				title: "선택하신 메뉴를 삭제 하시겠습니까?",
				text: "",
				type: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: "삭제",
				cancelButtonText: "취소"
			}).then(function(result){
				if (result.value) {

					$.ajax({
			            type : "post",
			            url : "/cmmn/menu/del.do",
				        data : {
				        	menuId	:	$(_obj).parent().find("input[name=menuId]").val()
				        },
			            error : function(){
			            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
			            },
			            success : function(_data){
			            	result = _data;
			            	if(_data.result == "failed"){
			            		swalInit.fire("메뉴 삭제 실패!","메뉴 삭제에 실패했습니다","error")
			            	}else{
				            	document.location.reload();
			            	}
			            }
			        });

				}
			});

		};

		var updOrders = function(){
	
			$("#table-menu").find("tbody tr").each(function(index){ 
				$(this).find("input[name=arrOrders]").val(index+1);
				$(this).find("span").text(index+1);
			});			
			
			$.ajax({
	            type : "post",
	            url : "/cmmn/menu/orders/upd.do",
		        data : $("#frm2").serialize(),
		        error : function(){
		        	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
	            },
	            success : function(_data){
	            	if(_data.result == "failed"){
	            		swalInit.fire('실패','메뉴 순서 지정이 실패되었습니다.','error');
	            	}
	            }
	        });
		};

		var ordersEdit = function(_obj){
			if($("#table-menu").find(".orders").hasClass("none")){
				$(_obj).text("순서 편집 취소");
				$("#table-menu").find(".orders").removeClass("none");
			}else{
				$(_obj).text("순서 편집");
				$("#table-menu").find(".orders").addClass("none");
			}
		};
		
		/******************************************
		**** event
		******************************************/
		$("button[name=reg]").on("click", function(){
			reg($(this));
		});

		$("button[name=save]").on("click", function(){
			save($(this));
		});

		$("button[name=upd]").on("click", function(){
			updSel($(this));
		});

		$("button[name=del]").on("click", function(){
			del($(this));	
		});
		
		$("button[name=ordersEdit]").on("click", function(){
			ordersEdit($(this));
		});
		
		/******************************************
		**** init
		******************************************/
		RowSorter("#table-menu", {
		    handler: 'i.icon-move',
		    stickFirstRow : true,
		    stickLastRow  : false,
		    onDragStart: function(tbody, row, index){
		        console.log('start index is ' + index);
		    },
		    onDrop: function(tbody, row, new_index, old_index){
		    	console.log('sorted from ' + old_index + ' to ' + new_index);
		    	updOrders();
		    }
		});
		
	});
</script>
