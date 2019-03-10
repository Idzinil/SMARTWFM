<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
	<link rel="stylesheet" href="js/jquery-ui-1.12.1/jquery-ui.css">
	<script src="js/jquery-1.12.4.js"></script>
	<script src="js/utils/UrlUtils.js"></script>
	<script src="js/SmartBilling/smartBilling.js"></script>
	<script src="js/cuentas/actualizaEstatusCuenta.js"></script>
	<script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
<title>SMARTBILLING - Sytecso System</title>
<script type="text/javascript">
	function getCuenta(){
		return ${cuenta}		
	}
	actCuenta(getCuenta());
</script>
</head>
<body>
		<jsp:include page="menu1.jsp" />
		<div id="tituloyBarraBusqueda">
			<div id="tituloTablero">
				<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left: 10px;"> Busqueda de cuentas
			</div>
		</div>
		<div id="tableroSmartBilling">
		  <div id="ventanaBienvenidaSmartBilling">
			<div id="mainContent">
				<div class="contenido" style="display: inline-block; text-align: center;">
					<select id="selectEstatus" style="width:100%;">
					</select>
					<button class="w3-button w3-black w3-round-large" id="updateStatus">Cambiar Estatus de la cuenta</button>
					<div id="dialog">
					</div>
				</div>
				
			</div>
		</div>
		</div>
		<div id="datosbotonesComp">
					<div id="botonBack">
							<div class="col-sm-6">
								
								<a href="${pageContext.request.contextPath}/irBuscarCta?seccion=<%=session.getAttribute("seccionLoad") %>"><img src ="${pageContext.request.contextPath}/img/regresar.png">Regresar</a>
							</div>
						</div>
					<div id="botonHome">
							<div class="col-sm-6">
								
								<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png">Principal</a>
							</div>
						</div>
				</div>
</body>
</html>