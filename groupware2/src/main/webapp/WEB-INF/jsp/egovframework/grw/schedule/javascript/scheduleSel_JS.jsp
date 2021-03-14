<%@ page contentType="text/html; charset=utf-8" %>
<script src="/js/validate.js"></script>

<style type="text/css">

#title {
	border-bottom: 2px solid #727377;
}
#title>*, #leftTop>* {
	display: inline-block;
}
#leftMenu, #rightMenu {
	margin-top: 10px;
}
.scheduleSelect {
	height: 34px;
	width : 79px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.form-group > div {
	margin-bottom: 5px;
}
textarea {
	resize : none;
}
#rightTop > div > span {
	height: 26px;
	margin-top: 20px;
	margin-bottom: 10px;
	padding-top: 5px;
	cursor: pointer;
}
.font-red {
	color: red;
}
.font-blue {
	color: blue;
}
#bgYellow {
	background-color: yellow;
}
 
#calendar > tbody > tr >  td {
	height: 80px;
}
.scheduleInDiv {
	width: 100%;
	height: 60px;
}
.scheduleDiv {
	background-color: blue;
	color: white;
	border-radius: 5px;
	font-size: 8pt;
	text-align: left;
	cursor: pointer;
	padding-left: 5px;
}
.pointer {
	cursor: pointer;
}
.show {
	width: 138px;
	position: absolute;
	margin-top: -85px;
}
.borderDiv {
	border: solid 3px gray;
	background-color: white;
}
.small-icon {
	line-height: 20px;
	height: 20px;
	width: 20px;
	pointer-events: auto;
	cursor: pointer;
}
.bgWhite {
	background-color: white;
}
</style>

<script>

	var date;
	var nowYear;
	var nowMon;
	var nowDay;
	var year;
	var mon;
	var day;
	var hour;
	var min;
	
	
	// 사용자가 이벤트를 발생시킨 시간을 받아오는 함수
	function getTime() {
		date = new Date();
		nowYear = date.getFullYear();
		nowMon = date.getMonth() + 1;
		nowDay = date.getDate();
		year = date.getFullYear();
		mon = date.getMonth() + 1;
		day = date.getDate();
		hour = date.getHours();
		min = date.getMinutes();
	}


$(document).ready(function(){

	/******************************************
	**** function
	******************************************/

	var schedel = function(_obj){
		
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
		            url : "/grw/schedule/scheduleDel.do",
			        dataType : "json",
			        data : {
			        	scheId	:	$("#scheSelFrm").find("input[name=scheId]").val()
			        },
		            error : function(){
		            	swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
		            },
		            success : function(_data){
		            	if(_data.result == "failed"){
		            		swalInit.fire("오류 발생","서버 요청 도중 오류가 발생했습니다!!!","error");
		            	}else{
			            	document.location = "/grw/schedule/scheduleLst.do";
		            	}
		            }
		        });
			}
		});
	}; 
	
 
	 
	/******************************************
	**** event
	******************************************/
	$("#scheduleDel").on("click", function(){
		console.log("클릭");
		schedel($(this));
	});
	
	// 달력 날짜 변경
	
	
	today();
	addHour();
	addMin();
	getTime();
	
	
	$("#scheNm").on("keyup", function() {
		if ($(this).val().length > 10) {
			$(this).val($(this).val().substring(0, 10));
		}
	});
	
	$("#scheNm_up").on("keyup", function() {
		if ($(this).val().length > 10) {
			$(this).val($(this).val().substring(0, 10));
		}
	});
	
	
	
});

	//입력 폼에 오늘 날짜 넣기
	function today() {		
		var date = new Date();
		var yyyy = date.getFullYear();
		var mm = (date.getMonth() + 1)
		var dd = date.getDate();
		if (mm < 10) {
			mm = "0" + mm;
		}
		if (dd < 10) {
			dd = "0" + dd;
		}
		var str = yyyy + "-" + mm + "-" + dd;
		$("#startYMD").val(str);
		$("#endYMD").val(str);
	}
	
	// 입력 폼에 시간넣기
	function addHour() {
		var str = "";
		for (var i = 0; i <= 23 ; i++) {
			if (i<10) {
				str = str + "<option value='0" + i + "'>0" + i + "</option>";	
			}
			else if (i>=10) {
				str = str + "<option value='" + i + "'>" + i + "</option>";
			}	
		}
		$("#startHour").html(str);
		$("#endHour").html(str);
	}
	
	// 입력 폼에 분 넣기
	function addMin() {
		var str = "";
		for (var i = 0; i <= 59 ; i=i+5) {
			if (i<10) {
				str = str + "<option value='0" + i + "'>0" + i + "</option>";	
			}
			else if (i>=10) {
				str = str + "<option value='" + i + "'>" + i + "</option>";
			}	
		}
		$("#startMin").html(str);
		$("#endMin").html(str);
	}
		
	// 년도 및 월을 뿌리는 함수
	
	// 날짜를 뿌리는 함수

	// 달력에 일정 넣기
	

</script>