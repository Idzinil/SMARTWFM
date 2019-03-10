<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<jsp:include page="headPagos.jsp"></jsp:include>
<body><div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    </div>
	<jsp:include page="menu5.jsp" />
	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> <spring:message  code="label.tittlePay"/>
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
