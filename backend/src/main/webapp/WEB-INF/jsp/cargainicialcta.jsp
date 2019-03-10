<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sytecso - Smartfield</title>
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSytecso.css"/>">
		<link rel="stylesheet" href="<c:url value = "/js/jquery-ui-1.12.1/jquery-ui.css"/>">
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
		<script src="<c:url value="/js/Sytecso/sytecso.js"/>"></script>
		<script src="<c:url value="/js/cuentas/cuentasBatch.js"/>"></script>
		
		<script type="text/javascript">
			main(${errors});
		</script>
		<style type="text/css">
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
    	  <div id="tableroSytecso">
			<div id="tableroTitle">
	            	<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;">   <spring:message  code="label.ClientModTittle"/>
	        	</div>
    </div>
<jsp:include page="menu2.jsp" />
			
	<h4 style="color: red">${respsatisfecha}</h4>
	<div id="tableroSytecso">
	<div id="ventanaBienvenidaSytecso">
	<h3 align="left" > <img margin-left="1em" src ="${pageContext.request.contextPath}/img/icono_migracion.png"  > <spring:message  code="label.ClientModCargArch"/></h3>
	<div id="datos">
	
	    <div id="datosCuenta">
	    
	    <table width="100%" border="0">
			<form:form method="POST" action="guardarchivo.html"
				enctype="multipart/form-data">
				<tr>
				<td bgcolor="#FFFFFF" >
					<label type="text" for="image"><spring:message  code="label.ClientModInfo"/>.</label>
					</td>
				</tr>
				<tr>
				<td bgcolor="#FFFFFF" >
				
					<input  name="file" id="fileToUpload" type="file" >
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF" >
					<spring:message  code="label.ClientModBttn" var = "ClientModBttn"/>
					<input  class="w3-button w3-black w3-round-large"  type="submit" value="${ClientModBttn }">
					</td>
				</tr>
			</form:form>
			</table>	
	</div> 	
				<c:if test="${estatus}">
					<table id="rechazados" align="center"></table>
				</c:if>
		</div>
		</div>
</div>
		<div id="datosbotonesComp">
			<div id="botonBack">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/cuentasFront"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
				</div>
			</div>
		<div id="botonHome">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png"><spring:message  code="label.NavPrin" /></a>
				</div>
			</div>
		</div>
			
</body>
</html>