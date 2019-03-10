<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Sytecso - Smartfield</title>
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSytecso.css"/>">
		 <link rel="stylesheet" type="text/css" href="<c:url value = "/css/secciones.css"/>">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
		<script src="<c:url value="/js/Sytecso/sytecso.js"/>"></script>
		<script src="<c:url value="/js/principal/principal.js"/>"></script>
		<script type="text/javascript">
			function getContextPath() {
				return "<c:out value="${pageContext.request.contextPath}" />";	
			};
			$(document).ready(function(){
				let prin = new Principal(); 
				$("#linkModCuentas").on("click",function(){
					var seccion={"seccion":UrlUtils.urlActCuenta()	}
					var request= prin.ajaxGet("irBuscarCta?=seccion",seccion);
					request.then(data=>
					prin.replaceAllHtml(data,getContextPath()+UrlUtils.urlCuenta()),
					error=>alert("Ocurrio un error inesperado"));
				});
				$("#linkEstatusCuenta").on("click",function(){
					var seccion={"seccion":UrlUtils.urlEstatusCuenta()	}
					var request= prin.ajaxGet("irBuscarCta?=seccion",seccion);
					request.then(data=>
					prin.replaceAllHtml(data,getContextPath()+UrlUtils.urlCuenta()),
					error=>alert("Ocurrio un error inesperado"));
				});
			});
		</script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	<body>
	<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    </div>
		<div id="mainContainerDiv">							
			<jsp:include page="menu3.jsp" /> 
		    <div id="tituloyBarraBusqueda">
		        <div id="tituloTablero">
		            <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;">    Tipo de Ordenes 
		        </div>
			
		    </div>
		    <div id="tableroSytecso">
		        <div id="ventanaBienvenidaSytecso">
		            <div class="contenido">
		                	<h2><img src ="${pageContext.request.contextPath}/img/icono_cuentas.png" > Administracion de Tipo de Ordenes</h2>
		                <div class="columnasSytecso">
							<div>
								<ul>
									<security:authorize access="hasRole('ROLE_USER')">
										<li> 
											<a href="${pageContext.request.contextPath}/irbusqCtaOrden">Alta de Tipo de Ordenes</a> 
										</li>
									</security:authorize>
								</ul>
							</div>   
			      		</div>
		            </div>
		        </div>
		    </div>
	    </div>
	</body>
</html>