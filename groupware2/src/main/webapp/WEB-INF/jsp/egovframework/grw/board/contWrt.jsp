<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"				prefix="c" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">게시글 작성</h6>
	</div>
	<div class="card-body px-2 py-2">

		<form id="frmWrt" name="frmWrt" method="post" enctype="multipart/form-data">
		<input type="hidden" name="brdId" value="${param.brdId }" />
		<input type="hidden" name="userId" value="${login.userId }" />
		
		<input type="hidden" name="fileUrl" value="${param.fileUrl }" />
		
 
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">제목<strong class="text-danger pl-1">*</strong></label> 
				<input type="text" id="title" name="title" maxlength="120" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>

			
<!-- 			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">첨부파일</label><strong class="text-danger pl-1">*</strong> 
				<input type="file" name="fileUrl" maxlength="120" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" multiple/>
			</div>
 -->

			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">첨부파일</label>
					<div class = "uploadDiv">
						<input type = "file" name = 'uploadFile' multiple>
					</div>
					
					<div class = 'uploadResult'>
						<ul>
						
						</ul>
					</div>
			</div>
			
			
			<div class="form-group mb-0">
				<label class="form-label-sm mb-0">내용<strong class="text-danger pl-1">*</strong></label> 
				<textarea name="contents" class="form-control form-control-sm" rows="5"></textarea>
			</div>
			

		</form>
		
	</div>
</div>

<row>
	<div class="d-flex justify-content-between align-items-center">
		<a href="/grw/board/brdLst.do?brdId=${param.brdId}" class="btn btn-outline bg-danger border-grey-800 text-dark">취소</a>
		<button type="button" name="ins" class="btn btn-dark border-grey-800">저장</button>
	</div>
</row>
