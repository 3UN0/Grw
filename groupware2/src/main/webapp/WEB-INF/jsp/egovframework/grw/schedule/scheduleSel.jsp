<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"			prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 	prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/PagingTaglib.tld"				prefix="paging" %>


	<div class="card border-grey-300 my-0 mb-1">
			
		<div id="leftTop" class="card-header bg-light header-elements-inline pl-2 py-2">
			<h5 class="card-title font-weight-bold font-size-sm">일정 조회</h5>
			<!-- <button type="button" class="btn btn-warning pull-right"
			data-toggle="modal" data-backdrop="static"
			data-target="#departmentModal">관리</button> -->
		</div>
					
					
		<div id="leftBottom" class="card-body px-2 py-2">

			<form id="scheSelFrm" method="post">
				<input type="hidden" id="scheId" name="scheId" value="${scheSel.scheId }">
				<input type="hidden" name="userId" value="${login.userId }" />
							
				<fieldset disabled="disabled">	
							
					<div class="form-row mb-0">
								
						<div class="form-group col-6 col-md-6 mb-0">
							<label for="scheduleTitle1">제목</label> 
							<input type="text" class="form-control form-control-sm text-dark" id="scheNm" name="scheNm" value="${scheSel.scheNm}">
						</div>
								
						<div class="form-group col-6 col-md-6 mb-0">
							<label for="scheduleStart1">시작일</label>
							<input type="text" value="${fn:substring(scheSel.startDate,0,16)}" class="form-control form-control-sm text-dark" />
						</div>
					</div>	
								
					<div class="form-row my-1 mb-0">	
						
						<div class="form-group col-6 col-md-6 mb-0">
							<label for="scheduleContent1">내용</label> 
							<div class="card mb-0" style="min-height: 100px;">
								<div class="card-body px-2 py-2">
									${scheSel.content}
								</div>
							</div>
						</div>
								
						<div class="form-group col-6 col-md-6 mb-0">
							<label for="scheduleEnd1">종료일</label>
							<input type="text" value="${fn:substring(scheSel.endDate,0,16)}" class="form-control form-control-sm text-dark" />
						</div>
									
					</div>
				</fieldset>
			</form>
		</div>
	</div>
				
	<div class="row">
		<div class="col-12 px-2 text-right">
			<a href="/grw/sche/scheLst.do" class="btn btn-outline bg-dark border-grey-800 text-dark">목록</a>
			<c:choose>
				<c:when test="${scheSel.userId eq login.userId}">
					<a href="/grw/schedule/scheduleUpd.do?scheId=${scheSel.scheId}" class="btn btn-outline bg-dark border-grey-800 text-dark">편집</a>
					<button type="button" id="scheduleDel" class="btn btn-danger border-danger-800">삭제</button>
				</c:when>
			</c:choose>
		</div>
	</div>			
				
				
				
	<!-- 달력 -->
	<!-- content 종료 -->
		