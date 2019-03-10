<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>
            SMARTBILLING - Sytecso System
        </title>
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
		<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
		<script src="<c:url value="/js/principal/principal.js"/>"></script>
		<script type="text/javascript">
		function getContextPath() {
			return "<c:out value="${pageContext.request.contextPath}" />";	
		};
		$(document).ready(function(){
			let prin = new Principal(); 
			$("#linkCompras").on("click",function(){
				var seccion={"seccion":UrlUtils.urlCompra()	}
				var request= prin.ajaxGet("irBuscarCta?=seccion",seccion);
				request.then(data=>
				prin.replaceAllHtml(data,getContextPath()+UrlUtils.urlCuenta()),
				error=>alert("Ocurrio un error inesperado"));
			});
		});
			
		</script>
    </head>
    <body>
    	<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
    	<div id="mainContainerDiv">
		<jsp:include page="menu4.jsp" /> 
	    <div id="tituloyBarraBusqueda">
	        <div id="tituloTablero">
	           <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;">  <spring:message  code="label.tittleCompras"/>
	        </div>
	    </div>
		<div id="tableroSmartBilling">
			<div id="ventanaBienvenidaSmartBilling">
				<div class="contenido">
					<div class="columnasSmartBilling">
						<security:authorize access="hasRole('ROLE_USER')">
							<label type="text"><img src ="${pageContext.request.contextPath}/img/icono_compras.png" ><b> <spring:message  code="label.Compras"/> </b></label> 
							<ul>
		
								<li> 
									<a id="linkCompras" style="cursor: pointer"><spring:message  code="label.ComprasCompraProd"/></a> 
								</li>
								
							</ul>
						</security:authorize>
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<b>Administración de oferta comercial </b>
							<ul>
								<li> 
									<a href="${pageContext.request.contextPath}/productosFront">Modificación de oferta comercial</a> 
								</li>
								<li> 
									<a href="${pageContext.request.contextPath}/buscarCuenta">Alta de productos</a>
								</li>
							</ul>
						</security:authorize>
					</div>
				</div>
			</div>
		</div>
		</div>
    </body>
</html>