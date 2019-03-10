<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>
       		SMARTBILLING - Sytecso System
    	</title>
	<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<link rel="stylesheet" type="text/css" href="css/estiloSmartBilling.css">
	<link rel="stylesheet" href="css/jquery.dataTables.min.css">
	<script src="js/jquery-1.12.4.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
	<script>
	function myFunction(prueba) {
		document.getElementById("imto").value=prueba;
	    var x = document.getElementById("myDIV");
	    if (x.style.display === "none") {
	        x.style.display = "block";
	    }
	}
	</script>
	<style>
			table {  
			    
			    
			     border: 1px #D8D8D8 solid;
			} 
				thead { 
				background: linear-gradient(to bottom, #2E2E2E 3%, #151515 84%);
				color: #D8D8D8;
			 }
			 tr:nth-child(even)
			 {
			 	background-color: #E6E6E6;
			 }
			.letra {
				font-size: 13px;
				color:#1C1C1C;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
			.letrath {
				font-size: 14px;
				color:white;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
		</style>
</head>
<body>
<jsp:include page="menu3.jsp" /> 
		
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="/SmartBilling/img/das.png" width="16px" height="16px" style="margin-left:10px;"> USUARIOS
		    </div>
		</div>
		<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
		<label type="text"><p>Resultados del Contrato=<B><%=session.getAttribute("periodoFacContrato")%></B> para la Factura=<B><%=session.getAttribute("periodoFacFactura")%>.</B></p></label>
		<div id="datos"> 


<div id="datosC">
<table  border cellpadding=1 cellspacing=0 width="98%">
<thead>
  <tr class="letrath">
  <th>N&uacute;mero Item</th>
    <th>N&uacute;mero Contrato</th>
    <th>N&uacute;mero Cuenta</th>
    <th>Cliente</th>
    <th>Razon Social</th>
    <th>Grupo</th>
    <th>N&uacute;mero Orden</th>
    <th>Monto</th>
    <th>Moneda</th>
    <th>Cargo</th>
    <th>Nombre producto</th>
  </tr>
  </thead>
  <c:forEach var="listVal" items="${lstFacDatosContratoItem}" >
  <tr class="letra">
  	<td align="center">${listVal.numeroItem}</td>
    <td align="center"><B>${listVal.idContrato}</B></td> 
    <td align="center">${listVal.numCuenta}</td>
    <td align="center">${listVal.aliasCliente}</td>
    <td align="center">${listVal.razonSocial}</td>
    <td align="center">${listVal.agrupador_bill}</td>
    <td align="center">${listVal.orderId}</td>
    <td align="center">
    <strong> <fmt:setLocale value="en_US"
		scope="session" /> <fmt:formatNumber value="${listVal.monto}"
		type="currency" maxFractionDigits="4" pattern="$#,##0.0###" /></strong>
    </td>
    <td align="center">${listVal.monedaProducto}</td>
    <td align="center">${listVal.tipoCargo}</td>
    <td align="center"><c:out value="${listVal.descripcionOverride==''?listVal.descripcion:listVal.descripcionOverride}" /></td>
  </tr>
  	</c:forEach>
</table>
<br>
<br>
<br>
</div>
</div>
</div>
</div>
						<div id="datosbotonesComp">
							<div id="botonBack">
								<div class="col-sm-6">
									
									<a href="${pageContext.request.contextPath}/obtenDataPeriodoFaContrato?factura=<%=session.getAttribute("periodoFacFactura")%>"><img src ="${pageContext.request.contextPath}/img/regresar.png">Regresar</a>
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