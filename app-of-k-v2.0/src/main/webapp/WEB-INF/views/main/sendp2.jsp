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
				
				<c:forEach var="payer" items="${sendForm.payList}" >
					<img id="sponsorImgS" src="https://graph.facebook.com/${payer.id}/picture" />
				</c:forEach>
				
				<div id="gift_detail">
					<img src="./resources/img/gift/${sendForm.giftId}_main.jpg" />
				</div>
				<form:form class="form-horizontal" modelAttribute="sendForm" name="sendForm" action="./sendp3" method="post">
				    <fieldset>
					    <legend>Pay list</legend>
					    
					    <h2>Remain: <img src="./resources/img/com/yen.gif" />${sendForm.remainingBill}</h2>
					    <div class="progress progress-striped active">
							<div class="bar" style="width: ${(sendForm.gift.price - sendForm.remainingBill) / sendForm.gift.price * 100}%;"></div>
						</div>
					    <table class="table table-striped">
						    <c:forEach var="payer" items="${sendForm.payList}" varStatus="idx">
								<tr>						    
						    		<td width="150"><img src="https://graph.facebook.com/${payer.id}/picture" />${payer.name}</td>
						    		<td width="120">
							    		<div class="progress progress-striped active">
											<div class="bar" style="width: ${payer.payment / sendForm.gift.price * 100}%;">￥${payer.payment}</div>
										</div>
						    		</td>
						    		<td width="150">
										<c:if test="${userFbId == payer.id}">
											<input type="number" name="tempPayment" class="input-small" /><button type="submit" name="pay" class="btn btn-primary">Pay</button>										
										</c:if>						    		
						    		</td>
						    		<td></td>
						    	</tr>
						    	<form:input path="payList[${idx.index}].id" type="hidden" />
						    	<form:input path="payList[${idx.index}].name" type="hidden" />
						    	<form:input path="payList[${idx.index}].payment" type="hidden" />
							</c:forEach>
						</table>
					    
					    <form:input path="giftId" type="hidden" />
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
</body>
</html>