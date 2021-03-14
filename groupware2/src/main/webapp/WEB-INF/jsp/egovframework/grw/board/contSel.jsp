<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"		prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"	prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">게시글 조회</h6>
		<label class="form-label-sm mb-0 text-right">조회수 ${contSel.hits }</label>  
	</div>
	
	<div class="card-body px-2 py-2">

		<form id="frmSel" name="frmSel" enctype="multipart/form-data">
			<input type="hidden" name="brdId" value="${contSel.brdId }" />
			<input type="hidden" name="contentId" value="${contSel.contentId}" />
			<input type="hidden" name="userId" value="${contSel.userId}" />
			<input type="hidden" name="fileUrl" value="${contSel.fileUrl}" />
		</form>

		<fieldset disabled="disabled">	
		
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">제목</label> 
				<input type="text" value="${contSel.title}" class="form-control form-control-sm text-dark" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">작성자</label> 
				<input type="text" value="${contSel.username}" class="form-control form-control-sm text-dark" />
			</div>
			
			<%-- <div class="form-group mb-2">
				<label class="form-label-sm mb-0">첨부파일</label> 
				<div class="card mb-0" style="min-height: 30px;">
					<div class="card-body px-2 py-2">
						<a href="/grw/download.do?contentId=${contSel.contentId}" >${contSel.fileOriName}</a>
					</div>
				</div>	
			</div> --%>
	
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">첨부파일</label> 
				<div class="card mb-0" style="min-height: 30px;">
	                <c:forEach items="${fileSel }" var="file">
				
						<div class="card-body px-2 py-2">
							<input type="hidden" name="fileId" value="${file.fileId}" />
							<a href="/grw/download.do?fileId=${file.fileId}" >${file.origFileName}</a>
						</div>
						
					</c:forEach>
					
				</div>	
			</div>
	
			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">내용</label> 
				<div class="card mb-0" style="min-height: 150px;">
					<div class="card-body px-2 py-2">
						${contSel.contents}
					</div>
				</div>	
			</div>
	
			<div class="form-row mb-0">
	           	<div class="form-group col-6 col-md-6 mb-0">
					<label class="form-label-sm mb-0">수정일자</label>
					<input type="text" value="${fn:substring(contSel.modDate,0,16)}" class="form-control form-control-sm text-dark" />
				</div>

	           	<div class="form-group col-6 col-md-6 mb-0">
					<label class="form-label-sm mb-0">작성일자</label>
					<input type="text" value="${fn:substring(contSel.regDate,0,16)}" class="form-control form-control-sm text-dark" />
				</div>
			</div>	
	
		</fieldset>
	</div>


	<div class="card-body px-2 py-2">
		<form id="frm">
			<input type="hidden" id="contentId" name="contentId" value="${contSel.contentId }" >
			<input type="hidden" name="userId" value="${login.userId }" />
					
			<table class="table table-bordered table-hover table-xs">
	            <colgroup>
	                <col width="15%">
	                <col width="85%">
	            </colgroup>
	
	            <tbody>
	                <tr>
	                    <th>댓글</th>
	                    <td>
	                        ${fn:length(comment) }
	                    </td>
	                </tr>
	                
	                <c:if test="${fn:length(comment)>0 }">
	                    <c:forEach items="${comment }" var="com">
	                        <tr>
	                            <td style="background:#f7f7f7;color:#3b3a3a;" >
	                                ${com.username }
	                                <p style="font-size: 8px;" >${fn:substring(com.modDate,0,19)}</p>
	                            </td>
	                            <td>
	                                <input type="hidden" value="${com.comId }" id="comId" name="comId">

	                                <div id="com_Div">
	                                	<input type="hidden" value ="${com.comments}" id="com_Con" name="com_Con">${com.comments }
	                                </div>
	                                <c:if test="${com.userId eq login.userId}">
		                                <div align="right">
		                                    <a href="#this" name="com_Del" class="btn">삭제</a>
		                                    <a href="#this" name="com_Mod" class="btn">수정</a>
		                                </div>
		                            </c:if>                            
	                            </td>
	                        </tr>
	                    </c:forEach>
	                </c:if>
	                
	                <c:if test="${login != null}">
		                <tr>
		                    <td colspan="2">
		                        <div class="row">
		 							<div class="col-sm-10">
			                          	<textarea name="comments" class="form-control form-control-sm" rows="5" placeholder="댓글을 입력해 주세요"></textarea>
			                        </div>
			                        <div class="col-sm-2">
			                         	<p align="right" class="media-body pb-3 mb-0 small lh-125" ><a href="#this" id="com_Wrt" name="com_Wrt" class="btn">등록</a></p>
		                        	</div>
		                        </div>
		                    </td>
		                </tr>
		            </c:if>
	            </tbody>
	        </table>
			
	    </form>
    </div>


</div>

<div class="row">
	<div class="col-12 px-2 text-right">
		<a href="/grw/board/brdLst.do?brdId=${contSel.brdId}" class="btn btn-outline bg-dark border-grey-800 text-dark">목록</a>
			<c:choose>
				<c:when test="${contSel.userId eq login.userId}">
					<a href="/grw/board/contUpd.do?contentId=${contSel.contentId}" class="btn btn-outline bg-dark border-grey-800 text-dark">편집</a>
					<button type="button" name="del" class="btn btn-danger border-danger-800">삭제</button>
				</c:when>
			</c:choose>
	</div>
</div>
