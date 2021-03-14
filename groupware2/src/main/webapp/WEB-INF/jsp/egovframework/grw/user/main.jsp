<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core" %>


<div style="margin:5px;">
	<c:if test="${login == null }">
		<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/grw/user/UserLogin.do'">로그인</button>
		<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/grw/user/UserJoin.do'">회원가입</button>
	</c:if>
	<c:if test="${login != null }">
		<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/grw/user/UserLogout.do'">로그아웃</button>
		<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/grw/user/UserUpdate.do'">내 정보 수정</button>
		<button type="button" class="btn btn-sm btn-primary" onclick="location.href='/grw/user/UserDelete.do'">회원 탈퇴</button>
	</c:if>
</div>
 --%>