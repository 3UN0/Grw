<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"			prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 	prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/PagingTaglib.tld"				prefix="paging" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">결재 문서 목록</h6>
	</div>
	
	<div class="card-body px-2 py-2">

		<form id="frm1" name="frm1">
			<input type="hidden" name="userId" value="${login.userId}" />
			<input type="hidden" name="midSign" value="${login.userId}" />
			
		</form>
		
		<div class="table-responsive">
			<table class="table table-bordered table-hover table-xs">
				<colgroup>
					<col width="5%">
					<col width="5%">
					<col width="*">
					<col width="5%">
					<col width="10%">
				</colgroup>
				<thead class="thead-light text-center">
					<tr>
						<th>순번</th>
						<th>구분</th>
						<th>결재 문서 제목</th>
						<th>승인 상태</th>
						<th>작성 날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty pagingInfo.dataList}">
							<c:forEach items="${pagingInfo.dataList}" var="item" varStatus="status">
								<tr>
									<td class="text-center">${paging:listNumber(pagingInfo, status.count)}</td>
									<td class="text-center">${item.signname}</td>
									<td class="text-left">
										<a href="/grw/sign/signSel.do?sid=${item.sid}" class="text-secondary">${item.title}</a>
									</td>
									<td class="text-center">${item.acpname}</td>
									<td class="text-center">${fn:substring(item.regDate,0,16)}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="text-center">작성한 문서가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
	
		</div>

	</div>
</div>

<div class="row">
	<div class="col-12 col-md-6">
		${paging:pagingText(pagingInfo)}	
	</div>
	<div class="col-12 px-2 col-md-6 mt-md-0 mt-1 text-right">
		<a href="/grw/sign/signWrt.do" class="btn btn-outline bg-dark border-grey-800 text-dark">결재 문서 작성</a>
	</div>
</div>