<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"			prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 	prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/PagingTaglib.tld"				prefix="paging" %>

<div class="card border-grey-300 my-0 mb-1">
	<form id="formSearch" name="formSearch">
		<input type="hidden" name="brdId" value="${param.brdId }">
		<input type="hidden" name="contentId" value="${param.contentId }">
	
		<div class="card-body px-2 pt-2 pb-0">

			<div class="form-row">
				<div class="col-3 col-md-2 mb-2">
					<label class="form-label mb-0">검색 종류</label>
					<select name="schKeyWord" class="form-control form-control-sm">
						<option value="title" <c:if test="${param.schKeyWord eq 'title'}">selected</c:if>>제목</option>
						<option value="contents" <c:if test="${param.schKeyWord eq 'contents'}">selected</c:if>>내용</option>
					</select>
				</div>
				<div class="col-9 col-md mb-2">
					<label class="form-label mb-0">검색 내용</label>
					<input type="text" name="schKeyValue" value="${param.schKeyValue}" class="form-control form-control-sm" autocomplete="off" />
				</div>
				<div class="col-12 col-md-2 mb-2">
					<label class="form-label d-none d-md-block mb-0">&nbsp;</label>
					<button type="submit" class="btn btn-sm btn-slate bg-slate-600 border-slate-600 text-white btn-block">검색</button>
				</div>
			</div>

		</div>
	</form>
</div>


<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">목록</h6>
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
										<a href="/grw/board/contSel.do?contentId=${item.contentId }" class="text-secondary">${item.title}&nbsp;</a>
										<c:if test="${item.fileUrl != null }">
											<i class="icon-file-text2 mr-0"></i>
										</c:if>
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

<div class="row">
	<div class="col-12 col-md-6">
		${paging:pagingText(pagingInfo)}	
	</div>
	
	<c:choose>
		<c:when test="${param.brdId eq '00' }">
			<c:if test="${login.userId eq 'admin' }">
				<div class="col-12 col-md-6 mt-md-0 mt-1 px-2 text-right">
					<a href="/grw/board/contWrt.do?brdId=${param.brdId }" class="btn btn-outline bg-dark border-grey-800 text-dark">작성</a>
				</div>
			</c:if>	
		</c:when>
		<c:otherwise>
			<c:if test="${login != null }">
				<div class="col-12 col-md-6 mt-md-0 mt-1 px-2 text-right">
					<a href="/grw/board/contWrt.do?brdId=${param.brdId }" class="btn btn-outline bg-dark border-grey-800 text-dark">작성</a>
				</div>
			</c:if>
		</c:otherwise>
	</c:choose>
	
</div>
