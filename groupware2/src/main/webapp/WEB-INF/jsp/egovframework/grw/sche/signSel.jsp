<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"		prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"	prefix="fn" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">결재 문서 보기</h6>
	</div>
	<div class="card-body px-2 py-2">

		<form id="frmSel" name="frmSel">
			<input type="hidden" name="sid" value="${signSel.sid}" />
			<input type="hidden" name="userId" value="${signSel.userId}"/>
		</form>

		<fieldset disabled="disabled">	
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">작성자</label> 
				<input type="text" value="${signSel.username}" class="form-control form-control-sm text-dark" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">중간결재자</label> 
				<input type="text" value="${signSel.midnm}" class="form-control form-control-sm text-dark" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">최종결재자</label> 
				<input type="text" value="${signSel.fnlnm}" class="form-control form-control-sm text-dark" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">결재 유형</label> 
				<input type="text" value="${signSel.signname}" class="form-control form-control-sm text-dark" />
			</div>

			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">승인 여부</label> 
				<input type="text" value="${signSel.acpname}" class="form-control form-control-sm text-dark" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">내용</label> 
				<div class="card mb-0" style="min-height: 150px;">
					<div class="card-body px-2 py-2">
						${signSel.contents}
					</div>
				</div>	
			</div>

	
			<div class="form-row mb-0">

	           	<div class="form-group col-6 col-md-6 mb-0">
					<label class="form-label-sm mb-0">작성 일자</label>
					<input type="text" value="${fn:substring(signSel.regDate,0,16)}" class="form-control form-control-sm text-dark" />
				</div>

			</div>	
	
		</fieldset>
	</div>

</div>

<div class="row">
	<div class="col-12 text-right">
	
		<a href="javascript:history.back();" class="btn btn-outline bg-dark border-grey-800 text-dark">목록</a>
		<c:choose>
			<c:when test="${signSel.midSign eq login.userId}">
				<button type="button" name="accept" class="btn btn-outline bg-dark border-grey-800 text-dark">승인</button>
				<button type="button" name="ret" class="btn btn-danger border-danger-800">반려</button>
			</c:when>
			<c:when test="${signSel.fnlSign eq login.userId}">
				<button type="button" name="acceptfnl" class="btn btn-outline bg-dark border-grey-800 text-dark">승인</button>
				<button type="button" name="ret" class="btn btn-danger border-danger-800">반려</button>
			</c:when>
		</c:choose>
		
	</div>
</div>
