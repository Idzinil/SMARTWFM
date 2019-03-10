<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SmartBilling - RedIt</title>
<link rel="stylesheet" type="text/css"	href="<c:url value = "/css/estiloSmartBilling.css"/>">
<link rel="stylesheet" type="text/css"	href="<c:url value = "/css/secciones.css"/>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="<c:url value="/js/jquery-1.12.4.js"/>"></script>
<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
<script src="<c:url value="/js/principal/principal.js"/>"></script>
<script src="<c:url value="/js/cuentas/actualizaCuenta.js"/>"></script>
</head>
<body>
	<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    </div>
	<jsp:include page="${menu }" />
	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> <spring:message    code="label.CtaAct" />
		</div>

	</div>
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
			<div id="mainContent">
				<div id="datos">
					<form:form modelAttribute="cuenta2"
						action="${pageContext.request.contextPath.concat(path)}"
						method="POST" id="formCuenta">

						<div id="datosCuenta">
							<fieldset>
							<spring:message    code="label.CtaFormCampObligatorio" var="CampObli" />
								<legend align="left"><spring:message    code="label.CtaFormCuenta" /></legend>
								<form:label path="numCuenta" type="text">
									<b><spring:message    code="label.CtaFormNoClient" /> *</b>
								</form:label>
								<abbr title="${CampObli}"> <form:label
										path="numCuenta" type="text"
										style="background-color:#E6E6FA;border-radius: 5px;">
										<b>${cuenta2.numCuenta} </b>
									</form:label>
								</abbr>

								<form:label type="text" path="tipocuenta">
									<b><spring:message    code="label.CtaFormTipoClient" /></b>
								</form:label>
								<spring:message    code="label.CtaFormTipoClient" var="tipoClient" />
								<form:input type="text" path="tipocuenta"
									placeholder="${tipoClient}" />

								<form:label type="text" path="idClienteSam">
									<b><spring:message    code="label.CtaFormIdClient" /></b>
								</form:label>
								<spring:message    code="label.CtaFormIdClient" var="idClient" />
								<form:input type="text" path="idClienteSam"
									placeholder="${idClient}" />

								<form:label type="text" path="aliasCliente">
									<b><spring:message    code="label.CtaFormAliasClient"  /></b>
								</form:label>
								<abbr title="${CampObli}"> 
								<spring:message    code="label.CtaFormAliasClient" var="aliasClient" />
								<form:input type="text" path="aliasCliente" id="aliasClienteJs" placeholder="${aliasClient}" />
								</abbr>

								<form:label type="text" path="region">
									<b><spring:message    code="label.CtaFormReg"  /></b>
								</form:label>
								<abbr title="${CampObli}">
								<spring:message    code="label.CtaFormRegph" var="Region" />
								 <form:input type="text" path="region" id="regionJs" placeholder="${Region}" /> 
								 <abbr title="${CampObli}">
								  <form:label type="text"
											path="Gerencia">
											<b><spring:message    code="label.CtaFormGer"  /></b>
										</form:label> 
										<spring:message    code="label.CtaFormGer" var="Ger" />
										<form:input type="text" path="gerencia" id="gerenciaJs"
											placeholder="${Ger}" /> <form:label type="text"
											path="departamento">
											<b>	<spring:message    code="label.CtaFormDep"  /></b>
										</form:label> 
											<spring:message    code="label.CtaFormDep" var="Dep" />
										<form:input type="text" path="departamento"
											id="departamentoJs" placeholder="${Dep}" /> <form:label
											type="text" path="paisCtaNacional">
											<b><spring:message    code="label.CtaFormNac"  /></b>
										</form:label> 
										<spring:message    code="label.CtaFormNac" var="NacCta" />
										<form:input type="text" path="paisCtaNacional"
											id="paisCtaNacionalJs" placeholder="${NacCta}" /> <form:label
											type="text" path="ejecutivo">
											<b><spring:message    code="label.CtaFormEjec" /> *</b>
										</form:label> 
										<spring:message    code="label.CtaFormEjec" var="EjecCta" />
										<form:input type="text" path="ejecutivo" id="ejecutivoJs"
											placeholder="${EjecCta}" required="true" /> <form:label
											type="text" path="cuentaPadre"><spring:message    code="label.CtaFormPadre" /></form:label>
											<spring:message    code="label.CtaFormPadre" var="PadreCta" />
											 <form:input type="text" path="cuentaPadre" id="cuentaPadreJs"
											placeholder="${PadreCta}" />
							</fieldset>
						</div>
						<div id="datosFiscales">
							<fieldset>
								<legend align="left"><spring:message    code="label.CtaFormDatosFisc" /></legend>


								<label type="text"><b><spring:message    code="label.CtaFormRFC" /> *</b></label> <abbr
									title="${CampObli}"> 
									<spring:message    code="label.CtaFormRFC" var="RFc" />
									<form:input id="rfc"
										placeholder="${RFc}" type="text"
										path="unidadFacturacion.datosFiscales.rfc" required="true" />
								</abbr> <label type="text"><b><spring:message    code="label.CtaFormRazonSoc" /></b></label> <abbr
									title="${CampObli}">
									<spring:message    code="label.CtaFormRazonSocph" var="RazonSoc" />
									 <form:input placeholder="${RazonSoc }" type="text"
										path="unidadFacturacion.datosFiscales.razonSocial" />
								</abbr> <label type="text"><b><spring:message    code="label.CtaFormCalle" /> *</b></label>
								<spring:message    code="label.CtaFormCalle" var="Calle" />
								<form:input id="calle" placeholder="${CtaFormCalle } Fiscal" type="text"
									path="unidadFacturacion.datosFiscales.calle" required="true" />

								<label type="text"><b><spring:message    code="label.CtaFormNumInt"  /></b></label>
								<spring:message    code="label.CtaFormNumIntph" var="noInt" />
								<form:input placeholder="${noInt }" type="text"
									path="unidadFacturacion.datosFiscales.numeroInt" />

								<label type="text"><b><spring:message    code="label.CtaFormNumExt"  /></b></label>
								<spring:message    code="label.CtaFormNumExtph" var="noExt" />
								<form:input placeholder="${noExt}" type="text"
									path="unidadFacturacion.datosFiscales.numeroExt" />

								<label type="text"><b>	<spring:message    code="label.CtaFormCol"  /> *</b></label>
								<spring:message    code="label.CtaFormCol" var="Col" />
								<form:input id="colonia" placeholder="${Col} " type="text"
									path="unidadFacturacion.datosFiscales.colonia" required="true" />

								<label type="text"><b><spring:message    code="label.CtaFormMun" /></b></label>
								<spring:message    code="label.CtaFormMun" var="Mun" />
								<form:input placeholder="${Mun}" type="text"
									path="unidadFacturacion.datosFiscales.municipio" />

								<label type="text"><b><spring:message    code="label.CtaFormCiudad"/> *</b></label>
								<spring:message    code="label.CtaFormCiudad" var="city" />
								<form:input id="ciudad" placeholder="${city}" type="text"
									path="unidadFacturacion.datosFiscales.ciudad" required="true" />

								<label type="text"><b><spring:message    code="label.CtaFormEstado"/> *</b></label>
								<spring:message    code="label.CtaFormEstado" var="state" />
								<form:input id="estado" placeholder="${state}" type="text"
									path="unidadFacturacion.datosFiscales.estado" required="true" />

								<label type="text"><b><spring:message    code="label.CtaFormPais"  /> *</b></label> <abbr
									title="${CampObli}"> 
									<spring:message    code="label.CtaFormPaisph" var="pais" />
									<form:input id="pais" placeholder="${pais}" type="text"
										path="unidadFacturacion.datosFiscales.pais" />
								</abbr> <label type="text"><b><spring:message    code="label.CtaFormCP"  /> *</b></label>
								<spring:message    code="label.CtaFormCPph" var="CP" />
								<form:input id="codigoPostal" placeholder="${CP}"
									type="text" path="unidadFacturacion.datosFiscales.codigoPostal"
									required="true" />

								<form:input type="hidden" path="idCuenta" placeholder="idCuenta" />
								<form:input type="hidden"
									path="unidadFacturacion.datosFiscales.iddatosFiscales"
									placeholder="unidadFacturacion.datosFiscales.iddatosFiscales" />
								<form:input type="hidden" path="numCuenta"
									placeholder="numCuenta" />
							</fieldset>
						</div>
						<div id="boton">
						<spring:message    code="label.CtaFormGuardar" var="Sav" />
							<input type="submit" value="${Sav}" class="botonSmartBilling" />
						</div>
						<div id="boton">
							<c:if test="${status }">
								<label>${msg }</label>
							</c:if>
						</div>

					</form:form>
				</div>
			</div>
		</div>
	</div>
	<div></div>
	<div id="datosbotonesComp">
		<div id="botonBack">
			<div class="col-sm-6">
				<a href="${pageContext.request.contextPath.concat(pathRegresar) }"><img
					src="${pageContext.request.contextPath}/img/regresar.png"><spring:message    code="label.NavRegresar" /></a>
			</div>
		</div>
		<div id="botonHome">
			<div class="col-sm-6">

				<a href="${pageContext.request.contextPath}/principal"><img
					src="${pageContext.request.contextPath}/img/home.png"><spring:message    code="label.NavPrin" /></a>
			</div>
		</div>
	</div>
</body>
</html>