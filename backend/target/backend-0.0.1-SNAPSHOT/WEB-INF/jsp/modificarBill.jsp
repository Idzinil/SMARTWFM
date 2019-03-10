<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>SMARTBILLING - Sytecso System</title>
<link href="<c:url value="/css/estiloSmartBilling.css" />"
	rel="stylesheet">
<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
<script
	src="<c:url value="/js/facturacion/pantallaPrincipalBilling.js"/>"></script>
<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
<style>
.letrap {
	font-size: 18px !important;
	color: #1C1C1C !important;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
}
</style>
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
			<div class="container" align="center">
				<p class="letrap"><spring:message  code="label.FactModifBillFact"/></p>
				<div id="datos" align="center">
					<form:form method="POST"
						action="${pageContext.request.contextPath.concat(path)}"
						modelAttribute="datosb">
						<label for="nombre"
							class="col-sm-2 col-form-label encabezadoCampos"><spring:message  code="label.FactModifBillAgBill"/></label><br/>
						<form:input readonly="${disableInputGrupo }" type="text" path="agrupacionDeal.grupo"
							class="anchoCampos" style=" width: 40% !important;" autocomplete="off" /><br/>
						<label for="apellido"
							class="col-sm-2 col-form-label encabezadoCampos"><spring:message  code="label.FactModifBillLey"/></label><br/>
						<form:input disabled="disabled" type="text" path="descripcionOverride"
							class="anchoCampos" style=" width: 40% !important;" autocomplete="off"/><br/>
						<c:if test="${false }">
						<label for="apellido"	class="col-sm-2 col-form-label encabezadoCampos"><spring:message  code="label.FactModifBillClas"/></label>
						<br />
							<form:input type="text" path="clasificacion"
								class="anchoCampos" style=" width: 40% !important;"/>
							<br />
							<label for="apellido"	class="col-sm-2 col-form-label encabezadoCampos"><spring:message  code="label.FactModifBillNomPro"/></label><br/>
							<form:input type="text" path="nombreProyecto"
								class="anchoCampos" style=" width: 40% !important;"/><br/>
						</c:if><br/>	
						<spring:message  code="label.FactModifBtnAct" var="btnAct"/>
						<input class="w3-button w3-black w3-round-large" type="submit"
							value="${btnAct }" />
						<label>${msg}</label>
					</form:form>


				</div>
				<div id="datosbotonesComp">
					<div id="botonBack">
						<div class="col-sm-6">
							<a
								href="${pageContext.request.contextPath.concat(pathRegresar)}"><img
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
	</div>


</body>
</html>