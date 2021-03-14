<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"		prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"	prefix="fn" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">편집</h6>
	</div>
	<div class="card-body px-2 py-2">

		<form id="frmUpd" name="frmUpd" method="post">
			<input type="hidden" name="contentId" value="${contUpd.contentId}" /> 
			
			<div class="form-group mb-2">
				<label class="form-label-sm font-weight-bolder mb-0">제목<strong class="text-danger pl-1">*</strong></label> 
				<input type="text" name="title" maxlength="120" value="${contUpd.title}" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" placeholder="제목" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">첨부파일</label> 
				<div id="fileDiv" class="card mb-0" style="min-height: 30px;">
					<input type="hidden" name="fileUrl" value="${contUpd.fileUrl}" />
					<input type="hidden" name="fileName" value="${contUpd.fileName}" />
					<input type="hidden" name="fileOriName" value="${contUpd.fileOriName}" />

					<div class="card-body px-2 py-2">

						<%-- <c:choose>
							<c:when test="${contUpd.fileUrl != null}">
						
								<a href="/grw/fileInfo.do?contentId=${contUpd.contentId}" ></a>
 								<a href="/grw/download.do?contentId=${contUpd.contentId}" >${contUpd.fileOriName}</a>
 								<a href="#this" name="filedel" class="btn btn-outline-secondary btn-sm border-grey-800 text-dark btn-right">X</a>		
						
							</c:when>
							<c:otherwise>
								<input type="file" name="fileUrl" maxlength="120" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
							</c:otherwise>
						</c:choose> --%>
						
	                	<c:forEach items="${fileSel }" var="file">
	                		<div class="card-body px-2 py-2">
	                			<input type="hidden" name="fileId" value="${file.fileId}" />
								<a href="/grw/download.do?fileId=${file.fileId}" >${file.origFileName}</a>
 								<a href="#this" name="filedel2" class="btn btn-outline-secondary btn-sm border-grey-800 text-dark btn-right">X</a>		
							</div>
						</c:forEach>							
					</div>
				<!-- 		<input type="file" name="fileUrl" maxlength="120" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" multiple/>
				 -->
							<input type="file" name="uploadFile" maxlength="120" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" multiple/>
				
					<!-- <div class="card-body px-2 py-2">
						<div class="uplaodResult">
							<ul>
							</ul>
						</div>
					</div> -->
				
				</div>	
			</div>

			<div class="form-group mb-0">
				<label class="form-label-sm font-weight-bolder mb-0">내용<strong class="text-danger pl-1">*</strong></label> 
				<textarea name="contents" class="form-control form-control-sm" rows="5">${contUpd.contents}</textarea>
			</div>

		</form>
		
	</div>
</div>

<row>
	<div class="d-flex justify-content-between align-items-center">
		<a href="/grw/board/contSel.do?contentId=${param.contentId}" class="btn btn-outline bg-danger border-grey-800 text-dark">취소</a>
		<button type="button" name="upd" class="btn btn-dark border-grey-800">저장</button>
	</div>
</row>