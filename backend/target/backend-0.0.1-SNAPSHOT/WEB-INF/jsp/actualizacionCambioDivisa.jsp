<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<html>
	<head>
		<title>
       		SMARTBILLING - Sytecso System
    	</title>
    	



		  <script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/estiloSmartBilling.css"/>">
	<link href="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.css" />" rel="stylesheet">
	
	<script src="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.js"/>"></script>
	<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
	<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>

		<	<style>  
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
		<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
		<jsp:include page="menu4.jsp" /> 
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> <spring:message  code="label.tittleAdj"/>
		    </div>
		</div>
		<div id="tableroSmartBilling">
	    	<div id="ventanaSmartBilling">	
	        	<div class="contenido">
	        	<p > Se actualiza el Cambio de Divisa de <strong> ${nombreMonedaA} a ${nombreMonedaB}</strong></p>
	      	 		<div id="datos">
						<div id="datosForm4">  
							<form:form   method="GET" action="actualizarCambioDivisa.html"  modelAttribute="cambioDiv" >
	<table align="center" width="45%" >
		<tr align="center">
	   		<td bgcolor="#FFFFFF">
	   		<form:label path="nombreMonedaA" class="encabezadoCampos"><spring:message  code="label.ConfigDivisasFormTBNamMonA"/>:</form:label><br/>
					<form:input class="anchoCampos"  type="text" path="idCambioDivisa" required="true" value="${idCambioDivisa}" style="display:none" />
					<form:input class="anchoCampos"  type="text" path="nombreMonedaA" required="true" value="${nombreMonedaA}" readonly="true" />
			</td>
			<td bgcolor="#FFFFFF">
	   		<form:label path="nombreMonedaB" class="encabezadoCampos"><spring:message  code="label.ConfigDivisasFormTBNamMonB"/>:</form:label><br/>
					<form:input class="anchoCampos"  type="text" path="nombreMonedaB" required="true" value="${nombreMonedaB}" readonly="true"/>
			</td>
		</tr>
		<tr align="center">
	   		<td bgcolor="#FFFFFF">
	   		<form:label path="baseMonedaA" class="encabezadoCampos"><spring:message  code="label.ConfigDivisasFormTBBaseMonA"/>:</form:label><br/>
					<form:input class="anchoCampos"  type="text" path="baseMonedaA" required="true" value="${baseMonedaA}" />
			</td>
			<td bgcolor="#FFFFFF">
	   		<form:label path="baseMonedaB" class="encabezadoCampos"><spring:message  code="label.ConfigDivisasFormTBBaseMonB"/>:</form:label><br/>
					<form:input class="anchoCampos" type="text" path="baseMonedaB" required="true" value="${baseMonedaB}" />
			</td>
		</tr>
		<tr align="center">
	   		<td bgcolor="#FFFFFF">
	   		<form:label path="cambioAValorB" class="encabezadoCampos"><spring:message  code="label.ConfigDivisasFormTBCambioAValorB"/>:</form:label><br/>
					<form:input class="anchoCampos"  type="text" path="cambioAValorB" required="true" value="${cambioAValorB}" />
		</tr>
	</table>
	<input class="w3-button w3-black w3-round-large" type="submit" value="Actualizar" class="botonSmartBilling" />
											
</form:form>
										
						</div>
					</div>
				</div>
			</div>
		</div>
<jsp:include page="divRegresarPrincipal.jsp" />
	</body>
</html>
