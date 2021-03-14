<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<html lang="ko">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<!-- 		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
 -->	<title><tiles:getAsString name="title"/></title>
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="javascript" />
		
<!-- 		<link rel="stylesheet" href="/assets/css/main.css" />
 -->
 	</head>
	<body class="is-preload">

			<div class="collapse navbar-collapse" id="navbar-mobile">

				<ul class="navbar-nav">
					<li class="nav-item">
						<a href="#" class="navbar-nav-link sidebar-control sidebar-main-toggle d-none d-md-block">
							<i class="icon-paragraph-justify3"></i>
						</a>
					</li>
				</ul>

				<span class="ml-md-3 mr-md-auto"></span>

				<ul class="navbar-nav">
					<li class="nav-item dropdown dropdown-user">
						<a href="#" class="navbar-nav-link d-flex align-items-center dropdown-toggle" data-toggle="dropdown">
							<c:choose>
								<c:when test="${login != null }">
									<span>${login.userNm }</span>
								</c:when>
								<c:otherwise>
									<span>guest</span>
								</c:otherwise>
							</c:choose>							
						</a>
						<div class="dropdown-menu dropdown-menu-right my-2">
							<c:choose>
								<c:when test="${login != null }">
									<a href="/grw/user/UserLogout.do" class="dropdown-item logout"><i class="icon-switch2 mr-1"></i>로그아웃</a>
									<a href="/grw/user/userUpd.do" class="dropdown-item userupd"><i class="icon-cog3 mr-1"></i>내 정보 수정</a>
								</c:when>
								<c:otherwise>
									<a href="/grw/user/UserLogin.do" class="dropdown-item login"><i class="icon-switch2 mr-1"></i>로그인</a>
								</c:otherwise>
							</c:choose>
						</div>
					</li>
				</ul>
			</div>


		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
				
				<!-- Page header -->
				<header id="header">
							<a href="/grw/main/main.do" class="logo"><i class="icon-home2 mr-2"></i><strong>그룹웨어 메인</strong></a>
							
							<ul class="icons">
								<li class="nav-item dropdown dropdown-user">
									<a href="#" class="navbar-nav-link d-flex align-items-center dropdown-toggle" data-toggle="dropdown">
										<c:choose>
											<c:when test="${login != null }">
												<span>${login.userNm }</span>
											</c:when>
											<c:otherwise>
												<span>guest</span>
											</c:otherwise>
										</c:choose>							
									</a>
									<div class="dropdown-menu dropdown-menu-right my-2">
										<c:choose>
											<c:when test="${login != null }">
												<a href="/grw/user/UserLogout.do" class="dropdown-item logout"><i class="icon-switch2 mr-1"></i>로그아웃</a>
												<a href="/grw/user/userUpd.do" class="dropdown-item userupd"><i class="icon-cog3 mr-1"></i>내 정보 수정</a>
											</c:when>
											<c:otherwise>
												<a href="/grw/user/UserLogin.do" class="dropdown-item login"><i class="icon-switch2 mr-1"></i>로그인</a>
											</c:otherwise>
										</c:choose>
									</div>
								</li>
							</ul>
							
				</header>
				<!-- /page header -->

							<!-- Section -->
								<section>
									<div class="content px-0 py-2 bg-white">
										<tiles:insertAttribute name="body" />
									</div>
								</section>

						</div>
					</div>

				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<!-- <section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section> -->
	
							<section>
							
							</section>

							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>MENU</h2>
									</header>
									<ul>
										<li>
											<span class="opener"></i>게시판</span>
											<ul>
												<li class="nav-item"><a href="/grw/board/brdLst.do?brdId=00" class="nav-link ">공지 게시판</a></li>
												<li class="nav-item"><a href="/grw/board/brdLst.do?brdId=01" class="nav-link ">자유 게시판</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">주소록</span>
											<ul>
												<li class="nav-item"><a href="/grw/empl/emplLst.do" class="nav-link ">사원 목록</a></li>
											</ul>	
										</li>
										<li>
											<span class="opener">쪽지함</span>
											<ul>
												<li class="nav-item"><a href="/grw/msg/msgWrt.do" class="nav-link ">쪽지 쓰기</a></li>
												<li class="nav-item"><a href="/grw/msg/rcvMsgLst.do" class="nav-link ">받은 쪽지함</a></li>
												<li class="nav-item"><a href="/grw/msg/sndMsgLst.do" class="nav-link ">보낸 쪽지함</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">전자결재</span>
											<ul>
												<li class="nav-item"><a href="/grw/sign/signWrt.do" class="nav-link ">결재 작성</a></li>
													<li class="nav-item"><a href="/grw/sign/signIngLst.do" class="nav-link ">진행중인 결재</a></li>
							
													<c:choose>
														<c:when test="${login.userId eq 'ceo'}">
															<li class="nav-item"><a href="/grw/sign/signFnlReqLst.do" class="nav-link ">결재 요청 문서함</a></li>
														</c:when>
														<c:otherwise>
															<li class="nav-item"><a href="/grw/sign/signReqLst.do" class="nav-link ">결재 요청 문서함</a></li>
														</c:otherwise>
													</c:choose>
								
													<li class="nav-item"><a href="/grw/sign/signDoneLst.do" class="nav-link ">완료된 결재</a></li>
											</ul>
										</li>
										<!-- <li>
											<span class="opener">코드 관리</span>
											<ul>
												<li class="nav-item"><a href="/grw/code/groupLst.do" class="nav-link ">그룹 관리</a></li>
											</ul>
										</li> -->
										<!-- <li>
											<span class="opener">일정 관리</span>
											<ul>
												<li class="nav-item"><a href="/grw/schedule/scheduleLst.do" class="nav-link ">달력 보기</a></li>
												<li class="nav-item"><a href="/grw/schedule/scheduleWrt.do" class="nav-link ">일정 등록</a></li>
											</ul>
										</li> -->
										<li>
											<span class="opener">일정</span>
											<ul>
												<li class="nav-item"><a href="/grw/schedule/scheduleLst.do" class="nav-link ">달력 보기</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">마이페이지</span>
											<ul>
											
												<li class="nav-item"><a href="/grw/user/userUpd.do" class="nav-link ">개인 정보 수정</a></li>
												<c:if test="${login.userId eq 'admin' }">
												<li class="nav-item"><a href="/grw/part/partLst.do" class="nav-link ">부서 관리</a></li>
												<li class="nav-item"><a href="/grw/pos/posLst.do" class="nav-link ">직급 관리</a></li>		
												</c:if>
											</ul>
										</li>
									</ul>
								</nav>


							<!-- Section -->
								<section>
									<header class="major">
										<h2>Contact</h2>
									</header>
									<p>은영개발</p>
									<ul class="contact">
										<li class="icon solid fa-envelope"><a href="#">seosilverzero@gmail.com</a></li>
										<li class="icon solid fa-phone">010-8865-8453</li>
										<li class="icon solid fa-home">서울특별시 강남구</li>
									</ul>
								</section>

							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/browser.min.js"></script>
			<script src="/assets/js/breakpoints.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>

	</body>
	
</html>