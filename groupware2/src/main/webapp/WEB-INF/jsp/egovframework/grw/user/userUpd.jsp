<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"		prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"	prefix="fn" %>

<div class="card border-grey-300 my-0 mb-1">
	<div class="card-header bg-light header-elements-inline pl-2 py-2">
		<h6 class="card-title font-weight-bold font-size-sm">개인 정보 수정</h6>
	</div>
	<div class="card-body px-2 py-2">

		<form id="frmUpd" name="frmUpd" method="post" >
			<input type="hidden" name="imgUrl" value="${login.imgUrl}" />
			<input type="hidden" name="imgOriName" value="${login.imgOriName}" /> 
			<input type="hidden" name="imgName" value="${login.imgName}" /> 
			
			<div class="form-group mb-2">
				<label class="form-label-sm font-weight-bolder mb-0">아이디<strong class="text-danger pl-1">*</strong></label> 
				<input type="text" name="userId" maxlength="120" value="${login.userId}" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" readonly="readonly" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm font-weight-bolder mb-0">비밀번호<strong class="text-danger pl-1">*</strong></label> 
				<input type="password" name="userPw" placeholder="비밀번호" maxlength="50" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm font-weight-bolder mb-0">이름<strong class="text-danger pl-1">*</strong></label> 
				<input type="text" name="userNm" maxlength="120" value="${login.userNm}" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm font-weight-bolder mb-0">생년월일</label> 
				<input type="text" name="birthdate" placeholder="'/' 포함하여 입력" maxlength="50" value="${login.birthdate}" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm font-weight-bolder mb-0">성별</label> 
				<div>
					<input type="radio" name="gender" value="M"> 남
					<input type="radio" name="gender" value="F"> 여
				</div>
			</div>			
			
			<div class="form-group mb-2">
				<label class="form-label-sm font-weight-bolder mb-0">휴대전화</label> 
				<input type="text" name="phone" placeholder="'-' 포함하여 입력" maxlength="40" value="${login.phone}" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>
			
			<div class="form-group mb-2">
				<label class="form-label-sm font-weight-bolder mb-0">이메일</label> 
				<input type="text" name="email" placeholder="'@', '.' 포함하여 입력" maxlength="40" value="${login.email}" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
			</div>

			<div class="form-group mb-2">
				<label class="form-label-sm mb-0">현재 사진</label>
				<div class="card mb-0" style="min-height: 30px;">
					<div class="card-body px-2 py-2">
						<c:if test="${login.imgUrl != null}">
							<img width="100px" src="/grw/getImage.do?userId=${login.userId}" />
							<a href="/grw/imgDelete.do?userId=${login.userId }" class="btn btn sm btn-outline bg-danger border-grey-800 text-dark">삭제</a>
						</c:if>
					</div>
				</div>	
			</div>
			
			<div class="form-group mb-2">
				<label for="gdsImg" class="form-label-sm font-weight-bolder mb-0">변경할 사진 첨부</label>
				<input type="file" id="gdsImg" name="imgUrl" value="${login.imgOriName}" class="form-control form-control-sm maxlength-badge-position" autocomplete="off" />
				<div class="select_img"><img src=""/></div>
				<script>
					$("#gdsImg").change(function(){
						if(this.files && this.files[0]) {
		   			 		var reader = new FileReader;
		  			  		reader.onload = function(data) {
		   			  			$(".select_img img").attr("src", data.target.result).width(100);        
		   			 		}
		  			  		reader.readAsDataURL(this.files[0]);
		 			  	}
					});
				</script>
			</div>
			
		</form>
	</div>
	
</div>

<row>
	<div class="d-flex justify-content-between align-items-center">
		<a href="/grw/empl/emplLst.do" class="btn btn-outline bg-danger border-grey-800 text-dark">취소</a>
		<button type="button" name="upd" class="btn btn-dark border-grey-800">저장</button>
	</div>
</row>