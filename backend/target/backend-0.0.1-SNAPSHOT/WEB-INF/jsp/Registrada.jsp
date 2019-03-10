<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Sytecso - Smartfield</title>
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSytecso.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/secciones.css"/>">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
		<script src="<c:url value="/js/Sytecso/sytecso.js"/>"></script>
		<script src="<c:url value="/js/principal/principal.js"/>"></script>
		<script type="text/javascript">
		function getContextPath() {
			return "<c:out value="${pageContext.request.contextPath}" />";	
		}
		$(document).ready(function(){
			principal(getContextPath())
		});
			
		</script>
		
	</head>
	<body>
	<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    </div>
		<jsp:include page="menu2.jsp" /> 
	    <div id="barraMenuSytecso">
	    </div>
	    <div id="tituloyBarraBusqueda">
	        <div id="tituloTablero">
	            <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;">    <spring:message    code="label.tittleCuentas" />
	        </div>
	    </div>
	    <div id="tableroSytecso">
	        <div id="ventanaBienvenidaSytecso">
	            <div class="contenido">
					<table>
						<tr>
							<td><spring:message    code="label.CtaRegistradaInfo" /><b> ${ModelCta} </b> <spring:message    code="label.CtaRegistradaInfo2" /></td>
							<td><a href="${pageContext.request.contextPath}/detalleCuenta?cuenta=${ModelCta}" style="cursor: pointer"> <spring:message    code="label.CtaRegistradaDetalle" /></a></td>
							<td><a href="${pageContext.request.contextPath}/principal"> <spring:message    code="label.NavPrin" /></a><td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</body>
</html>