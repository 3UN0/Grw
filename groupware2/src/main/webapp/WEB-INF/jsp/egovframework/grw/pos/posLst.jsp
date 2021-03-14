<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"			prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 	prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/PagingTaglib.tld"				prefix="paging" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">직급 목록</h6>
	</div>
	<div class="card-body px-2 py-2">

	<form id="frmSel" name="frmSel" >
		<input type="hidden" name="posId" value="${param.posId }" />
	</form>
		 
		<div class="table-responsive">
			<table class="table table-bordered table-hover table-xs">
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
				</colgroup>
				<thead class="thead-light text-center">
					<tr>
						<th>순번</th>
						<th>직급명</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty pagingInfo.dataList}">
							<c:forEach items="${pagingInfo.dataList}" var="item" varStatus="status">
								<tr>
									<td class="text-center">${paging:listNumber(pagingInfo, status.count)}</td>
									<td class="text-left">${item.posNm}</td>
									<td class="text-center">
										<input type="hidden" name="posId" value="${item.posId }" />
										<a href="/grw/pos/posUpd.do?posId=${item.posId }"  class="btn btn-outline bg-dark border-grey-800 text-dark">편집</a>
										<button type="button" name="del" class="btn btn-danger border-danger-800">삭제</button>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3" class="text-center">저장된 부서가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
	
		</div>

	</div>
</div>

<div class="row">
	<div class="col-12 col-md-6 mt-md-0 mt-1 text-right">
		<a href="/grw/pos/posIns.do" class="btn btn-outline bg-dark border-grey-800 text-dark">추가</a>
	</div>
</div>