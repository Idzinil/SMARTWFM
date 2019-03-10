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
					<h2 align="center">Actualización de cuentas</h2>
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
						  	<td>Tipo Cliente</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Id Cliente SAM</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Alias Cliente</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Region</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Gerencia</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Departamento</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Nacionalidad Cuenta</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Ejecutivo Cuenta (Obligatorio)</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Cuenta Padre</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>RFC (Obligatorio)</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Razon Social</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Calle (Obligatorio)</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Numero Interior</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Numero Exterior</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Colonia (Obligatorio)</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Municipio</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Ciudad (Obligatorio)</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Estado (obligatorio)</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Pais (Obligatorio)</td>
						  	<td>Campo de texto, se aceptan caracteres</td>
						  </tr>
						  <tr class="letra">
						  	<td>Codigo Postal</td>
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