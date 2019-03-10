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
       		SMARTBILLING - Sytecso System
    	</title>
		<link href="<c:url value="/css/estiloSmartBilling.css" />" 	rel="stylesheet">
		<script type="text/javascript">
		function redir(url){window.location=url;}
		</script>
		
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
										<th  ><spring:message  code="label.AdjFactTbDep"/> </th>
										<th  ><spring:message  code="label.AdjFactTbNoFact"/> </th>
										<th  ><spring:message  code="label.AdjFactTbMontoFact"/> </th>
										<th  ><spring:message  code="label.AdjFactTbDeudaFact"/> </th>
										<th  ><spring:message  code="label.AdjFactTbMonedaFact"/> </th>
									</tr>
							 </thead>
								<c:forEach items="${itemsFactura}" var="itemsValue">
									<tr class="letraPrincipal">
										<td><c:out value="${itemsValue.cuenta.numCuenta}" /></td>
										<td><c:out value="${itemsValue.cuenta.aliasCliente}" /></td>
										<td><c:out value="${itemsValue.cuenta.unidadFacturacion.datosFiscales.razonSocial}" /></td>
										<td><c:out value="${itemsValue.cuenta.region}" /></td>
										<td><b><a href="#"onClick="redir('${pageContext.request.contextPath}/FacturaAjuste?factura=${itemsValue.factura.numeroFactura}')"><c:out value="${itemsValue.factura.numeroFactura}" /></a></b>
										<td>
										<fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${itemsValue.factura.montoFactura}" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" />
       									</td>
										<td>
										<fmt:setLocale value="en_US" scope="session" /> <fmt:formatNumber
											value="${itemsValue.factura.deudaFactura}" type="currency"
											maxFractionDigits="3" pattern="$#,##0.0##" />
       									</td>
										<td><c:out value="${itemsValue.moneda}" /> </td>
										
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
						
						<a href="${pageContext.request.contextPath }/irAjustes"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
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
