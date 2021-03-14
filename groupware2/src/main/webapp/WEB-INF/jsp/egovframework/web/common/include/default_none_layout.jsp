<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<title></title>
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="javascript" />
	</head>
	<body>
		<tiles:insertAttribute name="body" />
	</body>
</html>