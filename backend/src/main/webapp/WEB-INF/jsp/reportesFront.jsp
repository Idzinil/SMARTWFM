<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
	<head>
		<title>
       		SMARTBILLING - Sytecso System
    	</title>
    	



		  <script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
	<link href="<c:url value="/css/estiloSmartBilling.css" />" 	rel="stylesheet">
	<link href="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.css" />" rel="stylesheet">
	
	<script src="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.js"/>"></script>
	<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
	<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>

	</head>
	<body>
	<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
		<jsp:include page="menu6.jsp" /> 
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> <spring:message  code="label.tittleReport"/>
		    </div>
		</div>
		<div id="tableroSmartBilling">
	    	<div id="ventanaSmartBilling500">	
	        	<div class="contenido">
				<h2>
					<img src="${pageContext.request.contextPath}/img/icono_facturacion.png"> <spring:message  code="label.tittleReport"/>
				</h2>
				<ul>
					<li><a href="${pageContext.request.contextPath}/filtrosGlobal"><spring:message  code="label.ReportesGlobal"/></a></li>
					<li><a href="${pageContext.request.contextPath}/filtrosCuenta"><spring:message  code="label.ReportesCta"/></a></li>
				</ul>
			</div>
			</div>
		</div>
	<jsp:include page="divRegresarPrincipal.jsp" />
</body>
</html>
