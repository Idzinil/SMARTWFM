<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="headerCompra.jsp" />
<script>
	function periodos() {
		return ${periodos};
	}
	function estatus() {
		return ${estatus};
	}
	$(document).ready(function() {
		actuaCmp(periodos());
		if (estatus() === "CA") {
			$("input").attr("disabled", true);
			$("select").attr("disabled", true);
		}
	});
</script>
<body>
	<div
		style="text-align: right; padding: 5px; margin: 0px; background: #ccc;">
		Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a>
	</div>
	<jsp:include page="menu4.jsp" />
	<div id="barraMenuSmartBilling"></div>
	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="${pageContext.request.contextPath}/img/das.png"
				width="16px" height="16px" style="margin-left: 10px;">
			<spring:message code="label.tittleCompras" />
		</div>
	</div>
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
			<div class="contenido">
				<div class="columnasSmartBilling">
					<jsp:useBean id="now" class="java.util.Date" />
					<div id="divActCompra">
						<h2 align="center">
							<spring:message code="label.CmpFormActActualizaComp" />
						</h2>
						<form:form method="POST" id="actualizarCompra"
							action="${pageContext.request.contextPath}/actualizarCompra?compra=${compra}"
							modelAttribute="actualizarCompra">
							<c:if test="${muestraPeriodo}">
								<div align="center">
									<table id="actPeriodoEscalable"></table>
								</div>
								<hr>
							</c:if>
							<table>
								<tr>
									<td bgcolor="#FFFFFF"><c:if test="${muestraMonto }">
											<form:label type="text" path="montoOverride"
												cssClass="inline">
												<spring:message code="label.CmpFormActMontoOve" />:</form:label>
											<spring:bind path="montoOverride">
												<form:input type="text" path="montoOverride" required="true" />
												<form:errors path="montoOverride" class="control-label" />
											</spring:bind>
										</c:if></td>

									<td bgcolor="#FFFFFF"><form:label path="idClienteEnlace">
											<spring:message code="label.CmpFormActIdClient" />
										</form:label> <form:input type="text" path="idClienteEnlace" /> <form:errors
											path="idClienteEnlace"></form:errors></td>
									<td bgcolor="#FFFFFF"><form:label path="usuario_Final">
											<spring:message code="label.CmpFormActUsrFinal" />: </form:label> <form:input
											type="text" path="usuario_Final" /></td>
									<td bgcolor="#FFFFFF"><form:label path="usuario_Final">
											<spring:message code="label.CmpFormActIdAct" />: <br />
										</form:label> <form:input type="text" path="idActivo" /></td>
								</tr>
								<tr>
									<form:label path="estatus">
										<spring:message code="label.CmpFormActStatusCmp" />:</form:label>
									<spring:bind path="estatus">
										<form:select path="estatus" items="${estatusCompra}"
											style="width:5%">
										</form:select>
									</spring:bind>
								</tr>
								<tr>
									<td bgcolor="#FFFFFF"><form:label path="tipoCircuito">
											<spring:message code="label.CmpFormActTipoCirc" />:<br />
										</form:label> <form:input type="text" path="tipoCircuito" /></td>
									<td bgcolor="#FFFFFF"><form:label path="direccionServicio">
											<spring:message code="label.CmpFormActDirServ" />: </form:label> <form:input
											type="text" path="direccionServicio" /></td>
									<td bgcolor="#FFFFFF"><form:label path="fechaActivacion">
											<spring:message code="label.CmpFormActFechAct" />
										</form:label> <spring:message code="label.CmpFormActMontoOve" var="" /> <spring:message
											code="label.CmpFormActFechActph" var="FechAct" /> <form:input
											type="text" placeholder="${FechAct}" path="fechaActivacion"
											required="true" /></td>
									<td bgcolor="#FFFFFF"><form:label path="plazoContratacion">
											<spring:message code="label.CmpFormActFechFin" />: </form:label> <spring:bind
											path="plazoContratacion">
											<form:input type="text" path="fechaFinCompra" required="true" />
											<form:errors path="plazoContratacion"></form:errors>
										</spring:bind></td>
								</tr>
								<tr>

								</tr>
								<tr>

									<td bgcolor="#FFFFFF"><form:label path="fechaPrimeraFac">
											<spring:message code="label.CmpFormActMesInic" />: </form:label> <spring:bind
											path="fechaPrimeraFac">
											<form:input type="text" path="fechaPrimeraFac" />
											<form:errors path="fechaPrimeraFac" required="true"></form:errors>
										</spring:bind></td>
									<td bgcolor="#FFFFFF"><form:label path="plaza">
											<spring:message code="label.CmpFormActPlaza" />
										</form:label><br /> <form:input type="text" placeholder="Plaza"
											path="plaza" /> <form:errors path="plaza"
											class="control-label"></form:errors></td>
									<td bgcolor="#FFFFFF"><form:label type="text"
											path="nombreProyecto">
											<spring:message code="label.CmpFormActNombProjct" />
										</form:label> <spring:message code="label.CmpFormActNombProjct"
											var="nomProj" /> <form:input type="text"
											placeholder="${nomProj}" path="nombreProyecto" /> <form:errors
											path="nombreProyecto" class="control-label"></form:errors></td>
								</tr>
								<tr>
									<td bgcolor="#FFFFFF"><form:label type="text"
											path="noReferencia">
											<spring:message code="label.CmpFormActNoRef" />
										</form:label> <spring:message code="label.CmpFormActNoRefph" var="numRef" />
										<form:input type="text" placeholder="${numRef}"
											path="noReferencia" disabled="true" /></td>
									<c:set var="currentDay" scope="session">
										<fmt:formatDate value="${now}" pattern="dd" />
									</c:set>
									<c:if test="${currentDay > 1 }">
										<td bgcolor="#FFFFFF"><form:label path="prorrateoCheck">
												<spring:message code="label.CmpFormActProrr" />: </form:label> <form:checkbox
												path="prorrateoCheck" /></td>
									</c:if>
									<td bgcolor="#FFFFFF"><form:label type="text"
											path="ivaCheck" for="checkbox1" cssClass="inline">IVA:</form:label>
										<form:checkbox path="ivaCheck" id="myCheckbox" /></td>
								</tr>
								<tr>

									<td bgcolor="#FFFFFF"><form:label type="text"
											path="iepsCheck" for="checkbox1" cssClass="inline">IEPS:</form:label>
										<form:checkbox path="iepsCheck" id="myCheckbox" /></td>
										<td bgcolor="#FFFFFF" id="descuento"><label><b>Descuento</b></label>
										<form:checkbox path="descuentoCheck" /></td>
								</tr>
							</table>
							<hr>
							<div id="divDescuento">
								<jsp:include page="divDescuentoAlta.jsp" />
								<hr>
							</div>
							<p>
								<label type="text"><b><spring:message
											code="label.CmpFormActPunta" /> A</b></label>
							</p>
							<table>
								<tr>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.numeroPunta">
											<spring:message code="label.CmpFormActNum" />:</form:label> <form:input
											path="direccionPuntasA.numeroPunta"
											style="margin-left: 20px;" type="text" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.pisoPunta">
											<spring:message code="label.CmpFormActPiso" />:<br/></form:label> <form:input
											path="direccionPuntasA.pisoPunta" style="margin-left: 20px;"
											type="text" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.interiorPunta">
											<spring:message code="label.CmpFormActInt" />:</form:label> <form:input
											path="direccionPuntasA.interiorPunta"
											style="margin-left: 20px;" type="text" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.coloniaPunta">
											<spring:message code="label.CmpFormActCol" />:</form:label> <form:input
											path="direccionPuntasA.coloniaPunta" style="margin-left:20px"
											type="text" /></td>
								</tr>
								<tr>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.delegacionPunta">
											<spring:message code="label.CmpFormActDel" /></form:label>:<form:input
											path="direccionPuntasA.delegacionPunta"
											style="margin-left: 20px;" type="text" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.ciudadPunta">
											<spring:message code="label.CmpFormActCity" />:</form:label> <form:input
											path="direccionPuntasA.ciudadPunta" type="text"
											style="margin-left: 20px;" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.estadoPunta">
											<spring:message code="label.CmpFormActEdo" />:</form:label> <form:input
											path="direccionPuntasA.estadoPunta"
											style="margin-left: 20px;" type="text" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.puntaOrigen">
											<spring:message code="label.CmpFormActOrig" />:</form:label> <form:input
											path="direccionPuntasA.puntaOrigen"
											style="margin-left: 20px;" type="text" /></td>
								</tr>
							</table>
							<hr>
							<p>
								<label type="text"><b><spring:message
											code="label.CmpFormActPunta" /> B</b></label>
							</p>
							<table>
								<tr>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.numeroPunta">
											<spring:message code="label.CmpFormActNum" />:</form:label> <form:input
											path="direccionPuntasB.numeroPunta"
											style="margin-left: 20px;" type="text" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.pisoPunta">
											<spring:message code="label.CmpFormActPiso" />:<br/></form:label> <form:input
											path="direccionPuntasB.pisoPunta" style="margin-left: 20px;"
											type="text" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.interiorPunta">
											<spring:message code="label.CmpFormActInt" />:</form:label> <form:input
											path="direccionPuntasB.interiorPunta"
											style="margin-left: 20px;" type="text" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.coloniaPunta">
											<spring:message code="label.CmpFormActCol" />:</form:label> <form:input
											path="direccionPuntasB.coloniaPunta" style="margin-left:20px"
											type="text" /></td>
								</tr>
								<tr>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.delegacionPunta">
											<spring:message code="label.CmpFormActDel" />:</form:label> <form:input
											path="direccionPuntasB.delegacionPunta"
											style="margin-left: 20px;" type="text" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.ciudadPunta">
											<spring:message code="label.CmpFormActCity" />:</form:label> <form:input
											path="direccionPuntasB.ciudadPunta" type="text"
											style="margin-left: 20px;" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.estadoPunta">
											<spring:message code="label.CmpFormActEdo" />:</form:label> <form:input
											path="direccionPuntasB.estadoPunta"
											style="margin-left: 20px;" type="text" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.puntaDestino">
											<spring:message code="label.CmpFormActDest" />:</form:label> <form:input
											path="direccionPuntasB.puntaDestino"
											style="margin-left: 20px;" type="text" /></td>
								</tr>
								<tr>
									<td bgcolor="#FFFFFF"></td>
									<td bgcolor="#FFFFFF" align="center"><label type="text">
											<spring:message code="label.CmpFormBtActualizar" var="Act" />
											<input id="btnActCompra"
											class="w3-button w3-black w3-round-large" value="${Act}"
											style="margin-left: -100px;" type="button">
									</label></td>
									<td bgcolor="#FFFFFF" align="center"><spring:message
											code="label.CmpFormBtActCancelar" var="Cancel" /> <input
										value="${Cancel}" class="w3-button w3-black w3-round-large"
										type="button" id="btnCancelCompra" /></td>
									<td bgcolor="#FFFFFF"></td>
								</tr>
							</table>
							<form:hidden path="descuento2.idDescuento"/>
							<form:hidden path="direccionPuntasA.idDireccionPuntas"/>
							<form:hidden path="direccionPuntasB.idDireccionPuntas"/>
							<form:hidden path="producto_idProducto"/>
							<form:hidden path="producto.tipoCargo"/>

						</form:form>

						<c:if test="${estatus}">
							<label>${msg}: </label>&nbsp;<a
								href="${pageContext.request.contextPath }/compras"><spring:message
									code="label.CmpFormBtActComprtas" /></a>
						</c:if>

					</div>
				</div>
				<div id="datosbotonesComp">
					<div id="botonBack">
						<div class="col-sm-6">

							<a href="${pageContext.request.contextPath}/compras"><img
								src="${pageContext.request.contextPath}/img/regresar.png">
							<spring:message code="label.NavRegresar" /></a>
						</div>
					</div>
					<div id="botonHome">
						<div class="col-sm-6">

							<a href="${pageContext.request.contextPath}/principal"> <img
								src="${pageContext.request.contextPath}/img/home.png">
							<spring:message code="label.NavPrin" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

