<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SMARTBILLING - Sytecso System</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<link href="<c:url value="/css/estiloSmartBilling.css" />"rel="stylesheet">
<link href="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.css" />"	rel="stylesheet">
<link href="<c:url value="/css/jquery.dataTables.min.css" />"	rel="stylesheet">
<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
<script src="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.js" />"></script>
<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
<script src="<c:url value="/js/facturacion/reFactura.js"/>"></script>


<style>
table {
	border: 1px #D8D8D8 solid;
}

thead {
	background: linear-gradient(to bottom, #2E2E2E 3%, #151515 84%);
	color: #D8D8D8;
}

tr:nth-child(even) {
	background-color: #E6E6E6;
}

.letra {
	font-size: 13px;
	color: #1C1C1C;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
}

.letrath {
	font-size: 14px;
	color: white;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
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
			<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> <spring:message  code="label.tittleFact"/>
		</div>
	</div>
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling" align="center">
			<p align="center"> 
					<spring:message  code="label.FactPeriodInfo"/>=<B><%=session.getAttribute("periodoFacCiclo")%></B>
					<spring:message  code="label.FactPeriodInfo2"/>=<B><%=session.getAttribute("periodoFacMes")%></B> <spring:message  code="label.FactPeriodInfo3"/>=<B><%=session.getAttribute("periodoFacAnio")%>.</B>
				</p>
				<button id="reFactura" type="button"  class="w3-button w3-black w3-round-large" style="margin-left: 30px;float:  left;"><spring:message  code="label.FactPeriodReFact"/></button><br/>
			<div id="datos">

				<div id="datosC">
				<br>
						<table id="periodosCuentas" border cellpadding=1 cellspacing=0 width="98%">
							<thead>
								<tr class="letrath">
									<th><spring:message  code="label.FactPeriodTbReFact"/></th>
									<th><spring:message  code="label.FactPeriodTbCta"/></th>
									<th><spring:message  code="label.FactPeriodTbClient"/></th>
									<th><spring:message  code="label.FactPeriodTbNomClien"/></th>
									<th><spring:message  code="label.FactPeriodTbNoFact"/></th>
									<th><spring:message  code="label.FactPeriodTbMonto"/></th>
									<th><spring:message  code="label.FactPeriodTbMontoSinImp"/></th>
									<th><spring:message  code="label.FactPeriodTbCurrency"/></th>
									<th><spring:message  code="label.FactPeriodTbPeriod"/></th>
									<th><spring:message  code="label.FactPeriodTbFactura"/></th>
									<th><spring:message  code="label.FactPeriodTbDetalle"/></th>
									<th><spring:message  code="label.FactPeriodTbDetalle"/></th>
								</tr>
							</thead>
							<c:forEach var="listVal" items="${lstFacDatos}" varStatus="status">
								<tr class="letra">
									<td><input name="reFactura" type="checkbox" value="${listVal.numcuenta}-${listVal.numerofactura}"></td> 
									<td align="center"><B>${listVal.numcuenta}</B></td>
									<td align="center">${listVal.aliascliente} </td>
									<td align="center">${listVal.razonsocial}</td>
									<td align="center"><a
										href="${pageContext.request.contextPath}/obtenDataPeriodoFaContrato?factura=${listVal.numerofactura}"><strong>${listVal.numerofactura}</strong></a></td>
									<td align="center">
										<strong> <fmt:setLocale value="en_US"
											scope="session" /> <fmt:formatNumber value="${listVal.montofactura}"
											type="currency" maxFractionDigits="4" pattern="$#,##0.0###" /></strong>
									</td>
									<td align="center">
									<strong> <fmt:setLocale value="en_US"
											scope="session" /> <fmt:formatNumber value="${listVal.montoitemnoimpuestos}"
											type="currency" maxFractionDigits="4" pattern="$#,##0.0###" /></strong>
									</td>
									<td align="center">${listVal.moneda}</td>
									<td align="center">${listVal.periodo}</td>
									<td align="center"><a href="${pageContext.request.contextPath}/generatePDF?factura=${listVal.numerofactura}&razonSocial=${listVal.razonsocial}&numCuenta=${listVal.numcuenta}"><img src="${pageContext.request.contextPath}/img/pdf_azul.png" height="25" width="25"></a></td>
									<td align="center"><a href="${pageContext.request.contextPath}/generateXLS?factura=${listVal.numerofactura}"><img src="${pageContext.request.contextPath}/img/xls-icono.png"  height="25" width="25"></a></td>
									<td align="center"><a href="${pageContext.request.contextPath}/generateDetallePDF?factura=${listVal.numerofactura}&razonSocial=${listVal.razonsocial}&numCuenta=${listVal.numcuenta}"><img src="${pageContext.request.contextPath}/img/pdf_azul.png"  height="25" width="25"></a></td>
								</tr>
							</c:forEach>
						</table>
					<br> <br> <br>
				</div>
			</div>
		</div>
	</div>
	<div id="datosbotonesComp">
		<div id="botonBack">
			<div class="col-sm-6">
				<a
					href="${pageContext.request.contextPath}/billPeriodoFactura"><img
					src="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
			</div>
		</div>
		<div id="botonHome">
			<div class="col-sm-6">
				<a href="${pageContext.request.contextPath}/principal"><img
					src="${pageContext.request.contextPath}/img/home.png"><spring:message  code="label.NavPrin"/></a>
			</div>
		</div>
	</div>
</body>
</html>