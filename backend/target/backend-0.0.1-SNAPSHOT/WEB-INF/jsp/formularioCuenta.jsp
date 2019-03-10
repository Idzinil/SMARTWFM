<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Sytecso - SmartField</title>
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSytecso.css"/>">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<script type="text/javascript">

		</script>
		
		<style>  
			table {  
			    margin: auto;  
			    width: 85%;  
			    border: 1px black solid;  
			} 
			fieldset{
			  border: 1px solid rgb(216,225,231) 22%;
			  width: 400px;
			  margin:auto;
			}
		</style>

	</head>
	<body>	
		<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
		<jsp:include page="menu2.jsp" /> 
	    <div id="tituloyBarraBusqueda">
	    </div>
	    <div id="tableroSytecso">
	    <div id="ventanaSytecso">
        <div class="contenido">
	    <div id="datos">
           	<form:form action="insertaDatosCta.html" method="POST"  id="formCuenta" modelAttribute="cuenta">				
					<div id="datosCuenta">
					<spring:message    code="label.CtaFormCampObligatorio" var="CampObli" />
						 <fieldset>
							<legend align="left"><spring:message  code="label.CtaFormCuenta"/></legend>
							
									<form:label path="numCuenta" type="text" ><b><spring:message  code="label.CtaFormNoClient"/> *</b></form:label>
									<abbr title="${CampObli}">
									<spring:message  code="label.CtaFormNoClientph" var ="labelNoClient"/>
									<form:input id="numCuenta" type="text" path="numCuenta"  placeholder="${labelNoClient}" required="false"/>
									</abbr>
								
									<form:label type="text" path="aliasCliente"><b><spring:message  code="label.CtaFormAliasClient" /></b></form:label>
									<abbr title="${CampObli}">
									<spring:message  code="label.CtaFormAliasClient" var ="labelAliasClient"/>
									<form:input type="text" path="aliasCliente"  placeholder="${labelAliasClient}"  />
									</abbr>
								
									<form:label type="text" path="region"><b><spring:message  code="label.CtaFormReg" /></b></form:label>
									<abbr title="${CampObli}">
									<spring:message  code="label.CtaFormRegph" var ="labelRegion"/>
									<form:input type="text" path="region" id="regionJs" placeholder="${labelRegion}"  />
									<abbr title="${CampObli}">
								
									<form:label type="text" path="Gerencia"><b><spring:message  code="label.CtaFormGer" /></b></form:label>
									<spring:message  code="label.CtaFormGer" var ="labelGeren"/>
									<form:input type="text" path="gerencia" id="gerenciaJs"  placeholder="${labelGeren}"  />
								
									<form:label type="text" path="departamento"><b><spring:message  code="label.CtaFormDep" /></b></form:label>
									<spring:message  code="label.CtaFormDep" var ="labelDep"/>
									<form:input type="text" path="departamento" id="departamentoJs" placeholder="${labelDep}" />
									
									<form:label type="text" path="empresa"><b><spring:message  code="label.CtaFormEmp" /></b></form:label>
									<spring:message  code="label.CtaFormEmp" var ="labelEmp"/>
									<form:input type="text" path="empresa" id="empresaJs" placeholder="${labelEmp}" />
								
									<form:label type="text" path="ejecutivo"><b><spring:message  code="label.CtaFormEjec" /> *</b></form:label>
									<spring:message  code="label.CtaFormEjec" var ="labelEjec"/>
									<form:input type="text" path="ejecutivo" id="ejecutivoJs" placeholder="${labelEjec}" required="false"/>
									
									<form:label type="text" path="segmentoCliente"><b><spring:message  code="label.CtaFormSegmClient" /></b></form:label>
									<spring:message  code="label.CtaFormSegmClient" var ="labelsegClient"/>
									<form:select id="segmentoClienteJs"  path="segmentoCliente" >
													<option value="0" selected="selected">-<spring:message  code="label.CtaFormSegmClient"/>-</option>
													<option value="3">Empresarial</option>
													<option value="2">Masivo</option>
												</form:select>
								
						</fieldset>	
						</div>
						<div id="datosFiscales">
						<fieldset >
							<legend align="left"><spring:message  code="label.CtaFormDatosFisc" /></legend>
						
								
									<label type="text"><b>	<spring:message  code="label.CtaFormRFC" /> *</b></label>
									<abbr title="${CampObli}">
										<spring:message  code="label.CtaFormRFC" var ="labelRFC"/>
									<form:input  id="rfc" placeholder="${labelRFC}" type="text" path="datosFiscales.rfc" />
									</abbr>
								
									<label type="text"><b><spring:message  code="label.CtaFormRazonSoc" /></b></label>
									<abbr title="${CampObli}">
									<spring:message  code="label.CtaFormRazonSocph" var ="labelRzonSoc"/>
									<form:input placeholder="${labelRzonSoc}" type="text" path="datosFiscales.razonSocial"/>
									</abbr>
								
									<label type="text"><b><spring:message  code="label.CtaFormCalle" /> *</b></label>
									<spring:message  code="label.CtaFormCalle" var ="labelCalle"/>
									<form:input  id="calle" placeholder="${labelCalle}" type="text" path="datosFiscales.calle" required="false"/>
								
									<label type="text"><b><spring:message  code="label.CtaFormNumInt" /></b></label>
									<spring:message  code="label.CtaFormNumIntph" var ="labelInt"/>
									<form:input  placeholder="${labelInt}" type="text" path="datosFiscales.numeroInt"/>
							
									<label type="text"><b><spring:message  code="label.CtaFormNumExt" /></b></label>
									<spring:message  code="label.CtaFormNumExtph" var ="labelExt"/>
									<form:input  placeholder="${labelExt}" type="text" path="datosFiscales.numeroExt"/>
								
									<label type="text"><b><spring:message  code="label.CtaFormCol"/> *</b></label>
									<spring:message  code="label.CtaFormCol" var ="labelCol"/>
									<form:input id="colonia" placeholder="${labelCol} " type="text" path="datosFiscales.colonia" required="false"/>
								
									<label type="text"><b><spring:message  code="label.CtaFormMun"/></b></label>
									<spring:message  code="label.CtaFormMun" var ="labelMuni"/>
									<form:input placeholder="${labelMuni}" type="text" path="datosFiscales.municipio"/>
								
									<label type="text"><b><spring:message  code="label.CtaFormCiudad"/> *</b></label>
									<spring:message  code="label.CtaFormCiudad" var ="labelCiudad"/>
									<form:input id="ciudad" placeholder="${labelCiudad}" type="text" path="datosFiscales.ciudad" required="false"/>
								
									<label type="text"><b><spring:message  code="label.CtaFormEstado" /> *</b></label>
									<spring:message  code="label.CtaFormEstado" var ="labelEdo"/>
									<form:input id="estado" placeholder="${labelEdo}" type="text" path="datosFiscales.estado" required="false"/>
								
									<label type="text"><b><spring:message  code="label.CtaFormPais" /> *</b></label>
									<spring:message  code="label.CtaFormPaisph" var ="labelPais"/>
									<abbr title="${CampObli}">
									<form:input id="pais" placeholder="${labelPais}" type="text" path="datosFiscales.pais" required="false"/>
									</abbr>
							
								
									<label type="text"><b><spring:message  code="label.CtaFormCP" /> *</b></label>
									<spring:message  code="label.CtaFormCPph" var ="labelCP"/>
									<form:input  id="codigoPostal" placeholder="${labelCP}" type="text" path="datosFiscales.codigoPostal" required="false"/>
						
							
						</fieldset>	
						</div>	
						
						<div id="boton">
						<spring:message  code="label.ButtonGuardar" var="labelGuardar"/>
									<input type="submit" value="${labelGuardar}" class="botonSytecso" />
						</div>	
				</form:form>			
				</div>
				<div>
					<c:if test="${estatus }">
						<p>${message }</p>
					</c:if>
				</div>					
	</div>	
	</div>	
	</div>
	<div id="datosbotonesComp">
		<div id="botonBack">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/cuentasFront"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar" /></a>
				</div>
			</div>
		<div id="botonHome">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png"><spring:message  code="label.NavPrin" /></a>
				</div>
			</div>
		</div>
	</body>
</html>