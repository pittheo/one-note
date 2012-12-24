<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="../spod-theme/head.jsp" />
	
	<script type="text/javascript">

	
$(document).ready(function() {


	$('#loading').ajaxStart(function() {
		$(this).addClass('loading');
		$(this).text('Loading...');
	});

	$('#loading').ajaxStop(function() {
		$(this).removeClass('loading');
		$(this).text('');
	});
	
	$("#betForm").submit(function() {
		$(this).append("<input type='hidden' id='url1Field' name='photoUrls' value='http://www.url1.com'/>");
		$(this).append("<input type='hidden' id='url2Field' name='photoUrls' value='http://www.url2.com'/>");
		$(this).append("<input type='hidden' id='url3Field' name='photoUrls' value='http://www.url3.com'/>");
		// Will it also include the hidden fields??
		//var bet = $(this).serializeObject();
		//alert("sdfs");
		//$.postJSON("bets/save", bet, function(data) {
		//	showPreviewPopup(data);
		//});
		return true;
	});
});

</script>
</head>
<body>

	<jsp:include page="../spod-theme/header.jsp" />
    
    <div class="container">
        <div class="row">
            
            <section id="contact" class="span12">
                

				<div class="span12 row">
				<c:if test="${not empty registration_success}">
			      	<p>
				        <h4>
				          <spring:message code="congratulations" />
				        </h4>
				        <spring:message code="registration_success_1" />
				         <b><c:out value="${email_address}" /></b>
				        <spring:message code="registration_success_2" />
			      	</p>
		    	</c:if>
		    	</div>
		    	
                <div class="row">
                    <div class="span3">
                        <div class="row">
                            <div class="page-sub-title span3">
                                <h3>User Picture</h3>
                            </div>
                        </div>
                        
                        <div class="content-box box">
                            <img src="http://placehold.it/260x200/4D99E0/ffffff.png&amp;text=image1" alt="It's an image" title="">
                        </div>
                        <button style="width: 100%; margin-top: 5px; text-align: center; display: block;" class="btn btn-success" type="submit">Upload</button>
                    </div><!--/span3 box-->
                    
                    <div class="span9">
                        <div class="row">
                            <div class="page-sub-title span9">
                                <h3>Create a new user</h3>
                            </div>
                        </div>
                        <form:form id="userRegistrationForm" class="form-horizontal" modelAttribute="userAccount" action="useraccounts" method="POST">
                        <div class="control-group">
				            <label class="control-label" for="username">Username</label>
				            <div class="controls">
				              <input type="text" class="input-xlarge" name="username" id="username">
				              <p class="help-block">In addition to freeform text, any HTML5 text-based input appears like so.</p>
				            </div>
				        </div>
                        <div class="control-group">
				            <label class="control-label" for="email">Email</label>
				            <div class="controls">
				              <input type="text" id="email" name="email" placeholder="e.g. john.doe@gmail.com" class="input-xlarge">
				            </div>
				        </div>
				        <div class="control-group">
				            <label class="control-label" for="emailRetype">Reenter your email</label>
				            <div class="controls">
				              <input type="text" id="emailRetype" name="emailRetype" placeholder="Same as above. Just to make sure..." class="input-xlarge">
				            </div>
				        </div>
                        <div class="control-group">
				            <label class="control-label" for="password">Password</label>
				            <div class="controls">
				              <input type="password" id="password" name="password" class="input-xlarge">
				            </div>
				        </div>
                        <button id="signupBTN" class="btn btn-large btn-success pull-right" type="submit">Sign Up</button>
                        </form:form>
                    </div><!--/span6 box-->

                </div><!-- /row -->
               
            </section><!-- /contact -->
            
        </div><!-- /row -->
    </div><!-- /container -->

    
   	<jsp:include page="../spod-theme/footer.jsp" /> 


</body></html>