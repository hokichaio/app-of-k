<%@ page language="java"
         session="false"
         pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/spring-social/facebook/tags" prefix="facebook" %>
<!DOCTYPE html>
<html>
	<head>
		<title>ボボGAME!</title>
		<link type='text/css' href='<%= request.getContextPath() %>/resources/css/demo.css' rel='stylesheet' media='screen' />
		<link type='text/css' href='<%= request.getContextPath() %>/resources/css/basic.css' rel='stylesheet' media='screen' />
		<link type='text/css' href='<%= request.getContextPath() %>/resources/css/layout.css' rel='stylesheet' media='screen' />
		<link type='text/css' href='<%= request.getContextPath() %>/resources/css/bar.css' rel='stylesheet' media='screen' />
		<script language="javascript">AC_FL_RunContent = 0;</script>
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/js/jquery-1.7.min.js'></script>
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/js/jquery.simplemodal.js'></script>
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/js/basic.js'></script>
		<script src="<%= request.getContextPath() %>/resources/game/AC_RunActiveContent.js" language="javascript"></script>
		<script>
		$(function() {
			$(".meter > span").each(function() {
				$(this)
					.data("origWidth", $(this).width())
					.width(0)
					.animate({
						width: $(this).data("origWidth")
					}, 1200);
			});
		});
		</script>
		<script type="text/javascript">
			function finish(score){
				
				var dataString = 'score='+ score;  
				//alert (dataString);return false;  
				$.ajax({  
				  type: "POST",  
				  url: "./send-score",  
				  data: dataString,  
				}); 
				$('#basic-modal-content').modal();
				return false;  
			}
		</script>
	</head>
	<body>
	<div id="wrapper">
		<div style="float:left;">
			我的波波愛心：${user.score}
		</div>
		<div style="text-align:right"><a href="<c:url value="/signout" />">Sign Out</a></div>
			
			
			<c:if test="${heart<20}">
				<div class="meter red animate" >
					<span style="width: <c:out value="${heart}"/>%"><span style="text-align:center; color:white;">波波心情指數:<c:out value="${heart}"/></span></span>
				</div>
			</c:if>
			<c:if test="${heart>=20 && heart<60}">
				<div class="meter orange animate" >
					<span style="width: <c:out value="${heart}"/>%"><span style="text-align:center; color:white;">波波心情指數:<c:out value="${heart}"/></span></span>
				</div>
			</c:if>
			<c:if test="${heart>=60 && heart<100}">
				<div class="meter animate" >
					<span style="width: <c:out value="${heart}"/>%"><span style="text-align:center; color:white;">波波心情指數:<c:out value="${heart}"/></span></span>
				</div>
			</c:if>
			<c:if test="${heart>100}">
				<div class="meter animate" >
					<span style="width: 100%"><span style="text-align:center; color:white;">波波心情指數:<c:out value="${heart}"/></span></span>
				</div>
			</c:if>
		
		<div class="areaLeft">
			<h3>ランキング</h3>
			<ul>
			<c:forEach items="${ranking}" var="ranking">
				<li><img src="http://graph.facebook.com/<c:out value="${ranking.id}"/>/picture" align="middle"/>
				<br/><c:out value="${ranking.score}"/> Hearts!</li><br/>
			</c:forEach>
			</ul>
		</div>
		<div class="areaRight">
			<!-- saved from url=(0013)about:internet -->
			<script language="javascript">
				if (AC_FL_RunContent == 0) {
					alert("AC Failed!");
				} else {
					AC_FL_RunContent(
						'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0',
						'width', '450',
						'height', '350',
						'src', 'water',
						'quality', 'high',
						'pluginspage', 'http://www.macromedia.com/go/getflashplayer',
						'align', 'middle',
						'play', 'true',
						'loop', 'true',
						'scale', 'showall',
						'wmode', 'transparent',
						'devicefont', 'false',
						'id', 'water',
						'bgcolor', '#ffffff',
						'name', 'water',
						'menu', 'true',
						'allowFullScreen', 'false',
						'allowScriptAccess','always',
						'movie', 'http://hoki.syuon.com/flash/water',
						'salign', ''
						); //end AC code
				}
			</script>
		</div>
		<div id="footer">
		
			<div id='basic-modal'>
				<a href='#' class='basic'>Post On Your Wall!!</a>
			</div>
				
			<!-- modal content -->
			<div id="basic-modal-content">
				<h3>Share With Your Frineds</h3>
				<iframe id="iframe" width="100%" height="150" scrolling="no" frameborder="0" src="./post-start"></iframe>
				<p><a href='http://www.facebook.com/profile.php?id=100000090061241'>WHO THE HELL IS BOBO???</a></p>
			</div>
		</div>
	</div>
	<form action="./send-score" method="post" id="sends">
		<input type="hidden" name="score" id="score" value="" />
	</form>
	<form></form>
	</body>
</html>