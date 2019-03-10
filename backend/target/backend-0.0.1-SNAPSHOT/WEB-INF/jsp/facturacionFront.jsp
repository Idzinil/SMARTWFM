<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SMARTBILLING - Sytecso System</title>
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
</head>
<body>
<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    </div>
	<jsp:include page="menu3.jsp" />
	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> <spring:message  code="label.tittleFact"/>
		</div>
	</div>
	<div id="tableroSmartBilling">
		<div id="ventanaBienvenidaSmartBilling">
			<div class="contenido">
				<h2>
					<img src="${pageContext.request.contextPath}/img/icono_facturacion.png"> <spring:message  code="label.FactManFact"/>
				</h2>
				<ul>
					<li><a href="${pageContext.request.contextPath}/billInicio"><spring:message  code="label.FactFactCta"/> </a></li>
					
					<li><a href="${pageContext.request.contextPath}/invoicing"><spring:message  code="label.FactlytDocFisc"/></a>
					</li>
					<li><a
						href="${pageContext.request.contextPath}/billPeriodoFactura"><spring:message  code="label.FactVerFactPeriod"/></a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>