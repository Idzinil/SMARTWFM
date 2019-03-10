<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
<title>SMARTBILLING - Sytecso System</title>
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
<jsp:include page="menu2.jsp" /> 
		
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> USUARIOS
		    </div>
		</div>
		<div id="tableroSmartBilling">
			<div id="ventanaSmartBilling">
				<div id="datos" align="center">
				<h2 align="center">Actualización de compra de producto</h2>
				<label>Agregar campo</label><br/>
					<label>Nombre Campo: <input type="text" placeholder="Nombre campo" style="width: 10%;"></label>
					<label>Tipo Campo: </label>
					<select style="width: 10%;">
						<option>Texto</option>
						<option>Numerico</option>
						<option>Fecha</option>
					</select>
					<img  src="img/signo_mas_verde.png" style="cursor: pointer;">
					<table style="border:none;">
						  <thead  class="letrath">
  							<tr >
						     <th>Campo</th>
						     <th>Descripcion</th>
						  	</tr>
						  </thead>
						  <tr class="letra">
						  	<td>Monto Override</td>
						  	<td>Campo tipo numerico de tres decimales</td>
						  </tr>
						  <tr class="letra">
						  	<td>Id Cliente Enlace (Obligatorio)</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr> 
						  <tr class="letra">
						  	<td>Usuario Final</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Id Activo</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Tipo Circuito</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Direccion Servicio</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Fecha Activacion (Obligatorio)</td>
						  	<td>Campo de tipo fecha en formato dd-mm-yyyy</td>
						  </tr>
						  <tr class="letra">
						  	<td>Fecha Fin (Obligatorio)</td>
						  	<td>Campo de tipo fecha en formato dd-mm-yyyy</td>
						  </tr>
						  <tr class="letra">
						  	<td>Descuento</td>
						  	<td>Campo tipo numerico de tres decimales</td>
						  </tr>
						  <tr class="letra">
						  	<td>Mes para iniciar a facturar (Obligatorio)</td>
						  	<td>Campo de tipo fecha en formato mm-yyyy</td>
						  </tr>
						  <tr class="letra">
						  	<td>Plaza</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Nombre Proyecto</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Prorrateo</td>
						  	<td>Campo de opcion</td>
						  </tr>
						  <tr class="letra">
						  	<td>IVA</td>
						  	<td>Campo de opcion</td>
						  </tr>
						  <tr class="letra">
						  	<td>IEPS</td>
						  	<td>Campo de opcion</td>
						  </tr>
					</table>
					<label>Punta A</label>
					<table style="border:none;">
						  <thead  class="letrath">
  							<tr >
						     <th>Campo</th>
						     <th>Descripcion</th>
						  	</tr>
						  </thead> 
						  <tr class="letra">
						  	<td>Numero</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Piso</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Interior</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Colonia</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Delegacion</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Ciudad</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Estado</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Origen</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
					</table>
					<label>Punta B</label>
					<table style="border:none;">
						  <thead  class="letrath">
  							<tr >
						     <th>Campo</th>
						     <th>Descripcion</th>
						  	</tr>
						  </thead>	  
						  <tr class="letra">
						  	<td>Numero</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Piso</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Interior</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Colonia</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Delegacion</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Ciudad</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Estado</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Destino</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
					</table>
				</div>
				<div id="datosbotonesComp">
					<div id="botonBack">
						<div class="col-sm-6">
							<a href="${pageContext.request.contextPath}/administracionPantallas"><img src ="${pageContext.request.contextPath}/img/regresar.png">Regresar</a>
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
	
</body>
</html>