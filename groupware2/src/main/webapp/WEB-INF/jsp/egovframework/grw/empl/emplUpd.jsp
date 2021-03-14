<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"		prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"	prefix="fn" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">사원 정보 편집</h6>
	</div>
	<div class="card-body px-2 py-2">

		<form id="frmUpd" name="frmUpd" method="post" >
			<input type="hidden" name="userId" value="${emplUpd.userId}" /> 
			<input type="hidden" name="phone" value="${emplUpd.phone}" /> 
			<input type="hidden" name="email" value="${emplUpd.email}" /> 
			<input type="hidden" name="birthdate" value="${emplUpd.birthdate}" /> 
			<input type="hidden" name="imgUrl" value="${emplUpd.imgUrl}" /> 
			<input type="hidden" name="imgName" value="${emplUpd.imgName}" /> 
			<input type="hidden" name="imgOriName" value="${emplUpd.imgOriName}" /> 
			
			<div class="form-group mb-2">
				<label class="form-label-sm font-weight-bolder mb-0">이름<strong class="text-danger pl-1">*</strong></label> 
				<input type="text" name="userNm" maxlength="120" value="${emplUpd.userNm}" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>

			<div class="form-group mb-2">
				<label class="form-label-sm font-weight-bolder mb-0">부서 <strong class="text-danger pl-1">*</strong></label>
				<input type="text" name="partname" maxlength="120" value="${emplUpd.partname}" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" readonly="readonly" />				
				<select id="partId" name="partId" class="form-control">
					<option value="">선택</option>
					<c:forEach var="result" items="${partLst}">
						<option value="${result.partId}">${result.partNm}</option>
					</c:forEach>
				</select>
			</div>
				
			<div class="form-group mb-2">
				<label class="form-label-sm font-weight-bolder mb-0">직급 <strong class="text-danger pl-1">*</strong></label>
				<input type="text" name="posname" maxlength="120" value="${emplUpd.posname}" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" readonly="readonly" />				
				<select id="posId" name="posId" class="form-control">
					<option value="">선택</option>
					<c:forEach var="result" items="${posLst}">
						<option value="${result.posId}">${result.posNm}</option>
					</c:forEach>
				</select>
			</div>

		</form>
		
	</div>
</div>

<row>
	<div class="d-flex justify-content-between align-items-center">
		<a href="/grw/empl/emplLst.do" class="btn btn-outline bg-danger border-grey-800 text-dark">취소</a>
		<button type="button" name="upd" class="btn btn-dark border-grey-800">저장</button>
	</div>
</row>