<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"				prefix="c" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">전자결재 작성</h6>
	</div>
	<div class="card-body px-2 py-2">

		<form id="frmWrt" name="frmWrt" method="post" >
			<input type="hidden" name="userId" value="${login.userId}" />
		
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">제목<strong class="text-danger pl-1">*</strong></label>
				<input type="text" id="title" name="title" maxlength="120" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">결재 유형<strong class="text-danger pl-1">*</strong></label>
				<select id="signId" name="signId" class="form-control">
					<option value="">선택</option>
					<c:forEach var="result" items="${signidLst}">
						<option value="${result.signId}">${result.signNm}</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">중간 승인자 선택<strong class="text-danger pl-1">*</strong></label> 
				<select id="midSign" name="midSign" class="form-control">
					<option value="">선택</option>
					<c:forEach var="result" items="${emplList}">
						<option value="${result.userId}">${result.userNm}</option>
					</c:forEach>
				</select>
				<label class="form-label-sm mb-0">최종 승인자 선택<strong class="text-danger pl-1">*</strong></label> 
				<select id="fnlSign" name="fnlSign" class="form-control">
					<option value="">선택</option>
					<c:forEach var="result" items="${emplList}">
						<option value="${result.userId}">${result.userNm}</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="form-group mb-0">
				<label class="form-label-sm mb-0">내용<strong class="text-danger pl-1">*</strong></label> 
				<textarea name="contents" class="form-control form-control-sm" rows="8"></textarea>
			</div>

		</form>
		
	</div>
</div>

<row>
	<div class="d-flex justify-content-between align-items-center">
		<a href="/grw/sign/signIngLst.do?brdId=${param.brdId}" class="btn btn-outline bg-danger border-grey-800 text-dark">취소</a>
		<button type="button" name="ins" class="btn btn-dark border-grey-800">저장</button>
	</div>
</row>
