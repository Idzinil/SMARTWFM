<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Sytecso - Smartfield</title>
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSytecso.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/font-awesome.css"/>">
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/font-awesome.min.css"/>">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		 <link rel="stylesheet" type="text/css" href="<c:url value = "/css/secciones.css"/>">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
		<script src="<c:url value="/js/Sytecso/sytecso.js"/>"></script>
		<script src="<c:url value="/js/Sytecso/loader.js"/>"></script>
		<script src="<c:url value="/js/principal/principal.js"/>"></script>
		<c:if test="${ showGraphic }">
		<script type="text/javascript">
	    </script>
	    </c:if>
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
    <div id="tableroTitle">
			Dashboard
    </div>
	<div id="mainContainerDiv">
		<jsp:include page="menu1.jsp" />
<%-- 		<div class="tituloBienvenida"><spring:message  code="label.Welcome"/></div> --%>
		<div id="tableroSytecso">
			<div id="ventanaBienvenidaSytecso">
				<div class="contenido">
					<div class="row clearfix">
						<ul class="nav">
							<li>
						    	<security:authorize access="hasRole('ROLE_USER')">
							    	<b><img src ="${pageContext.request.contextPath}/img/icono_cuentas.png" >  <spring:message  code="label.AdmCta"/> </b>
							    </security:authorize>
							    <security:authorize access="hasRole('ROLE_ADMIN')">
							    	<b><img src ="${pageContext.request.contextPath}/img/icono_adminSis.png"> <spring:message  code="label.titleSistem"/> </b>
							    </security:authorize>
							    
								<ul class="url_cont">
									<security:authorize access="hasRole('ROLE_USER')">
										<li> 
											<pre><a href="${pageContext.request.contextPath}/irFormulario"><spring:message  code="label.AltaCta"/></a></pre> 
										</li>
										<li> 
											<a id="linkModCuentas" style="cursor: pointer"><spring:message  code="label.ModCta"/></a>	 
										</li>
										
									</security:authorize>
									<security:authorize access="hasRole('ROLE_ADMIN')">
										<li>
											<a href="${pageContext.request.contextPath}/usuarioCuenta/obtenerUsersAdm"><spring:message  code="label.SistemUser"/></a>
										</li>
									</security:authorize>
								</ul> 
							</li>
							<li>
								<security:authorize access="hasRole('ROLE_ADMIN')">
											<b><img src ="${pageContext.request.contextPath}/img/icono_migracion.png"> <spring:message  code="label.AdmCta"/></b>
								<ul class="url_cont">
									<li> 
										<pre><a href="${pageContext.request.contextPath}/cargaIniArchivo/cargainicialcta"><spring:message  code="label.CargaClientes"/></a></pre>
									</li>
										</ul>
								</security:authorize>
								<security:authorize access="hasRole('BILLING')">
									<b><img src ="${pageContext.request.contextPath}/img/icono_facturacion.png"> <spring:message  code="label.AdmFact"/></b>
									<ul class="url_cont">
										<li>
											<pre><a href="${pageContext.request.contextPath}/billInicio"><spring:message  code="label.FactCta"/> </a></pre>
										</li>
								
										<li>
											<a href="${pageContext.request.contextPath}/invoicing"><spring:message  code="label.lytDocFisc"/></a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath}/billPeriodoFactura"><spring:message  code="label.factPeriod"/></a>
										</li>
									</ul>
								</security:authorize>
							</li>
							<li>
							<security:authorize access="hasRole('ROLE_CONFIG')">
								    <b><img src ="${pageContext.request.contextPath}/img/icono_adminSis.png" ><spring:message  code="label.ConfigSist"/></b>
									<ul class="url_cont">
										<li>
									<a href="${pageContext.request.contextPath}/administracionPantallas"><spring:message  code="label.permisosPantalla"/></a>
								</li>
									</ul>
								</security:authorize>
							</li>
							<li>
							<security:authorize access="hasRole('ROLE_CONFIG')">
								<b><img src ="${pageContext.request.contextPath}/img/divisa.png"> <spring:message  code="label.ConfigDivisaImp"/></b>
								<ul class="url_cont">
									<li>
									<a href="${pageContext.request.contextPath}/obtenerImpuestos"><spring:message  code="label.AdminImps"/></a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/divisasFront"><spring:message  code="label.AdminMonedas"/></a>
								</li>
								</ul>
							</security:authorize>
							</li>
							<li>
							<security:authorize access="hasRole('ROLE_ADMIN')">
							<br>
							<br>
							<br>
							<br>
							<b><img src ="${pageContext.request.contextPath}/img/cuadrilla.png"> Administracion de Cuadrillas</b>
										<ul class="url_cont">
											<li> 
												<pre><a href="${pageContext.request.contextPath}/cuadrillasFront">Modificacion Cuadrilla</a></pre>
											</li>
							
								</ul>
							</security:authorize>
							</li>
							<li>
								<security:authorize access="hasRole('ROLE_BILLING')">
									<b><img src ="${pageContext.request.contextPath}/img/icono_balance.png" height="26" > <spring:message  code="label.balanceCta"/></b>
									<ul class="url_cont">
										<li> 
											<pre><a href="${pageContext.request.contextPath}/verBalance"><spring:message  code="label.balanceCta"/></a> </pre>
										</li>
										<li> 
											<pre><a href="${pageContext.request.contextPath}/reportes"><spring:message  code="label.ReporteCta"/></a> </pre>
										</li>
									</ul>
								</security:authorize>
								</li>
									<li>
						    	<security:authorize access="hasRole('BILLING')">
								    <b><img src ="${pageContext.request.contextPath}/img/icono_pagos.png" > <spring:message  code="label.pagos"/></b>
									<ul class="url_cont_inh">
									
										<li> 
											<pre><spring:message  code="label.ConfigMetodsPay"/></pre>
										</li>
										<li> 
											<pre><spring:message  code="label.canalesPagos"/> </pre>
										</li>
										<li class="url_cont">
											<pre><a href="${pageContext.request.contextPath}/pagos"><spring:message  code="label.facBill"/></a></pre>
										</li>
<!-- 										<li class="url_cont"> -->
<%-- 											<pre><a href="${pageContext.request.contextPath}/test/pagos">Pagos Custom Demo</a></pre> --%>
<!-- 										</li> -->
									</ul>
								</security:authorize>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>