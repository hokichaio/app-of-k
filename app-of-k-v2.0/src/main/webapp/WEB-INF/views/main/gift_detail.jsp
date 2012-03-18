<%@ page language="java"
         session="false"
         pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="app.of.k.social.SecurityContext" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../com/meta.jsp"%>	
</head>
<body>
	<%@ include file="../com/header.jsp"%>	
	<div class="container">
		<div class="row">
			<div class="span2">
				<%@ include file="../com/search_form.jsp"%>	
			</div>
			<div class="span10">
				<div id="gift_detail">
					<h2>${gift.name}</h2>
					<h4><img src="./resources/img/com/yen.gif" /> ${gift.price}</h4>
					<img src="./resources/img/gift/${gift.id}_main.jpg" />
					<p>${gift.description}</p>
					
				</div>
				<form:form modelAttribute="sendForm" name="sendForm" action="./sendp1" method="post">
				    <legend>Choose a friend</legend>
				    <img id="loading" src="<%= request.getContextPath() %>/resources/img/com/loading.gif" width="25" height="25" />
				    <img id="receiver_image_icon" style="visibility:hidden;" src="<%= request.getContextPath() %>/resources/img/com/no_profile_pic.gif" width="50" height="50" /> 
				    <input id="friend_input" style="visibility:hidden;" type="text" class="ui-autocomplete-input" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true" />
				    <span id="sign_in_msg" style="display:none;" >Please sign in</span>
				    <form:input id="receiverId" path="receiverId" type="hidden" />
				    <form:input id="receiverName" path="receiverName" type="hidden" />
				    <form:input id="senderMainId" path="senderMainId" type="hidden" />
				    <form:input id="senderMainName" path="senderMainName" type="hidden" />
				    <form:input path="giftId" type="hidden" value="${gift.id}"/>
				    <input class="btn btn-primary" id="send_submit" name="commit" style="visibility:hidden;" type="submit" value=" Next " />
				</form:form>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
  $(function() {
	  if(<%= SecurityContext.userSignedIn() %>) {
		  $.ajax({
			  type: "GET",
			  url: "./friends/facebook",
			  dataType: "script"
			});
	  } else {
		  $("#sign_in_msg").css("display","run-in");
		  $("#friend_input").css("display","none");
		  $("#loading").css("display","none");
	  }
  });
</script>
</body>
</html>