<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"			prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 	prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/PagingTaglib.tld"				prefix="paging" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">보낸 쪽지 목록</h6>
	</div>
	
	<div class="card-body px-2 py-2">

		<form id="frm1" name="frm1">
			<input type="hidden" name="senderId" value="${login.userId}" />
		</form>
		
		<div class="table-responsive">
			<table class="table table-bordered table-hover table-xs">
				<colgroup>
					<col width="5%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead class="thead-light text-center">
					<tr>
						<th>순번</th>
						<th>쪽지 내용</th>
						<th>받는 사람</th>
						<th>보낸 날짜</th>
						<th>수신 여부</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty pagingInfo.dataList}">
							<c:forEach items="${pagingInfo.dataList}" var="item" varStatus="status">
								<tr>
									<td class="text-center">${paging:listNumber(pagingInfo, status.count)}</td>
									<td class="text-left">
										<a href="/grw/msg/msgSel.do?msgId=${item.msgId}" class="text-secondary">${item.message}</a>
									</td>
									<td class="text-center">${item.receiver}</td>
									<td class="text-center">${fn:substring(item.sndDate,0,16)}</td>
									<td class="text-center">
										<c:if test="${item.rcvYn eq 'Y' }">
											읽음
										</c:if>
										<c:if test="${item.rcvYn eq 'N' }">
											읽지 않음
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="text-center">보낸 쪽지가 없습니다.</td>
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
		<a href="/grw/msg/msgWrt.do" class="btn btn-outline bg-dark border-grey-800 text-dark">쪽지쓰기</a>
	</div>
</div>