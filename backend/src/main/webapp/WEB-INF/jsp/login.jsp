<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sytecso - Smartfield</title>
<link href="<c:url value="/css/estiloSytecso.css" />" 	rel="stylesheet">
<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/js/login/login.js"/>"></script>
<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
<script type="text/javascript">
	function getContextPath() {
		return "<c:out value="${pageContext.request.contextPath}" />";
	}
	URL = window.location.href;
	urlControl(URL, getContextPath());
</script>
<style>
#pantallaLogin {
	position: absolute;
	left: 50%;
	top: 50%;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

#pantallaLogin .divLogin {
	margin: 10px;
	padding: 10px;
	background: #fffdcd;
	width: 600px;
	text-align: center;
	background: rgba(242, 245, 246, 0.08);
	font-family: Arial;
	font-size: 11px;
	text-decoration: none;
	margin-top: 2px;
	margin-bottom: 2px;
	margin-left: 9px;
	text-align: center;
	border-image-slice: 1;
	color: #187980;
	border-radius: 19px;
	padding: 7px;
}

.bodyLogin {
	background: rgb(242, 245, 246);
	background: -moz-linear-gradient(left, #A8C4CC 0%, rgba(227, 234, 237, 1)
		37%, rgba(200, 215, 220, 1) 100%);
	background: -webkit-linear-gradient(left, #A8C4CC 0%, rgba(227, 234, 237, 1)
		37%, rgba(200, 215, 220, 1) 100%);
	background: linear-gradient(to right, #A8C4CC 0%, rgba(227, 234, 237, 1)
		37%, rgba(200, 215, 220, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f5f6',
		endColorstr='#c8d7dc', GradientType=1);
}

table {
	margin: auto;
	width: 85%;
}

fieldset {
	border: 1px solid rgb(216, 225, 231) 22%;
	width: 400px;
	margin: auto;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body onload='document.loginForm.username.focus();' class="bodyLogin">
<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    </div>
		<div id="pantallaLogin">
			<center>
				<div id="logoSytecso">
					<img src="<c:url value = "/img/logoSytecso.png"/>" width="30%">
				</div>
				<div id="logoSytecso">
					<img src="<c:url value = "/img/logoPrincialSytecso.png"/>" width="20%">
				</div>
			
			<div class="divLogin">
				<h4><spring:message    code="label.info" /></h4>

				<c:if test="${not empty error}">
				<div class="error">${error}</div>
			</c:if>
			<c:if test="${not empty msg}">
				<div class="msg">${msg}</div>
			</c:if>
			<form name='loginForm' action="<c:url value='/login'/>" method='POST'>
				<table>
					<tr>
						<td><strong><spring:message  code="label.userName"/></strong>
                </td>
						<td><input name='username' value='' class="loginInput">
						</td>
					</tr>
					<tr>
						<td><strong><spring:message    code="label.password" /></strong></td>
						<td><input type='password' name='password'
							class="loginInputPassword" /></td>
					</tr>
					<tr>
						<td colspan='2'>
						<spring:message code="label.submit" var="labelSubmit"></spring:message>
						<spring:message code="label.clean" var="labelClean"></spring:message>
						<input name="submit" type="submit"
							value="${labelSubmit}" />&nbsp;&nbsp; <input name="reset" type="reset"
							value="${labelClean}" /> &nbsp;&nbsp;</td>
					</tr>
				</table>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</div>
		</center>
	</div>
</body>
</html>