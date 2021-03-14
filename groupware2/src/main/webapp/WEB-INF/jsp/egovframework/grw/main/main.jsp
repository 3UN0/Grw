<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"			prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 	prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/PagingTaglib.tld"				prefix="paging" %>

<!DOCTYPE html>
<html>
<head></head>

<body>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">공지사항</h6>
	</div>
	<div class="card-body px-2 py-2">

		<div class="table-responsive">
			<table class="table table-bordered table-hover table-xs">
				<colgroup>
					<col width="5%">
					<col width="*">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead class="thead-light text-center">
					<tr>
						<th>순번</th>
						<th>제목</th>
						<th>작성자</th>
					</tr>
					
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty pagingInfo.dataList}">
							<c:forEach items="${pagingInfo.dataList}" var="item" varStatus="status">
								<tr>
									<td class="text-center">${paging:listNumber(pagingInfo, status.count)}</td>
									<td class="text-left">
										<a href="/grw/board/contSel.do?contentId=${item.contentId }" class="text-secondary">${item.title}</a>
									</td>
									<td class="text-center">${item.username}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3" class="text-center">작성되어 있는 게시물이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>

	</div>
</div>


<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">받은 쪽지 목록</h6>
	</div>
	
	<div class="card-body px-2 py-2">

		<form id="frm1" name="frm1">
			<input type="hidden" name="receiverId" value="${login.userId}" />
		</form>

		<div class="table-responsive">
			<table class="table table-bordered table-hover table-xs">
				<colgroup>
					<col width="5%">
					<col width="*">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead class="thead-light text-center">
					<tr>
						<th>순번</th>
						<th>쪽지 내용</th>
						<th>보낸 사람</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty pagingInfo2.dataList}">
							<c:forEach items="${pagingInfo2.dataList}" var="item" varStatus="status">
								<tr>
									<td class="text-center">${paging:listNumber(pagingInfo2, status.count)}</td>
									<td class="text-left">
										<a href="/grw/msg/msgSel.do?msgId=${item.msgId}" class="text-secondary">${item.message}</a>
									<td class="text-center">${item.sender}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3" class="text-center">받은 쪽지가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
	
		</div>

	</div>
</div>

</body>
</html>