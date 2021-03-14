<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"			prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 	prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/PagingTaglib.tld"				prefix="paging" %>



	<!-- 일정 등록 -->
	<div class="card border-grey-300 my-0 mb-1">
			
		<div id="leftTop" class="card-header bg-light header-elements-inline pl-2 py-2">
			<h5 class="card-title font-weight-bold font-size-sm">일정 등록</h5>
			<!-- <button type="button" class="btn btn-warning pull-right"
			data-toggle="modal" data-backdrop="static"
			data-target="#departmentModal">관리</button> -->
		</div>
					
					
		<div id="leftBottom" class="card-body px-2 py-2">

			<form id="scheWrtFrm" method="post">
				<input type="hidden" id="scheId" name="scheId" value="${scheId }">
				<input type="hidden" name="userId" value="${login.userId }" />
							
				<div class="form-row mb-0">
							
					<div class="form-group col-6 col-md-6 mb-0">
						<label for="scheduleTitle1">제목</label> 
						<input type="text" class="form-control" id="scheNm" name="scheNm" placeholder="제목">
					</div>
							
					<div class="form-group col-6 col-md-6 mb-0">
						<label for="scheduleStart1">시작일</label>
						<div>
							<input type="date" id="startYMD"  class="form-control" />
						</div>
						<div class="text-right">
							<select id="startHour" class="scheduleSelect">
							<option value="00">00</option>
							</select>시
							<select id="startMin" class="scheduleSelect">
							<option value="00">00</option>
							</select>분
						</div>
							<input type="hidden" id="startDate" name="startDate" />
					</div>
				</div>	
								
				<div class="form-row my-1 mb-0">	
					
					<div class="form-group col-6 col-md-6 mb-0">
						<label for="scheduleContent1">내용</label> 
						<textarea id="content" name="content" class="form-control" rows="3"></textarea>
					</div>
							
					<div class="form-group col-6 col-md-6 mb-0">
						<label for="scheduleEnd1">종료일</label>
							<div>
							<input type="date" id="endYMD" class="form-control" />
							</div>
						<div class="text-right">
							<select id="endHour" class="scheduleSelect">
							<option value="00">00</option>
							</select>시
							<select id="endMin" class="scheduleSelect">
							<option value="00">00</option>
							</select>분
						</div>
							<input type="hidden" id="endDate" name="endDate" />
					</div>
								
				</div>
							
				<div class="form-row mb-0 px-2">
					<button type="button" id="scheduleInsert" class="btn btn-dark border-grey-800">등록</button>
				</div>
							
			</form>
		</div>
				
	</div>
				
	<!-- 달력 -->
	<!-- content 종료 -->
		