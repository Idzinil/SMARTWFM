<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
		<title>SMARTBILLING - Sytecso System </title>
	<link href="<c:url value="/css/estiloSmartBilling.css" />" 	rel="stylesheet">
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
<script src="jquery.ui.datepicker-es.js"></script>
		<script>
		$(document).ready(function() {
			function goBack() {
			    window.history.back();
			}
			
			$("#from").datepicker({
				onClose: function (selectedDate) {
				$("#to").datepicker("option", "minDate", selectedDate);
				}
				});
				$("#to").datepicker({
				onClose: function (selectedDate) {
				$("#from").datepicker("option", "maxDate", selectedDate);
				}
				});
				
		});
		</script>
		<style>
				.letrap {
				font-size: 18px !important;
				color:#1C1C1C !important;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
		</style>
</head>
<body>
	<jsp:include page="menu3.jsp" /> 
		
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> FACTURACIÓN
		    </div>
		</div>
<div id="tableroSmartBilling">
		<div id="ventanaBienvenidaSmartBilling">
	<div class="container">
	<p class="letrap"><n>Modificar Facturación Cuenta</n></p>
		<div id="datos">
		
		       <form:form method="POST" action="/SmartBilling/actualizarBill" modelAttribute="datosb">    
		<div id="datosCuenta">
			<p>
				Desde:
				<input type="text" id="from" name="from" />
				</p>
				<p>
				Hasta:
				<input type="text" id="to" name="to" />
				</p>
			</div>
			<div id="boton1">
				<div class="col-sm-6">
					<input class="w3-button w3-black w3-round-large"  type="submit" value="Enviar" />
				</div>
			</div>
			
			
		</form:form>
		
		</div>
		<div id="datosbotonesComp">
		<div id="botonBack">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/billResultado"><img src ="${pageContext.request.contextPath}/img/regresar.png">Regresar</a>
				</div>
			</div>
		<div id="botonHome">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png">Principal</a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

	
</body>
</html>