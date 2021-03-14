<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"		prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"	prefix="fn" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">쪽지 보기</h6>
	</div>
	<div class="card-body px-2 py-2">

		<form id="frmMSel" name="frmMSel">
			<input type="hidden" name="msgId" value="${msgSel.msgId}" />
			<input type="hidden" name="senderId" value="${msgSel.senderId}"/>
		</form>

		<fieldset disabled="disabled">	
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">보낸 사람</label> 
				<input type="text" value="${msgSel.sender}" class="form-control form-control-sm text-dark" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">받는 사람</label> 
				<input type="text" value="${msgSel.receiver}" class="form-control form-control-sm text-dark" />
			</div>
	
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">내용</label> 
				<div class="card mb-0" style="min-height: 150px;">
					<div class="card-body px-2 py-2">
						${msgSel.message}
					</div>
				</div>	
			</div>

	
			<div class="form-row mb-0">

	           	<div class="form-group col-6 col-md-6 mb-0">
					<label class="form-label-sm mb-0">발송 일자</label>
					<input type="text" value="${fn:substring(msgSel.sndDate,0,16)}" class="form-control form-control-sm text-dark" />
				</div>

	           	<div class="form-group col-6 col-md-6 mb-0">
					<label class="form-label-sm mb-0">수신 일자</label>
					<input type="text" value="${fn:substring(msgSel.rcvDate,0,16)}" class="form-control form-control-sm text-dark" />
				</div>
				
			</div>	
	
		</fieldset>
	</div>

</div>

<div class="row">
	<div class="col-12 px-2 text-right">
	
		<a href="javascript:history.back();" class="btn btn-outline bg-dark border-grey-800 text-dark">목록</a>
		<c:choose>
			<c:when test="${msgSel.receiverId eq login.userId}">
				<a href="/grw/msg/msgWrt.do" class="btn btn-outline bg-dark border-grey-800 text-dark">쪽지쓰기</a>
				<button type="button" name="del" class="btn btn-danger border-danger-800">삭제</button>
			</c:when>
		</c:choose>
		
	</div>
</div>
