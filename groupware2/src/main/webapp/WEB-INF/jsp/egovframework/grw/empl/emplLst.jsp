<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"			prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" 	prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/PagingTaglib.tld"				prefix="paging" %>

<div class="card border-grey-300 my-0 mb-1">
	<form id="formSearch" name="formSearch">
		<div class="card-body px-2 pt-2 pb-0">

			<div class="form-row">
				<div class="col-3 col-md-2 mb-2">
					<label class="form-label mb-0">검색 종류</label>
					<select name="schKeyWord" class="form-control form-control-sm">
						<option value="userNm" <c:if test="${param.schKeyWord eq 'userNm'}">selected</c:if>>이름</option>
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
		<h6 class="card-title font-weight-bold font-size-sm">사원 목록</h6>
	</div>
	<div class="card-body px-2 py-2">

		<div class="table-responsive">
			<table class="table table-bordered table-hover table-xs">
				<colgroup>
					<col width="5%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead class="thead-light text-center">
					<!-- <tr>
						<th>순번</th>
						<th>제목</th>
						<th>작성일자</th>
					</tr> -->
					<tr>
						<th>이름</th>
						<th>부서</th>
						<th>직급</th>
						<th>이메일</th>
						<th>휴대전화</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty pagingInfo.dataList}">
							<c:forEach items="${pagingInfo.dataList}" var="item" varStatus="status">
								<tr>
									<td class="text-center">
										<a href="/grw/empl/emplSel.do?userId=${item.userId}" class="text-secondary">${item.userNm}</a>
									</td>									
									<td class="text-center">${item.partname }</td>
									<td class="text-center">${item.posname }</td>
									<td class="text-center">${item.email }</td>
									<td class="text-center">${item.phone }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="text-center">작성되어 있는 게시물이 없습니다.</td>
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
	<div class="col-12 col-md-6 mt-md-0 mt-1 px-2 text-right">
		<c:if test="${login.userId eq 'admin' }">
			<a href="/grw/empl/emplIns.do" class="btn btn-outline bg-dark border-grey-800 text-dark">추가</a>
		</c:if>
	</div>
</div>