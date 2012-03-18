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
			<div class="span12">
				<h1>Surprise!</h1>
				<h4><img src="https://graph.facebook.com/${sendForm.senderMainId}/picture" /> ${sendForm.senderMainName} <i class="icon-gift"></i>-> ${sendForm.receiverName} <img src="https://graph.facebook.com/${sendForm.receiverId}/picture" /></h4>
				<div id="gift_detail">
					<img src="./resources/img/gift/${sendForm.giftId}_main.jpg" />
				</div>
				<form:form class="form-horizontal" modelAttribute="sendForm" name="sendForm" action="./sendp1" method="post">
				    <fieldset>
					    <legend>Fill the rest info</legend>
					    <div class="control-group">
					    	<label class="control-label" for="address">Receiver Address</label>
							<div class="controls">
								<label class="checkbox">
									<form:checkbox path="noAddress" id="noAddress" /> No address <i class="icon-info-sign"></i>
								</label>
								<form:input class="input-xlarge" path="receiverAddress" placeholder="Address with post code…" id="receiverAddress"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="messageToReceiver">Message to Receiver</label>
							<div class="controls">
								<textarea class="input-xlarge" rows="5" placeholder="Write a message to your receiver..."></textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="friend_input">Find Sponsor</label>
							<div class="controls">
								<label class="checkbox">
									<form:checkbox path="noSponsor" id="noSponsor" /> No sponsor <i class="icon-info-sign"></i>
								</label>
								<input id="friend_input" type="text" class="input-xlarge" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true" placeholder="Send your surprise together with your frineds..." />
							</div>
					    </div>
						<div class="control-group">
							<label class="control-label" >Message to Sponsor</label>
							<div class="controls">
								<textarea id="messageToSponsor" class="input-xlarge" rows="5" placeholder="Write a message to your sponsor..."></textarea>
							</div>
						</div>
					    <form:input id="receiverId" path="receiverId" type="hidden" />
					    <form:input id="receiverName" path="receiverName" type="hidden" />
					    <form:input id="senderMainId" path="senderMainId" type="hidden" />
					    <form:input id="senderMainName" path="senderMainName" type="hidden" />
					    <div class="form-actions">
				            <button type="submit" class="btn">Cancel</button>
				            <button type="submit" class="btn btn-primary">Next</button>
				        </div>
				    </fieldset>
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
  $(function() {
	  $("#noAddress").click(function() {
			if($("#noAddress").is(':checked')) {
				$("#receiverAddress").attr("disabled", "disabled" );
			} else {
				$("#receiverAddress").removeAttr("disabled");
			}
	  });
	  $("#noSponsor").click(function() {
			if($(noSponsor).is(':checked')) {
				$("#friend_input").attr("disabled", "disabled" );
				$("#messageToSponsor").attr("disabled", "disabled" );
			} else {
				$("#friend_input").removeAttr("disabled");
				$("#messageToSponsor").removeAttr("disabled");
			}
	  });
  });		  
</script>
</body>
</html>