<!DOCTYPE html>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>SMARTBILLING - Sytecso System</title>
<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
<script src="js/jquery-1.12.4.js"></script>
<script src="js/SmartBilling/smartBilling.js"></script>
<script src="js/facturacion/pantallaPrincipalBilling.js"></script>
<script src="js/utils/UrlUtils.js"></script>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	text-align: left;
	padding: 8px;
}

thead {
	background: linear-gradient(to bottom, #2E2E2E 3%, #151515 84%);
	color: #D8D8D8;
}

tr:nth-child(even) {
	background-color: #E6E6E6;
}

.letra {
	font-size: 15px;
	color: #1C1C1C;
	font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
		'Lucida Sans', Arial, sans-serif;
}

			.letrath {
				font-size: 14px;
				color:white !important;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
</style>
</head>
<body>
	        <div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
	<%
		int fact = 0;
	%>
	<jsp:include page="menu3.jsp" />

	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero"><img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left: 10px;"><spring:message  code="label.tittleFact"/></div>
	</div>

	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
			<div class="contenido">
					<div id="datos">
						<div id="datosForm1">

							<table style="width: 80%" class="letrath">
								<tr>
									<td class="letrath" bgcolor="#2584A7"><spring:message  code="label.FactBillResultNoCta"/>:</td>
									<td class="letrath" bgcolor="#2584A7">
									<input class="resIni" id="cuenta"/></td>
									<td class="letrath" bgcolor="#2584A7"><spring:message  code="label.FactBillResultDept"/>:</td>
									<td class="letrath" bgcolor="#2584A7">
									<input class="resIni" id="departamento"/></td>
								</tr>



								<tr>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">
										<button id="btnBillginFiltroBuscar"/><spring:message  code="label.FactBillResultBtnBuscar"/></button>
									</td>
									<td bgcolor="#2584A7">&nbsp;</td>
									<td bgcolor="#2584A7">
										<button id="btnBillgLimpiarFiltro"/><spring:message  code="label.FactBillResultBtnLim"/></button>
									</td>									
								</tr>
								<tr>
									<td bgcolor="#2584A7">
										<div id="errMsg"></div>
									</td>
									<td bgcolor="#2584A7"></td>
								</tr>
							</table>
						</div>
					</div>
			</div>

			<br /> <br />

			<c:if test="${success != 'success'}">
				<p><spring:message  code="label.FactBillResultInfoEmp"/>.</p>
			</c:if>
			<c:if test="${success == 'success'}">
			<div id="divUno">

					<table style="width: 80%" id="test" border="0" class="letrath"
						align="center">
						<thead  class="letrath">
							<tr>
								<th><spring:message  code="label.FactBillResultTbNoCta"/></th>
								<th><spring:message  code="label.FactBillResultTbAlias"/></th>
								<th><spring:message  code="label.FactBillResultTbNomb"/></th>
								<th><spring:message  code="label.FactBillResultTbDep"/></th>
								<th><spring:message  code="label.FactBillResultTbFact"/></th>
								<th><spring:message  code="label.FactBillResultTbFech"/></th>

							</tr>
						</thead>
						<tbody id="fBody">
							<c:forEach var="listVar" items="${mpBill}" varStatus="status">
							
								<tr class="letra">
									<td id="cuenta">
										<u><a href="${pageContext.request.contextPath}/buscaDatosCuentaFacturar/<%=fact = fact + 1%>">${listVar.numCuenta}</a></u>
									</td>
									<td>${listVar.aliasCliente}</td>
									<td>${listVar.unidadFacturacion.datosFiscales.razonSocial}</td>
									<td id="departamento"><c:out value="${listVar.region}" /></td>
									<td align="center">
										<input type="checkbox" 
										<c:if test="${listVar.facThisAccount ==null || listVar.facThisAccount=='YES' }">	checked="checked"</c:if>
											name="facturar" id="facturar" value="${listVar.numCuenta}">
									</td>
									<td>
										<c:if test="${listVar.ciclo==1}">
											<c:out value="${listVar.unidadFacturacion.fechaUltimaFacturacionRecurrente}" />
										</c:if>
										<c:if test="${listVar.ciclo==21}">
											<c:out value="${listVar.unidadFacturacion.fechaUltimaFacturacionNoRecurrente}" />
										</c:if>
									</td>
									
								</tr>
								<tr>
								</tr>
								<tr>
	
								</tr>
							</c:forEach>
							<td bgcolor="#ffffff"></td>
							<td bgcolor="#ffffff"></td>
						</tbody>	

					</table>
					<table>
					<td bgcolor="#ffffff"></td>
					<td bgcolor="#ffffff"></td>
						<td bgcolor="#ffffff" style=" width: 10%;">
								<button id="actualizarCuentasFacturar" style="margin-left: 50px;"
									class="w3-button w3-black w3-round-large" type="submit"><spring:message  code="label.FactBillResultBtnAct"/></button>
							</td>
							<td bgcolor="#ffffff" style=" width: 10%;">
								<form:form id="doPreciclo" action="${pageContext.request.contextPath}/viewCSV" method="GET">
								<spring:message  code="label.FactBillResultBtnPrec" var="btnPre"/>
										<input style="margin-left: 50px;"
											class="w3-button w3-black w3-round-large" type="submit" value="${btnPre }"/>
								</form:form>
							</td>
							
							<td bgcolor="#ffffff">
								<form:form id="doFactura" action="${pageContext.request.contextPath}/facturar" method="POST">
								<spring:message  code="label.FactBillResultBtnFact" var="btnFact"/>
									<input type="submit" class="w3-button w3-black w3-round-large" value="${btnFact }">
								</form:form>	
							</td>
					</table>

				</div>
			
			</c:if>
			<c:if test="${ test}">
				alert("${msg }")
			</c:if>

			<div id="datosbotones1"></div>
		</div>
	</div>
	<div id="datosbotonesComp">
		<div id="botonBack">
			<div class="col-sm-6">

				<a href="${pageContext.request.contextPath}/billInicio"><img
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
