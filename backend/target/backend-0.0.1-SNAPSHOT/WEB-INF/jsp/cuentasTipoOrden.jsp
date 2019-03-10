<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<html>
	<head>
		<title>
       		Sytecso - SmartField
    	</title>
		<link href="<c:url value="/css/estiloSytecso.css" />" 	rel="stylesheet">
		<script type="text/javascript">
		function redir(url){window.location=url;}
		</script>
		
	</head>
	<body>
		<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
		<jsp:include page="menu3.jsp" /> 
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> Tipos de Ordenes
		    </div>
		</div>
		<div id="tableroSytecso">
	    	<div id="ventanaSytecso">	
	        	<div class="contenido">
	      	 		<div class="datos">
						<div class="datosForm1">
							 <spring:message  code="label.AdjFactResult"/>
							 <br />
			<br />
			 <br />
			<br />
							 <table style="width: 80%" id="test" align="center"class="tablePrincipal" >
								<thead  class="theadPrincipal" >
									 <tr class="letrathPrincipal">
										<th  ><spring:message  code="label.AdjFactTbNoClient"/> </th>
										<th ><spring:message  code="label.AdjFactTbAlClien"/> </th>
										<th  ><spring:message  code="label.AdjFactTbNomClien"/> </th>
										<th  ><spring:message  code="label.AdjFactTbNoClient"/> </th>
									</tr>
							 </thead>
								<c:forEach items="${ctasTipoOrden}" var="itemsValue">
									<tr class="letraPrincipal">
									<td>
										<b><a href="#"onClick="redir('${pageContext.request.contextPath}/cuentaTipoForm?cuenta=${itemsValue.cuenta.numCuenta}')">
									    	 <c:out value="${itemsValue.cuenta.numCuenta}" /></a>
									    </b>
									</td>    
										<td><c:out value="${itemsValue.cuenta.aliasCliente}" /></td>
										<td><c:out value="${itemsValue.cuenta.datosFiscales.rfc}" /></td>
										<td><c:out value="${itemsValue.cuenta.datosFiscales.razonSocial}" /></td>
										
										
									</tr>
								</c:forEach>
							</table>	
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="datosbotonesComp">
			<div id="botonBack">
					<div class="col-sm-6">
						
						<a href="${pageContext.request.contextPath }/irbusqCtaOrden"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
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
