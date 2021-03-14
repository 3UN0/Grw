<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"		prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"	prefix="fn" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">사원 조회</h6>
	</div>
	<div class="card-body px-2 py-2">

		<form id="frmESel" name="frmESel">
			<input type="hidden" name="userId" value="${emplSel.userId}" />
			<input type="hidden" name="receiverId" value="${msgSel.receiverId}"/>
			
		</form>

		<fieldset disabled="disabled">
		
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">이름</label> 
				<input type="text" value="${emplSel.userNm}" class="form-control form-control-sm text-dark" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">부서</label> 
				<input type="text" value="${emplSel.partname}" class="form-control form-control-sm text-dark" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">직급</label> 
				<input type="text" value="${emplSel.posname}" class="form-control form-control-sm text-dark" />
			</div>
	
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">생년월일</label> 
				<input type="text" value="${emplSel.birthdate}" class="form-control form-control-sm text-dark" />
			</div>
		
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">휴대전화</label> 
				<input type="text" value="${emplSel.phone}" class="form-control form-control-sm text-dark" />
			</div>
	
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">이메일</label>
				<input type="text" value="${emplSel.email}" class="form-control form-control-sm text-dark" />
			</div>

			<c:if test="${emplSel.imgName != null }">
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">사원 사진</label> 
				<div class="card mb-0" style="min-height: 30px;">
					<div class="card-body px-2 py-2">
						<img width="100px" src="/grw/getImage.do?userId=${emplSel.userId}" />
					</div>
				</div>	
			</div>
			</c:if>
	
			<div class="form-row mb-0">
	           	<div class="form-group col-6 col-md-6 mb-0">
					<label class="form-label-sm mb-0">수정일자</label>
					<input type="text" value="${fn:substring(emplSel.updDate,0,16)}" class="form-control form-control-sm text-dark" />
				</div>

	           	<div class="form-group col-6 col-md-6 mb-0">
					<label class="form-label-sm mb-0">작성일자</label>
					<input type="text" value="${fn:substring(emplSel.regDate,0,16)}" class="form-control form-control-sm text-dark" />
				</div>
			</div>	
	
		</fieldset>
	</div>

</div>

     
	<!-- Modal -->
	<div class="modal fade" id="exmodal" role="dialog">
		<div class="modal-dialog">
	
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">쪽지 보내기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	
				<div class="modal-body">
					<form>
						<input type="hidden" class="form-control" id="msgId" name="msgId" readonly="readonly" value="${msgId }">
						
						<div class="form-group">
							<label for="content">쪽지 내용</label>
							<textarea class="form-control" id="message" name="message" >content</textarea>
						</div>
					</form>
				</div>
	
				<div class="modal-footer">
					<button type="button" id="sendMsg" class="btn btn-default">쪽지 보내기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
	
		</div>
	</div>



<div class="row">
	<div class="col-12 px-2 text-right">
	
		<a href="/grw/empl/emplLst.do" class="btn btn-outline bg-dark border-grey-800 text-dark">목록</a>
		<c:choose>
			<c:when test="${login.userId eq 'admin' }">
				<a href="/grw/empl/emplUpd.do?userId=${param.userId}" class="btn btn-outline bg-dark border-grey-800 text-dark">편집</a>
				<button type="button" name="del" class="btn btn-danger border-danger-800">삭제</button>
			</c:when>
			<c:otherwise>
				<a href="/grw/msg/msgWrt.do" class="btn btn-outline bg-dark border-grey-800 text-dark">쪽지쓰기</a>
<!-- 				<button type="button" id="confirm" name="confirm" class="btn btn-outline bg-dark border-grey-800 text-dark">쪽지쓰기</button>
 -->			</c:otherwise>
		</c:choose>
		
	</div>
</div>
