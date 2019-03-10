<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>SMARTBILLING - Sytecso System</title>
		<link rel="stylesheet" type="text/css"	href="<c:url value="/css/estiloSmartBilling.css"/>">
		<style>
		pre {

    font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
    white-space: pre;

} 
</style>
		</head>
	<body>
		<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    </div>
		<jsp:include page="menu3.jsp" />
		
		<div id="tituloyBarraBusqueda">
			<div id="tituloTablero">
	            <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;">    Divisas
	        </div>
		</div>
	    <div id="tableroSmartBilling">
	        <div id="ventanaBienvenidaSmartBilling">
	            
	            <div class="contenido">
	                
	                <div class="columnasSmartBilling">
	                        <div style="float: left; width: 25%;"><span class="title"> 
	                        <pre><h2><img src="img/divisa.png" style="margin-left:10px;" /> <spring:message  code="label.ConfigDivisasFormTittle"/></h2></pre>
	                        </span>
	                            <div>
	                                    <ul>
	                                        <li><a href="${pageContext.request.contextPath}/configDivisas">Alta de Cambio de Divisas</a> </li>
	                                        <li><a href="${pageContext.request.contextPath}/actualizacionDivisas">Actualizacion de Cambio de Divisas</a></li>
	                                    </ul>
	                            </div>
	                        </div>
	                    </div>
	            </div>
			</div>
		</div>
	</body>
</html>