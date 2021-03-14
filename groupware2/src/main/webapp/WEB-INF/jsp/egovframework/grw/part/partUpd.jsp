<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"		prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"	prefix="fn" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">부서 정보 편집</h6>
	</div>
	<div class="card-body px-2 py-2">

		<form id="frmUpd" name="frmUpd" method="post">
			<input type="hidden" name="partId" value="${partUpd.partId}" /> 

			<div class="form-group mb-2">
				<label class="form-label-sm font-weight-bolder mb-0">부서명<strong class="text-danger pl-1">*</strong></label> 
				<input type="text" name="partNm" maxlength="120" value="${partUpd.partNm}" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>

		</form>
		
	</div>
</div>

<div class="row">
	<div class="col-12 d-flex justify-content-between align-items-center">
		<a href="/grw/part/partLst.do" class="btn btn-outline bg-danger border-grey-800 text-dark">취소</a>
		<button type="button" name="upd" class="btn btn-dark border-grey-800">저장</button>
	</div>
</div>