<%@ page language="java"
         session="false"
         pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

$(function(){
		$("#receiver_image_icon").css("visibility","visible");
		$("#friend_input").css("visibility","visible");
		$("#loading").css("display","none");
		var friends = new Array();
		<c:forEach var="friend" items="${friends}" >
	    friends.push({
	      label: "${friend.name}",
	      value: "${friend.name}",
	      id: "${friend.id}",
	      image_path: "https://graph.facebook.com/${friend.id}/picture"
	    });
	    </c:forEach>
	    $("#friend_input").autocomplete({
	      source: friends,
	      minLength: 1,
	      select: function( event, ui ) {
	        $("#receiverId").val( ui.item.id );
	        $("#receiverName").val( ui.item.value );
	        $("#receiver_image_icon").attr("src", ui.item.image_path );
	        $("#friend_input").val( ui.item.label );
	        $("#send_submit").css("visibility","visible");
	        return false;
	      }
	    })
	    .data( "autocomplete" )._renderItem = function( ul, item ) {
	      if ( typeof item.nameOpt === "undefined" ) {
	        return $( "<li></li>" )
	        .data( "item.autocomplete", item )
	        .append( "<a>" + "<img src='" + item.image_path + "' width=30 /><span class='screen-name'>" + item.label + "</span></a>" )
	        .appendTo( ul );
	      } else {
	        return $( "<li></li>" )
	        .data( "item.autocomplete", item )
	        .append( "<a>" + "<img src='" + item.image_path + "' width=30 /><span class='screen-name'>" + item.nameOpt + "<br /><small>" + item.value + "</small></span></a>" )
	        .appendTo( ul );
	      }

	    };
	});
	$(function() {
	  $(".pic img").click(function(){
	    var title = $(this).attr("info");
	    var array = title.split(",");
	    var id = array[0];
	    var name = array[1];
	    var src = $(this).attr("src");

	    $("#receiverId").val( id );
	    $("#receiverName").val( name );
	    $("#receiver_image_icon").attr("src", src );
	    $("#friend_input").val( name );
	    $("#send_submit").css("visibility","visible");
	});
});
