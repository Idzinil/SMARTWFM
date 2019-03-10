<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<title>SMARTBILLING - Sytecso System</title>
</head>
<body>
	<div
		style="text-align: right; padding: 5px; margin: 0px; background: #ccc;">
		Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a>
	</div>
	<jsp:include page="headerCompra.jsp" />
	<jsp:include page="menu4.jsp" />
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
					<div align="center" id="divRegistroCompra">
						<p>
							<label><spring:message code="label.CmpFormInfo" /></label>
						</p>
						<p>
							<label><b><spring:message code="label.CmpFormDtosCmp" /></b></label>
						</p>
						<form:form method="POST" id="formAltaCompra"
							action="${pageContext.request.contextPath}/altaCompra"
							modelAttribute="compra" style="height: 112.5px;">
							<c:if test="${muestraPeriodo}">
								<div align="center">
									<table id="periodoEscalable" align="center"></table>
								</div>
								<hr>
							</c:if>

							<table>
								<tr>
									<c:if test="${pato}">
										<c:if test="${muestracargoCME}">
											<td bgcolor="#FFFFFF"><form:label path="montoOverride">
													<spring:message code="label.CmpFormMOve" />: </form:label> <spring:bind
													path="montoOverride">
													<form:input type="text" path="montoOverride"
														required="true" placeholder="0.0" />
													<form:errors path="montoOverride" class="control-label" />
												</spring:bind></td>

										</c:if>
										<td bgcolor="#FFFFFF"><form:label path="idClienteEnlace">
												<spring:message code="label.CmpFormIdClientEnl" />: </form:label> <spring:bind
												path="idClienteEnlace">
												<spring:message code="label.CmpFormIdClientEnl"
													var="clienteEnl" />
												<form:input type="text" placeholder="${clienteEnl}"
													path="idClienteEnlace" required="true" />
												<form:errors path="idClienteEnlace"></form:errors>
											</spring:bind></td>
										<td bgcolor="#FFFFFF"><form:label path="orderId">
												<spring:message code="label.CmpFormOrderId" />: </form:label><br /> <spring:bind
												path="orderId">
												<spring:message code="label.CmpFormOrderId" var="orderID" />
												<form:input type="text" placeholder="${orderID}"
													path="orderId" required="true" />
												<form:errors path="orderId" class="control-label" />
											</spring:bind></td>
									</c:if>
								</tr>

								<tr>

								</tr>
								<tr>
									<td bgcolor="#FFFFFF"><form:label path="moneda">
											<spring:message code="label.CmpFormMoneda" />: </form:label><br /> <spring:bind
											path="moneda">
											<select id="selectMoneda" name="moneda" width="20px"
												class="selectMoneda">
												<option value="MXN">MXN</option>
												<option value="USD">USD</option>
											</select>
											<form:errors path="moneda" class="control-label" />
										</spring:bind></td>
									<td bgcolor="#FFFFFF"><form:label path="usuario_Final">
											<spring:message code="label.CmpFormUsrFinal" />: </form:label><br /> <spring:message
											code="label.CmpFormUsrFinal" var="usrFinal" /> <form:input
											type="text" placeholder="${usrFinal}" path="usuario_Final" /></td>
									<td bgcolor="#FFFFFF"><form:label path="idActivo">
											<spring:message code="label.CmpFormIDAct" />: </form:label><br /> <spring:message
											code="label.CmpFormIDAct" var="IDAct" /> <form:input
											type="text" placeholder="${IDAct}" path="idActivo" /></td>
								</tr>
								<tr>

									<td bgcolor="#FFFFFF"><form:label path="tipoCircuito">
											<spring:message code="label.CmpFormTipoC" />: </form:label><br /> <spring:message
											code="label.CmpFormTipoC" var="TipCirc" /> <form:input
											type="text" placeholder="${TipCirc}" path="tipoCircuito" /></td>
									<td bgcolor="#FFFFFF"><form:label path="direccionServicio">
											<spring:message code="label.CmpFormDirServ" />: </form:label> <spring:message
											code="label.CmpFormDirServph" var="DirServ" /> <form:input
											type="text" placeholder="${DirServ}" path="direccionServicio" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="descripcionOverride">
											<spring:message code="label.CmpFormDscOve" />: </form:label> <spring:message
											code="label.CmpFormDscOveph" var="DscOve" /> <form:input
											type="text" placeholder="${DscOve}"
											path="descripcionOverride" /></td>
								</tr>
								<tr>

								</tr>
								<tr>
									<td bgcolor="#FFFFFF"><form:label path="fechaFinCompra">
											<spring:message code="label.CmpFormFecFin" />: </form:label><br /> <spring:bind
											path="fechaFinCompra">
											<form:input type="text" placeholder="Meses"
												path="fechaFinCompra" disabled="${tipoCargo }" />
											<form:errors path="fechaFinCompra"></form:errors>
										</spring:bind></td>
									<td bgcolor="#FFFFFF"><spring:bind path="tipoCambio">
											<div id="divTipoCambio">
												<form:label path="tipoCambio">
													<spring:message code="label.CmpFormTipCamb" />: </form:label>
												<br />
												<spring:message code="label.CmpFormTipCamb" var="TipoCam" />
												<form:input type="text" placeholder="${TipoCam}"
													path="tipoCambio" />
												<form:errors path="tipoCambio"></form:errors>
											</div>
										</spring:bind></td>
										<c:if test="${muestraFacturaCada }">
										<td bgcolor="#FFFFFF"><form:label type="text"
												path="facturaCada">
												<spring:message code="label.CmpFormFactCada" />
											</form:label> <spring:message code="label.CmpFormFactCada" var="FactCada" />
											<form:input type="text" placeholder="${FactCada}"
												path="facturaCada" /></td>
									</c:if>	
										<c:if test="${fechaPriFac}">
										<td bgcolor="#FFFFFF"><form:label path="fechaPrimeraFac">
												<spring:message code="label.CmpFormMesIniFac" />: </form:label> <spring:bind
												path="fechaPrimeraFac">
												<spring:message code="label.CmpFormMesIniFac" var="IniFac" />
												<form:input type="text" placeholder="${IniFac}"
													path="fechaPrimeraFac" disabled="${tipoCargo }" />
												<form:errors path="fechaPrimeraFac"></form:errors>
											</spring:bind></td>
									</c:if>
								</tr>

								<tr>
									<td bgcolor="#FFFFFF"><form:label path="idContrato">
											<spring:message code="label.CmpFormIdCont" />: </form:label><br /> <spring:bind
											path="idContrato">
											<spring:message code="label.CmpFormIdCont" var="IdCont" />
											<form:input type="text" placeholder="${IdCont}"
												path="idContrato" required="true" />
											<form:errors path="idContrato" class="control-label"></form:errors>
										</spring:bind></td>
									<td bgcolor="#FFFFFF"><form:label type="text" path="nombreProyecto">
											<spring:message code="label.CmpFormNombProy" />
										</form:label> <spring:message code="label.CmpFormNombProy" var="Proyect" />
										<form:input type="text" placeholder="${Proyect}"
											path="nombreProyecto" /> <form:errors path="nombreProyecto"
											class="control-label"></form:errors></td>
									<td bgcolor="#FFFFFF"><form:label type="text"
											path="fechaActivacion">
											<spring:message code="label.CmpFormFechAct" />
										</form:label> <spring:bind path="fechaActivacion">
											<spring:message code="label.CmpFormFechActph" var="FechAct" />
											<form:input type="text" placeholder="${FechAct}"
												path="fechaActivacion" disabled="${tipoCargo }" />
											<form:errors path="fechaActivacion" class="control-label"></form:errors>
										</spring:bind></td>		
								</tr>
								<tr>
									<td bgcolor="#FFFFFF"><form:label type="text" path="plaza">
											<spring:message code="label.CmpFormPlaza" />
										</form:label> <spring:message code="label.CmpFormPlaza" var="plaza" /> <form:input
											type="text" placeholder="${plaza}" path="plaza" /> <form:errors
											path="plaza" class="control-label"></form:errors></td>
									<td bgcolor="#FFFFFF"><form:label type="text"
											path="clasificacion">
											<spring:message code="label.CmpFormClas" />
										</form:label> <spring:message code="label.CmpFormClasph" var="clasi" /> <form:input
											type="text" placeholder="${clasi}" path="clasificacion" /> <form:errors
											path="clasificacion" class="control-label"></form:errors></td>
									<td bgcolor="#FFFFFF" align="left">
										<form:label type="text"	path="noReferencia" for="checkbox1" cssClass="inline">
										<spring:message code="label.CmpFormNoRef" />:</form:label>
										<spring:message code="label.CmpFormNoRefph" var="NoRef" /> 
										<form:input	path="noReferencia" placeholder="${NoRef}" /> 
										<c:set	var="currentDay" scope="session">
										<fmt:formatDate value="${now}" pattern="dd" />
										</c:set>
									</td>		
								</tr>
								<tr>
 
										<c:if test="${currentDay > 1 }">
											<td bgcolor="#FFFFFF"><form:label type="text"		path="prorrateoCheck" for="checkbox1" cssClass="inline">
											<spring:message code="label.CmpFormProrr" />:</form:label> 
											<form:checkbox	path="prorrateoCheck" id="myCheckbox" disabled="${tipoCargo }" />
											</td>
										</c:if>
									<td bgcolor="#FFFFFF" align="left"><form:label type="text"
											path="ivaCheck" for="checkbox1" cssClass="inline">IVA:</form:label>
										<form:checkbox path="ivaCheck" id="myCheckbox" /></td>
									<td bgcolor="#FFFFFF"><form:label type="text"
											path="iepsCheck" for="checkbox1" cssClass="inline">IEPS:</form:label>
										<form:checkbox path="iepsCheck" id="myCheckbox" /></td>	
								</tr>
								<tr>
									<td bgcolor="#FFFFFF" id="descuento"><label><b>Descuento</b></label>
										<form:checkbox path="descuentoCheck" /></td>
									
										
								</tr>
							</table>
							<hr>
							
								<jsp:include page="divDescuentoAlta.jsp" />

							<p>
								<label><b><spring:message code="label.CmpFormPunta" />
										A</b></label>
							</p>
							<table>
								<tr>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.numeroPunta">
											<spring:message code="label.CmpFormNum" />:</form:label> <spring:message
											code="label.CmpFormNumph" var="num" /> <form:input
											placeholder="${num}" style="margin-left: 18px;" type="text"
											path="direccionPuntasA.numeroPunta" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.pisoPunta">
											<spring:message code="label.CmpFormPiso" />:</form:label><br /> <spring:message
											code="label.CmpFormPiso" var="piso" /> <form:input
											placeholder="${piso}" style="margin-left: 18px;" type="text"
											path="direccionPuntasA.pisoPunta" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.interiorPunta">
											<spring:message code="label.CmpFormInt" />:</form:label> <spring:message
											code="label.CmpFormInt" var="inter" /> <form:input
											placeholder="${inter}" style="margin-left: 18px;" type="text"
											path="direccionPuntasA.interiorPunta" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.coloniaPunta">
											<spring:message code="label.CmpFormCol" />:</form:label> <spring:message
											code="label.CmpFormCol" var="col" /> <form:input
											placeholder="${col}" style="margin-left:18px" type="text"
											path="direccionPuntasA.coloniaPunta" /></td>
								</tr>
								<tr>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.delegacionPunta">
											<spring:message code="label.CmpFormDel" />:</form:label> <spring:message
											code="label.CmpFormDelph" var="Delg" /> <form:input
											placeholder="${Delg}" style="margin-left: 18px;" type="text"
											path="direccionPuntasA.delegacionPunta" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.ciudadPunta">
											<spring:message code="label.CmpFormCiudad" />:</form:label> <spring:message
											code="label.CmpFormCiudad" var="Ciudad" /> <form:input
											type="text" placeholder="${Ciudad}"
											style="margin-left: 18px;"
											path="direccionPuntasA.ciudadPunta" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.estadoPunta">
											<spring:message code="label.CmpFormEdo" />:</form:label> <spring:message
											code="label.CmpFormEdo" var="Edo" /> <form:input
											placeholder="${Edo}" style="margin-left: 18px;" type="text"
											path="direccionPuntasA.estadoPunta" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasA.puntaOrigen">
											<spring:message code="label.CmpFormOrig" />:</form:label> <spring:message
											code="label.CmpFormOrig" var="Origen" /> <form:input
											placeholder="${Origen}" style="margin-left: 18px;"
											type="text" path="direccionPuntasA.puntaOrigen" /></td>
								</tr>
							</table>
							<hr>
							<p>
								<label><b><spring:message code="label.CmpFormPunta" />
										B</b></label>
							</p>
							<table>
								<tr>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.numeroPunta">
											<spring:message code="label.CmpFormNum" />:</form:label> <spring:message
											code="label.CmpFormNumph" var="num" /> <form:input
											placeholder="${num }" style="margin-left: 18px;" type="text"
											path="direccionPuntasB.numeroPunta" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.pisoPunta">
											<spring:message code="label.CmpFormPiso" />:</form:label><br /> <spring:message
											code="label.CmpFormPiso" var="piso" /> <form:input
											placeholder="${piso}" style="margin-left: 18px;" type="text"
											path="direccionPuntasB.pisoPunta" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.interiorPunta">
											<spring:message code="label.CmpFormInt" />:</form:label> <spring:message
											code="label.CmpFormInt" var="Int" /> <form:input
											placeholder="${Int}" style="margin-left: 18px;" type="text"
											path="direccionPuntasB.interiorPunta" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.coloniaPunta">
											<spring:message code="label.CmpFormCol" />:</form:label> <spring:message
											code="label.CmpFormCol" var="col" /> <form:input
											placeholder="${col }" style="margin-left:18px" type="text"
											path="direccionPuntasB.coloniaPunta" /></td>
								</tr>
								<tr>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.delegacionPunta">
											<spring:message code="label.CmpFormDel" />:</form:label> <spring:message
											code="label.CmpFormDelph" var="Del" /> <form:input
											placeholder="${Del}" style="margin-left: 20px;" type="text"
											path="direccionPuntasB.delegacionPunta" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.ciudadPunta">
											<spring:message code="label.CmpFormCiudad" />:</form:label> <spring:message
											code="label.CmpFormCiudad" var="city" /> <form:input
											type="text" placeholder="${city}" style="margin-left: 18px;"
											path="direccionPuntasB.ciudadPunta" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.estadoPunta">
											<spring:message code="label.CmpFormEdo" />:</form:label> <spring:message
											code="label.CmpFormEdo" var="edo" /> <form:input
											placeholder="${edo}" style="margin-left: 20px;" type="text"
											path="direccionPuntasB.estadoPunta" /></td>
									<td bgcolor="#FFFFFF"><form:label
											path="direccionPuntasB.puntaDestino">
											<spring:message code="label.CmpFormDestino" />:</form:label> <spring:message
											code="label.CmpFormDestino" var="Destino" /> <form:input
											placeholder="${Destino}" style="margin-left: 20px;"
											type="text" path="direccionPuntasB.puntaDestino" /></td>
								</tr>
								<form:hidden path="producto.tipoCargo" />
								<tr>
									<td bgcolor="#FFFFFF"></td>
									<td bgcolor="#FFFFFF" align="center"><label> <spring:message
												code="label.CmpFormBtComprar" var="comprar" /> <input
											class="w3-button w3-black w3-round-large" value="${comprar}"
											style="margin-left: -100px;" type="submit"></label></td>
									<td bgcolor="#FFFFFF" align="center"><spring:message
											code="label.CmpFormBtCancelar" var="cancelar" /> <input
										value="${cancelar}" class="w3-button w3-black w3-round-large"
										type="submit" onclick=window.location="${pageContext.request.contextPath }/compras">
									</td>
									<td bgcolor="#FFFFFF"></td>
								</tr>
							</table>
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

										<a href="${pageContext.request.contextPath}/principal"><img
											src="${pageContext.request.contextPath}/img/home.png">
											<spring:message code="label.NavPrin" /></a>
									</div>
								</div>
							</div>
						</form:form>



					</div>
				</div>
			</div>
		</div>
	</div>
</body>