/******************************************
**** event
******************************************/


// Defaults
var swalInit = swal.mixin({
	buttonsStyling: false,
	confirmButtonClass: 'btn btn-primary',
	cancelButtonClass: 'btn btn-light'
});

$(document).ready(function(){

	/******************************************
	**** function
	******************************************/
	validateTextLength = function(_obj, _min, _max, _title, _modal){
		if($.trim($(_obj).val()).length == 0){
			if(_modal!=undefined){
				$(_modal).modal("hide");
			}
			
			swalInit.fire("오류!",_title+" 입력 내용이 공백입니다.","error").then(function(result){
				if(result.value){
					if(_modal!=undefined){
						$(_modal).modal("show");
					}
					focusIn(_obj);
				}
			});
			return true;
		}else if($.trim($(_obj).val()).length < _min){
			if(_modal!=undefined){
				$(_modal).modal("hide");
			}
			swalInit.fire("오류!",_title+" "+_min+"자 이상입니다.","error").then(function(result){
				if(result.value){
					if(_modal!=undefined){
						$(_modal).modal("show");
					}
					focusIn(_obj);
				}
			});
			return true;
		}else{
			return false;
		}
	};

	validateSelect = function(_obj, _title){
		if($.trim($(_obj).val()).length == 0){
			$(_obj).focus();
			swalInit.fire("오류!",_title,"error");
			return true;
		}else{
			return false;
		}
	};

	validateDate = function(_obj, _title){
		var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 
		if(!date_pattern.test($(_obj).val())){
			$(_obj).focus();
			swalInit.fire("오류!",_title+" 날짜 형식이 맞지 않습니다.","error");
			return true;
		}
	};

	validateDatetime = function(_obj, _title){
		var datetime_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1]) (0[0-9]|1[0-9]|2[0-3]):([0-5][0-9])$/; 
		if(!datetime_pattern.test($(_obj).val())){
			$(_obj).focus();
			swalInit.fire("오류!",_title+" 날짜 시간 형식이 맞지 않습니다.","error");
			return true;
		}
	};

	// 날짜 비교, 종료일이 시작일 보다 작을때 false를 정상 기간일 경우 true를 리턴한다.
	validateDateCompare = function(_dateStartObj, _dateEndObj, _delim){

	    //년 월일로 분리 한다.
	    var dateStart	= new Array(3);
	    var dateEnd		= new Array(3);

	    if(_delim != ""){
	    	dateStart = $(_dateStartObj).val().split(_delim);
	    	dateEnd = $(_dateEndObj).val().split(_delim);
	        if(dateStart.length != 3 && dateEnd.length != 3){
	            return true;
	        }
	    }
	    
	    //Date 객체를 생성한다.
	    var sDate = new Date(dateStart[0], dateStart[1], dateStart[2]);
	    var eDate = new Date(dateEnd[0], dateEnd[1], dateEnd[2]);

	    if(sDate > eDate){
	    	$(_dateStartObj).focus();
	    	swalInit.fire("오류!","시작 일자가 종료 일자보다 큽니다!","error");
	        return true;
	    }else{
	    	return false;
	    }
	};


	// 시간 비교
	validateTimeCompare = function(_hourStartObj, _minuteStartObj, _hourEndObj, _minuteEndObj, _title){
				
		var hourStart	= parseInt($(_hourStartObj).val()); 
		var hourEnd		= parseInt($(_hourEndObj).val());
		var minuteStart = parseInt($(_minuteStartObj).val());
		var minuteEnd	= parseInt($(_minuteEndObj).val());
		
		if(hourStart > hourEnd){
			$(_hourStartObj).focus();
			swalInit.fire("오류!",_title+" 시작 시간(시)이 종료 시간보다 큽니다!","error");
			return true;	
		}else if(hourStart == hourEnd){
			if(minuteStart > minuteEnd){
				$(_minuteStartObj).focus();
				swalInit.fire("오류!",_title+" 시작 시간(분)이 종료 시간보다 큽니다!","error");
				return true;
			}
		}
	};

	numberCheck = function(_obj, _title) {
		if($.trim($(_obj).val()).length==0){
			$(_obj).focus();
			swalInit.fire("오류!", _title + " 입력 내용이 공백입니다!","error");
			return true;
		}else{
			if(isNaN($(_obj).val())) {
				$(_obj).focus();
				swalInit.fire("오류!", _title + " 입력 값을 숫자값으로 입력해주세요!","error");
				return true;
			}
		}
	};


	validateTextCompare = function(_obj1, _obj2, _title, _modal){
		if($.trim($(_obj1).val()) != $.trim($(_obj2).val())){
			$(_obj2).focus();
			if(_modal!=undefined){
				$(_modal).modal("hide");
			}
			swalInit.fire("오류!",_title+" 입력 값이 서로 다릅니다!","error").then(function(result){
				if(result.value){
					if(_modal!=undefined){
						$(_modal).modal("show");
					}
				}
			});
			return true;
		}
	};

	
	
	
	
	/******************************************
	**** event
	******************************************/
    $(".maxlength-badge-position").maxlength({
        alwaysShow: true,
        placement: 'top'
    });


});
