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
			    margin: auto;  
			    border: 1px #D8D8D8 solid;
			   font-family: arial, sans-serif;
			   border-left:0px;
			   border-right:0px;
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
			
			fieldset{
			  border: 1px solid rgb(216,225,231) 22%;
			  width: 400px;
			  margin:auto;
			}
			
		</style>
<body>
<jsp:include page="menu2.jsp" /> 
		
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> USUARIOS
		    </div>
		</div>
		<div id="tableroSmartBilling">
			<div id="ventanaSmartBilling">
				<div id="datos"  align="center">
					<h2 align="center">Alta de productos</h2>
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
						  	<td>Impuesto</td>
						  	<td>Campo de opcion multiple, valores: IVA/IEPS</td>
						  </tr>
						  <tr class="letra">
						  	<td>Tipo Cargo</td>
						  	<td>Campo de opcion, valores: MRC,NRC,Periodo escalable,Cobro mensual escalable</td>
						  </tr>
						  <tr class="letra">
						  	<td>Factura Cada</td>
						  	<td>Campo de tipo numerico, este campo solo estara disponible si el tipo de cargo es: Periodo escalable</td>
						  </tr>
						  <tr class="letra">
						  	<td>Selectible Prorratear</td>
						  	<td>Campo de seleccion de opcion, valor Si,No</td>
						  </tr>
						  <tr class="letra">
						  	<td>Meses de disponiblidad</td>
						  	<td>Campo de tipo numerico</td>
						  </tr>
						  <tr class="letra">
						  	<td>Termino del producto</td>
						  	<td>Campo de seleccion de opcion, valores: Siempre Activo, Auto-renovable,Expira</td>
						  </tr>
						  <tr class="letra">
						  	<td>Estatus</td>
						  	<td>Campo de seleccion de opcion, valores: Activo,Inactivo</td>
						  </tr>
						  <tr class="letra">
						  	<td>Disponible desde</td>
						  	<td>Campo de tipo fecha en formato dd-mm-yyyy</td>
						  </tr>
						  <tr class="letra">
						  	<td>Moneda</td>
						  	<td>Campo de seleccion de opcion, valores: MXN,USD</td>
						  </tr>
						  <tr class="letra">
						  	<td>Descripcion Producto</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Codigo Producto</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Clave Prod. Sat</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Capacidad</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Familia</td>
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