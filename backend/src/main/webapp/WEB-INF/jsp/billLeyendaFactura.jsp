<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SMARTBILLING - Sytecso System</title>
<link href="<c:url value="/css/estiloSmartBilling.css" />" 	rel="stylesheet">
<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
<script src="<c:url value="/js/facturacion/pantallaPrincipalBilling.js"/>"></script>
<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
</head>
<body>
      <div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
		Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
 	</div>
	<jsp:include page="menu3.jsp" />

	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left: 10px;"> <spring:message  code="label.tittleFact"/>
		</div>
	</div>
	<div id="tableroSmartBilling">
		<div id="ventanaBienvenidaSmartBilling">
			<div class="container">
				<div id="datos">
					<p class="letrap encabezadoCampos"><spring:message  code="label.FactBillLeyFactModif"/></p>
					<form:form method="POST" action="${pageContext.request.contextPath.concat(path)}" modelAttribute="contratosFactura">
						<label class="encabezadoCampos"><spring:message  code="label.FactBillLeyFactDesc"/></label><br/>
						<form:input path="leyendaExtraOverride" class="anchoCampos" style=" width: 40% !important;"/><br/>
						<label class="encabezadoCampos"><spring:message  code="label.FactBillLeyFactLey"/></label><br/>
						<form:input path="leyendaExtra" class="anchoCampos" style=" width: 40% !important;"/><br/>
						<form:hidden path="grupo" />
						<spring:message  code="label.FactBillLeyFactBtnGuar" var="btnGuard"/>
						<input type="submit" value="${btnGuard }" class="w3-button w3-black w3-round-large">
					</form:form>
				</div>
			</div>
				<div id="datosbotonesComp">
		<div id="botonBack">
			<div class="col-sm-6">

				<a href="${pageContext.request.contextPath.concat(pathRegresar)}"><img
					src="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
			</div>
		</div>
		<div id="botonHome">
			<div class="col-sm-6">

				<a href="${pageContext.request.contextPath}/principal"><img
					src="${pageContext.request.contextPath}/img/home.png"><spring:message  code="label.NavPrin"/></a>
			</div>
		</div>
	</div>
		</div>
	</div>
</body>
</html>