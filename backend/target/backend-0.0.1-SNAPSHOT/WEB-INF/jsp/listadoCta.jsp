<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<head>
		<title>SMARTBILLING - Sytecso System</title>
		<link href="<c:url value="/css/estiloSmartBilling.css" />" 	rel="stylesheet">
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
		<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
		<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
		<script src="<c:url value="/js/cuentas/ListadoCuenta.js"/>"></script>
				<script type="text/javascript">
			function getJsonObj(){
				return ${lists};
			}
			function getSelectOptions(){
				return ${selectOption};
			}
			function lenguaje(){
				return "<spring:message  code="label.lang"/>";
			}
		
			$(document).ready(function() {
				var listCuenta = new ListadoCuenta(getJsonObj(),getSelectOptions());	
				listadoCuenta(listCuenta,lenguaje());
				
			} );
			
	
						
		</script>
		
	</head>
	<body>
				<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
		<jsp:include page="${menu}" />
		<div id="tituloyBarraBusqueda">
			<div id="tituloTablero">
				<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left: 10px;"><spring:message  code="label.CmpBusqCta" />
			</div>
		</div>
		<div id="tableroSmartBilling">
			<div id="ventanaSmartBilling">
			
				<div class="contenido" style="display: inline-block; text-align: center;">

				<table id="data" class="tablePrincipal">
					<thead class="theadPrincipal">
					<tr class="letrathPrincipal">
						<th><spring:message  code="label.CmpNumCta" /></th>
						<th><spring:message  code="label.CmpTipoCta" /></th>
						<th><spring:message  code="label.CmpRegion" /></th>
						<th><spring:message  code="label.CmpRFC" /></th>
						<th><spring:message  code="label.CmpRzonSoc" /></th>
						<th><spring:message  code="label.CmpPais" /></th>
						<th><spring:message  code="label.CmpPanta" /></th>
					</tr>
					</thead>	
				</table>

				</div>
				<div id="datosbotonesComp">
		<div id="botonBack">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/irBuscarCta?seccion=<%=session.getAttribute("seccionLoad") %>"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar" /></a>
				</div>
			</div>
		<div id="botonHome">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png"><spring:message  code="label.NavPrin" /></a>
				</div>
			</div>
		</div>
		</div>
	</div>
	
</body>
</html>