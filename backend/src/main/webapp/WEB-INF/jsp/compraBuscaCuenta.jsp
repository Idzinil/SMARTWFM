<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>SmartBilling - RedIt</title>
 		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>"> 	
		 <link rel="stylesheet" type="text/css" href="<c:url value = "/css/secciones.css"/>">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
		<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
		<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
		<script src="<c:url value="/js/principal/principal.js"/>"></script>
		<script type="text/javascript">
		function getContextPath() {
			return "<c:out value="${pageContext.request.contextPath}" />";	
		}
		$(document).ready(function(){
			principal(getContextPath())
		});
			
		</script>
		<style >
body {
  font-family:Helvetica,Futura,Arial,Verdana,sans-serif;
		background:black;
		}
		</style>
		
</head>
<body>
		<jsp:include page="menu4.jsp" /> 
	    <div id="tituloyBarraBusqueda">
	        <div id="tituloTablero">
	            <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> COMPRAS
	        </div>
	    </div>
	    <div id="tableroSmartBilling">
	        <div id="ventanaBienvenidaSmartBilling">
	            <div class="contenido">
					<div id="test">
						<form:form method="POST" action="buscaCuentaCompra">
							<label type="text">Buscar cuenta:</label>
							<input id="cmpBuscaCuenta" type="text" placeholder="Numero de Cuenta" name="numCuenta">
							<input type="submit" value="Buscar">
						</form:form>
						<br>
						<label>${estatusCta}</label>
						<c:if test="${estatus}">
							<label>${msg}</label><br>
						</c:if>
						
					</div>
				</div>
					
			</div>
		</div>
</body>
</html>