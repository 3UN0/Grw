<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"			prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 	prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/PagingTaglib.tld"				prefix="paging" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
   
    .fc-day-header.fc-widget-header.fc-sat { color:#0000FF; }     /* 토요일 */
    .fc-day-header.fc-widget-header.fc-sun { color:#FF0000; }     /* 일요일 */

</style>

<link href="/js/plugin/packages/core/main.css" rel="stylesheet"/>
<link href="/js/plugin/packages/daygrid/main.css" rel="stylesheet"/>
<script src="/js/plugin/packages/core/main.js"></script>
<script src="/js/plugin/packages/interaction/main.js"></script>
<script src="/js/plugin/packages/daygrid/main.js"></script>

<script>

 /*    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
    
      var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: [ 'dayGrid' ]
      });
    
      calendar.render();
    }); */
    
    
    
    document.addEventListener('DOMContentLoaded', function(){
    	var calendarEl = document.getElementById('calendar');
    	var containerEl = document.getElementById('external-events');
    	var checkbox = document.getElementById('drop-remove');
    	  
    	var calendar = new FullCalendar.Calendar(calendarEl, {
    		plugins: ['interaction','dayGrid'],
    		defaultDate: '2021-03-01',
    		editable: true,
    		eventLimit: true,
    		events: [
    			{
    				/* title: 'All day event',
    				start: '2021-03-01',
    				end: '2021-03-02', */
    				//id: '1'
    			}
    		],
            eventClick: function(info) {
   			var eventObj = info.event;
   				if(eventObj.start){
   					
   					var params = eventObj._def.extendedProps.scheId;
   					
   					console.log(eventObj._def.extendedProps.scheId);
   					
   					location.href="/grw/schedule/scheduleSel.do?scheId="+params;
   					

    				/* var scheId = eventObj._def.extendedProps.scheId;
    				console.log(scheId);
    				 	
  	  				var scheId2 = $(eventObj._def.extendedProps).attr("scheId");
  	  				console.log(scheId2);
  	  				
  	  				var scheId3 = $(info).data('id');
   					console.log(scheId3);

   					$("#myModal .modal-body #scheId").val(scheId3);
   					console.log($("#myModal .modal-body #scheId").val(scheId3));
   					 
   					//$(".modal-body").find("input[name=scheId]").val(scheId);
   					$(".modal-body #scheId").val(scheId2);
   					console.log( $(".modal-body #scheId").val(scheId2));
   					$('#myModal').modal('show');
   					readSchedule(scheId); */
   				}
			},
    		header: {
    			left: 'prevYear,prev,next,nextYear today',
    			center: 'title',
    			right: 'dayGridMonth,dayGridWeek,dayGridDay'
    		},
    		locale: 'ko',
    		droppable: true,
    		drop: function(info) {
    			if(checkbox.checked){
    				info.draggedEl.parentNode.removeChild(info.daggedEl);
    			}
    		},
    		dateClick: function(){
    			// alert("clicked");
    		}
    	});
    	
    	calendar.on('dateClick', function(info){
    		console.log("click " + info.dateStr);
    		
    	});
    	
    	calendar.render();
    	
    	var arrTest = getCalendarDataInDB();
    	  $.each(arrTest, function(index, item){
    		  	console.log("arrTest : " + item.scheNm);
    		  	
    		  	item.title = item.scheNm;
                item.start = item.startDate;
                item.end = item.endDate;
    		  	
		      	calendar.addEvent( item );

    	        console.log('outer loop_in_cal' + index + ' : ' + item);
    	        $.each(item, function(iii, ttt){
    	            console.log('inner loop_in_cal => ' + iii + ' : ' + ttt);
    	        
    	        });
    	        
    	});
    	  
    	  
    	  /* $("#btnAddTest").click(function(){
    	      //var arr = getCalendarEvent();
    	      var arr = getCalendarDataInDB();
    	      //console.log('arr[0].size : ' +  Object.keys( arr[0] ).length );
    	      $.each(arr, function(index, item){
    	          calendar.addEvent( item );
    	          console.log('click evt loop_in_cal' + index + ' : ' + item);
    	          $.each(item, function(iii, ttt){
    	                console.log('click evt inner loop_in_cal => ' + iii + ' : ' + ttt);
    	          });
    	      });
    	      
    	      //calendar.addEvent( {'title':'evt4', 'start':'2019-09-04', 'end':'2019-09-06'});
    	      calendar.render();
    	  });  
    	   */
    });
    
   /*  function readSchedule(params) {	
		var formData = new FormData($("#frmLst")[0]);

		$.ajax({
			data : JSON.stringify(formData),
			url: "/grw/schedule/scheduleSel.do",
			dataType: "json",
			type: "POST",
			contentType : "application/json; charset=UTF-8",
			beforeSend : function() {
				$("#scheId_up").empty();
				$("#scheNm_up").empty();
			    $("#userId_up").empty();
			   // $("#stf_sq_up").empty();
			    $("#startDate_up").empty();
			    $("#endDate_up").empty();
			    $("#content_up").empty();
			},
			success: function(data) {			    
			    $("#scheId_up").val(data.scheId);
			    $("#scheNm_up").val(data.scheNm);
			    $("#userId_up").val(data.userId);
			   // $("#stf_sq_up").val(data.stf_sq);
			    $("#startDate_up").val(data.startDate);
			    $("#endDate_up").val(data.endDate);
			    $("#content_up").text(data.content);
			},
			error: function(request, status, error) {
				alert("list search fail :: error code: " + request.status + "\n" + "error message: " + error + "\n");
			}
		});
	} */
    
    
    function getCalendarEvent(){
        //var arr = [ {'title':'evt4', 'start':'2019-09-04', 'end':'2019-09-06'} ];
        var arr = { 'title':'evt4', 'start':'2019-09-04', 'end':'2019-09-06' };
        return arr;
    }
    
    
    function getCalendarDataInDB(){
	    var arr = [{title: 'evt1', start:'ssssss'}, {title: 'evt2', start:'123123123'}];
	    
	    //배열 초기화
	    var viewData = {};
	    //data[키] = 밸류
	    viewData["id"] = $("#scheId").text().trim();
	    viewData["title"] = $("#title").val();
	    viewData["content"] = $("#content").val();
	    
	    $.ajax({
	        contentType:'application/json',
	        dataType:'json',
			url : "/grw/schedule/scheduleLst.do",
	        type:'post',
	        async: false,
	        data:JSON.stringify(viewData),
	        success:function(resp){
	            //alert(resp.f.id + ' ggg');     
	            $.each(resp, function(index, item){
	                console.log(index + ' : ' + item);
	                $.each(item, function(iii, ttt){
	                    console.log('inner loop => ' + iii + ' : ' + ttt);
	                });
                console.log(resp[index].scheId);
                console.log(arr[index].title);
                arr[index].title = resp[index].scheNm;
                arr[index].start = resp[index].startDate;
                arr[index].end = resp[index].endDate;
                console.log(arr[index].title);
             
	            
	            });
	            arr = resp;
	            console.log("resp : "+resp.start);
	            console.log("resp : "+resp.scheId);
	        },
	        error:function(){
	            alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
	        }
	    });
	    
	    return arr;
	}
  
    
</script>

</head>
<body>


	<div class="card border-grey-300 my-0 mb-1">
		<div class="card-header bg-light header-elements-inline pl-2 py-2">
			<h6 class="card-title font-weight-bold font-size-sm">일정</h6>
		</div>
		
		<div class="card-body px-2 py-2">
		
			<div id="calendar"></div>
		
		</div>
	</div>


	<div class="row">
		<div class="col-12 px-2 mt-md-1 mt-1 text-right">
			<a href="/grw/schedule/scheduleWrt.do" class="btn btn-outline bg-dark border-grey-800 text-dark">일정 등록</a>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
	
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">상세 일정</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	
				<div class="modal-body">
					<form>
							<input type="hidden" class="form-control" id="scheId" name="scheId" readonly="readonly" value="${scheLst.scheId }">
						<div class="form-group">
						${scheId }
						==========
						${scheLst.scheId }
						=========
						${param.scheId }
						</div>
						<div class="form-group">
							<label for="scheNm">일정명</label>
							<input type="text" class="form-control" id="scheNm_up" name="scheNm" readonly="readonly" value="">
						</div>
						<div class="form-group">
							<label for="userId">작성자</label>
							<input type="text" class="form-control" id="userId_up" name="userId" readonly="readonly" value="userid">
						</div>
						<div class="form-group">
							<label for="startDate1">시작일</label>
							<input type="text" class="form-control" id="startDate_up" name="startDate" value="startdate">
						</div>
						<div class="form-group">
							<label for="endDate1">종료일</label>
							<input type="text" class="form-control" id="endDate_up" name="endDate" value="enddate">
						</div>
						<div class="form-group">
							<label for="content">상세내용</label>
							<textarea class="form-control" id="content_up" name="content" >content</textarea>
						</div>
					</form>
				</div>
	
				<div class="modal-footer">
					<button type="button" id="updateSchedule" class="btn btn-default">수정</button>
					<button type="button" id="deleteSchedule" class="btn btn-default">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
	
		</div>
	</div>

</body>
</html>
