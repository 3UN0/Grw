<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"				prefix="c" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">사원 등록</h6>
	</div>
	<div class="card-body px-2 py-2">

		<form id="frmIns" name="frmIns" method="post" enctype="multipart/form-data"> 

			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">이름</label><strong class="text-danger pl-1">*</strong> 
				<input type="text" name="userNm" maxlength="20" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">아이디</label><strong class="text-danger pl-1">*</strong> 
				<input type="text" name="userId" maxlength="30" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">비밀번호</label><strong class="text-danger pl-1">*</strong> 
				<input type="password" name="userPw" maxlength="30" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">부서 <strong class="text-danger pl-1">*</strong></label>
				<select id="partId" name="partId" class="form-control form-control-sm maxlength-badge-position">
					<option value="">선택</option>
					<c:forEach var="result" items="${partLst}">
						<option value="${result.partId}">${result.partNm}</option>
					</c:forEach>
				</select>
			</div>
				
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">직급 <strong class="text-danger pl-1">*</strong></label>
				<select id="posId" name="posId" class="form-control form-control-sm maxlength-badge-position">
					<option value="">선택</option>
					<c:forEach var="result" items="${posLst}">
						<option value="${result.posId}">${result.posNm}</option>
					</c:forEach>
				</select>
			</div>
			
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">사진</label><strong class="text-danger pl-1">*</strong> 
				<input type="file" name="imgUrl" maxlength="200" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>
			
		</form>
		
	</div>
</div>

<div class="row">
	<div class="col-12 d-flex justify-content-between align-items-center">
		<a href="/grw/empl/emplLst.do" class="btn btn-outline bg-danger border-grey-800 text-dark">취소</a>
		<button type="button" name="ins" class="btn btn-dark border-grey-800">저장</button>
	</div>
</div>
