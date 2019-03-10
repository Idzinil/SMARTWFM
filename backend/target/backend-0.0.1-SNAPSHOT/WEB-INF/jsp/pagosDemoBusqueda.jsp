<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title>SMARTBILLING - Sytecso System</title>
<link rel="stylesheet" type="text/css"
	href="/SmartBilling/css/estiloSmartBilling.css">
</head>
<body>
	<jsp:include page="menu5.jsp" />
	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="/SmartBilling/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> Pagos
		</div>
	</div>
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
			<div class="contenido">
				<jsp:include page="filtroBuscaCliente.jsp" />
				<jsp:include page="pagosListadoCuentas.jsp" />
			</div>
		</div>
	</div>
	<jsp:include page="divRegresarPrincipal.jsp" />
</body>
</html>
