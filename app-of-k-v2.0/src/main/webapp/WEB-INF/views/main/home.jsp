<%@ page language="java"
         session="false"
         pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/spring-social/facebook/tags" prefix="facebook" %>
<!DOCTYPE html>
<html>
	<head>
		<title>サプライズ！</title>
		<link type='text/css' href='<%= request.getContextPath() %>/resources/css/demo.css' rel='stylesheet' />
		<link type='text/css' href='<%= request.getContextPath() %>/resources/css/basic.css' rel='stylesheet' />
		<link type='text/css' href='<%= request.getContextPath() %>/resources/css/bar.css' rel='stylesheet' />
		<link type='text/css' href='<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css' rel='stylesheet' />
		<link type='text/css' href='<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap-reponsive.min.css' rel='stylesheet' />
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/js/jquery-1.7.min.js'></script>
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/js/jquery.simplemodal.js'></script>
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js'></script>
	</head>
	<body>
	<%@ include file="../com/header.jsp"%>	
	<div class="container">
	<h1>Welcome to nonstop</h1>
	<ul class="nav nav-tabs">
		<li class="active">
			<a href="#1" data-toggle="tab">ログイン</a>
		</li>
		<li>
			<a href="#2" data-toggle="tab">新規登録</a>
		</li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane active" id="1">
			<div class="row">
				<div class="span12">
					<div style="width:100px; float:left;">
						メールアドレス
					</div>
				</div>
				<div class="span12">
					<div style="width:100px; float:left;">
						パスワード
					</div>
				</div>
				<div class="span12" style="margin-top: 10px" >
				</div>
			</div>
		</div>
		<div class="tab-pane" id="2">
			<div class="row">
				<div class="span12">
					<div style="width:100px; float:left;">
						ハンドルネーム
					</div>
				</div>
				<div class="span12">
					<div style="width:100px; float:left;">
						メールアドレス
					</div>
				</div>
				<div class="span12">
					<div style="width:100px; float:left;">
						パスワード
					</div>
				</div>
				<div class="span12">
					<div style="width:100px; float:left;">
						生年月日
					</div>
				</div>
				<div class="span12">
					<div style="width:100px; float:left;">
						性別
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div> 
	
	</body>
</html>