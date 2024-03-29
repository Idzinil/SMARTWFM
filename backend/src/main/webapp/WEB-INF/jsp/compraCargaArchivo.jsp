<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>SmartBilling - RedIt</title>
		<title>SmartBilling - RedIt</title>
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
		 <link rel="stylesheet" type="text/css" href="<c:url value = "/css/secciones.css"/>">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
		<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
		<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
		<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
		<script src="<c:url value="/js/principal/principal.js"/>"></script>
		<script src="<c:url value="/js/compras/compraBatch.js"/>"></script>
		<script type="text/javascript">
		function getComprasList() {
			return ${rechazados};
		}
		main(getComprasList());
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
			Language : <a href="?lang=es">Espa�ol</a> | <a href="?lang=en">English</a> 
    	</div>
    	<div id="mainContainerDiv">		
    		<jsp:include page="menu2.jsp" />
			<div id="tituloyBarraBusqueda">
	        	<div id="tituloTablero">
	            	<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;">  <spring:message  code="label.AdmCargCompras"/>
	        	</div>
	    	</div>
<div id="tableroSmartBilling">
	    	<div id="datos">
				<h4 style="color: red">${respSatisFecha}</h4>
				<form:form method="POST" action="cargarCompras"	enctype="multipart/form-data" style="float: left;width: 40%;">
					<p>
						<label for="image"><spring:message  code="label.AdmCargComprasCarg"/>.</label>
					</p>
					<p>
						<input name="file" id="fileToUpload" type="file" />
					</p>
					<p>
					<spring:message  code="label.AdmCargComprasBtn" var = "envarch"/>
						<input  class="w3-button w3-black w3-round-large" type="submit" value="${envarch }">
					</p>
				</form:form>
				<c:if test="${status}">
					<table id="rechazados" align="center">
					</table>
				</c:if>
			</div>
			</div>
			</div>
	        <div id="datosbotonesComp">
				<div id="botonBack">
					<div class="col-sm-6">
						
						<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
					</div>
				</div>
				<div id="botonHome">
					<div class="col-sm-6">
						
						<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png"><spring:message  code="label.NavPrin"/></a>
					</div>
				</div>
			</div>
    </body>
</html>
</body>
</html>