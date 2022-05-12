<%@page import="entity.MainEntity"%>
<%@page import="entity.SearchEntity"%>
<%@page import="entity.MemberEntity"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/js/script.js"></script>
<link rel="stylesheet" href="/css/styles.css" />
<title>대현이 뺨때리기</title>
</head>
<body class="white-theme" onload="onloadtheme();">
	<div class="header">

		<div id="user" class="userhidden">
		
			<% 
			MemberEntity login = (MemberEntity)session.getAttribute("LOGIN");
			%>

			<%
			if (login == null) {
			%>

			<a href="/jsp/login.jsp">
				<div class="user-content">로그인</div>
			</a> <a href="/jsp/join.jsp">
				<div class="user-content">회원가입</div>
			</a>
			<%
			} else {
			%>
			<a href="/jsp/update.jsp?member_id=<%=login.getMEMBER_ID()%>">
				<div class="user-content">회원수정</div>
			</a> <a onclick="location.href='/LOGOUT'";>
				<div class="user-content">로그아웃</div>
			</a>
			<%
			}
			%>
			<div id="themeinfo" class="user-content" onclick="test()">디자인 :
				밝은테마</div>

		</div>



		<div class="header__left">
			<a href="/jsp/main.jsp"> <img
				src="https://www.gstatic.com/youtube/img/branding/favicon/favicon_144x144.png"
				alt="" />
			</a>
		</div>

		<div class="header__search">
			<form action="/Search" method="Get">
				<input type="text" name="title" id="title" placeholder="검색" />
				<button onclick="SearchCheck();">
					<i class="material-icons">search</i>
				</button>
			</form>
		</div>

		<div class="header__icons">
			<i class="material-icons">videocam</i> <i class="material-icons"
				onclick="test()">apps</i> <i class="material-icons">notifications</i>
			<i class="material-icons display-this" onclick="test2()">account_circle</i>
		</div>
	</div>

	<div class="mainBody">
		<div class="videos">
			<div class="videos__container">
				<%
				List<MainEntity> list = new ArrayList<MainEntity>();
				list = (List<MainEntity>) request.getAttribute("Main");
				if (list != null) {
					for (int i = 0; i < list.size(); i++) {
						MainEntity entity = list.get(i);
				%>
				<div class="video">
					<div class="video__thumbnail">
						<img src="/image/Banner1.jpg" alt="" />
					</div>
					<div class="video__details">
						<div class="author">
							<img src="/image/id/rkdeown10.jpg" alt="" />
						</div>
						<div class="title">
							<h3><%=entity.getVIDEO_NAME()%></h3>
							<a href="https://daehyuh318.github.io/chanal/"><%=entity.getMEMBER_NAME()%></a>
							<span>조회수 <%=entity.getVIDEO_VIEWS()%>회 • <%=entity.getVIDEO_DATE()%>
								전
							</span>
						</div>
					</div>
				</div>

				<%
				}
				}else{%>
				<script type="text/javascript">
					location.href = '../';
				</script>
				<%	
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>

