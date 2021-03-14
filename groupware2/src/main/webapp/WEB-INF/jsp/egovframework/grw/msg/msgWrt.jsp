<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"				prefix="c" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">쪽지 작성</h6>
	</div>
	<div class="card-body px-2 py-2">

		<form id="frmWrt" name="frmWrt" method="post">
			<input type="hidden" name="senderId" value="${login.userId}" />
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">받는이<strong class="text-danger pl-1">*</strong></label> 
				<select id="receiverId" name="receiverId" class="form-control">
					<option value="">선택</option>
					<c:forEach var="result" items="${emplList}">
						<option value="${result.userId}">${result.userNm}</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group mb-0">
				<label class="form-label-sm mb-0">내용<strong class="text-danger pl-1">*</strong></label> 
				<textarea name="message" class="form-control form-control-sm" rows="5"></textarea>
			</div>

		</form>
		
	</div>
</div>

<row>
	<div class="d-flex justify-content-between align-items-center">
		<a href="javascript:history.back();" class="btn btn-outline bg-danger border-grey-800 text-dark">취소</a>
		<button type="button" name="ins" class="btn btn-dark border-grey-800">저장</button>
	</div>
</row>