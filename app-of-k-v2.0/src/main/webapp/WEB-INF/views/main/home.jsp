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
			<%= form_tag({:controller =>'main', :action =>'login'}) do %>
				<div class="span12">
					<div style="width:100px; float:left;">
						メールアドレス
					</div>
					<%= text_field_tag :email %>
				</div>
				<div class="span12">
					<div style="width:100px; float:left;">
						パスワード
					</div>
					<%= password_field_tag :password %>
				</div>
				<div class="span12" style="margin-top: 10px" >
					<%= submit_tag value="登録する", :class=>"btn btn-primary"%>
				</div>
			<% end %>
			</div>
		</div>
		<div class="tab-pane" id="2">
			<%= form_for(@user_master) do |f| %>
			<% if @user_master.errors.any? %>
			<div class="alert alert-error">
				<h2><%= pluralize(@user_master.errors.count, "error") %> prohibited this user_master from being saved:</h2>
				<ul>
					<% @user_master.errors.full_messages.each do |msg| %>
					<li>
						<%= msg %>
					</li>
					<% end %>
				</ul>
			</div>
			<% end %>
			<div class="row">
				<div class="span12">
					<div style="width:100px; float:left;">
						ハンドルネーム
					</div>
					<%= f.text_field :name, :style=>"width:200px;" %>
				</div>
				<div class="span12">
					<div style="width:100px; float:left;">
						メールアドレス
					</div>
					<%= f.text_field :email, :style=>"width:200px;" %>
				</div>
				<div class="span12">
					<div style="width:100px; float:left;">
						パスワード
					</div>
					<%= f.password_field :password, :style=>"width:200px;" %>
				</div>
				<div class="span12">
					<div style="width:100px; float:left;">
						生年月日
					</div>
					<%= f.date_select :birthdate, {:start_year=>Time.now.year - 100, :end_year=>Time.now.year, :use_month_numbers=>true}, :style=>"width:70px;"%>
				</div>
				<div class="span12">
					<div style="width:100px; float:left;">
						性別
					</div>
					<%= f.radio_button :sex, 0 %>男性 <%= f.radio_button :sex, 1 %>女性
				</div>
				<div class="span12" style="margin-top: 10px" >
					<%= f.submit value="登録する", :class=>"btn btn-primary"%>
				</div>
			</div>
			<% end %>
		</div>
	</div>
</div>
</div> 
	
	</body>
</html>