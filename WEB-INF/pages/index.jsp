﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="cp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	int port = request.getServerPort();
	String basePath = "";
	if (port == 80) {
		basePath = request.getScheme() + "://"
				+ request.getServerName() + path + "/";
	} else {
		basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + port + path + "/";
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>鑫的博客</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/cssReset.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/index.css"/>
</head>
<body>
		<!-- S= 页面的顶部 -->
		<jsp:include page="head.jsp" />
		<!-- E= 页面的顶部 -->
		<!--S= 页面主体-->
		<section>
			<!-- S= 导航栏-->
			<jsp:include page="nav.jsp" />
			<!-- E= 导航栏-->
			<!--S= 中部内容-->
			<section class="content">
				<!--S= 内容左边-->
				<section class="content_left">
						<div id="slide">
							<ul>
								<li><a href="120.27.100.77"><img src="<%=basePath%>image/1.jpg" alt=""></a></li>
								<li><a href="120.27.100.77"><img src="<%=basePath%>image/2.jpg" alt=""></a></li>
								<li><a href="120.27.100.77"><img src="<%=basePath%>image/3.jpg" alt=""></a></li>
								<li><a href="120.27.100.77"><img src="<%=basePath%>image/4.jpg" alt=""></a></li>
								<li><a href="120.27.100.77"><img src="<%=basePath%>image/5.jpg" alt=""></a></li>					
							</ul>
							<div id="btn">
								<span class='curr'><a href="#">1</a></span>
								<span ><a href="#">2</a></span>
								<span><a href="#">3</a></span>
								<span><a href="#">4</a></span>
								<span><a href="#">5</a></span>
							</div>
						</div>
					<!--日志列表-->
					<section class="act_list">
						<!--单个日志信息-->
						<c:forEach items="${pm.list}" var="act">
							<section class="act">
								<article class="act_left">
									<h3 class="act_title">  
										<a href="<%=basePath%>article/${act.id}.html">${act.title}</a>
									</h3>
									<div class="act_tag">
										标签：
										<c:forEach items="${act.tagsList}" var="tag">
											<span><a
												href="<%=basePath %>search/index.htm?key=${tag.tagName}">${tag.tagName}</a></span>
										</c:forEach>
									</div>
									<div class="act_info">
										发布：
										<fmt:formatDate value="${act.date}"
											pattern="yyyy-MM-dd HH:mm:ss" />
										分类：<a href="<%=basePath %>type/index.htm?id=${act.typeId}">${act.typeName}</a>
									</div>
								</article>
								<aside class="act_right">
									<div>
										<span class="act_read">${act.readCount}</span><span>阅</span>
									</div>
									<div>
										<span class="act_read">${act.commendCount}</span><span>荐</span>
									</div>
									<div>
										<span class="act_read">${act.commentCount}</span><span>评</span>
									</div>
								</aside>
							</section>
						</c:forEach>
					</section>

					<!--S=分页-->
					<div class="cut_page"><cp:CutPage url="index.htm" pm="${pm}"></cp:CutPage></div>
					<!--E=分页-->


				</section>
				<!--E= 内容左边-->

				<!--S= 内容右边-->
				<jsp:include page="right.jsp" />
				<!--E= 内容右边-->
			</section>
			<!--E= 中部内容-->
		</section>
		<!--E= 页面主体-->

		<!-- S= 页面的底部 -->
		<jsp:include page="foot.jsp" />
		<!-- E= 页面的底部 -->
	<script type="application/javascript" src="<%=basePath%>js/jquery-1.7.1.js"></script>
    <script type="application/javascript" src="<%=basePath%>js/common.js"></script>
    <script type="application/javascript" src="<%=basePath%>js/html5shiv.js"></script>
</body>
</html>