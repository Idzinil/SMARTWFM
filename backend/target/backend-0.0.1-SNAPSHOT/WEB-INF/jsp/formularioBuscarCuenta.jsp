<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<head>
		<title>SMARTBILLING - Sytecso System</title>
 	<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
		<link rel="stylesheet" href="<c:url value = "/css/jquery.dataTables.min.css"/>">
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
		<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script type="text/javascript">		
		smartBilling.updateURL(UrlUtils.urlCuenta());
		</script>
		<style>  
			table {  
			    margin: auto;  
			    width: 85%;   
			} 	
		    .FloatLeft {
		    	float: left;
		    	width: 400px;
		    }
		    .FloatRigth {
		    	float: rigth ;
		    	width: 400px;
		    }
		    .FloatBottom {
			    bottom: 25%;
			    float: rigth ;
			    width: 70px;
			}
		</style>
	</head>
	
	<body>
			<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
    	<jsp:include page="${menu}" />
		<div id="tableroSmartBilling">
		<div class="contenido">
	<div id="tableroSmartBilling">				
		<div id="ventanaSmartBilling500">
        		
			<div id="datos">
				
					<form:form action="foundAcct" method="POST" commandName="findAcct" id="formCuenta" modelAttribute="cuenta">
					<div id="datosCuenta">
						 <fieldset align="left" class="FloatLeft">
							<legend><spring:message  code="label.CtaFormDtosCta"/></legend>
							<table align="center">
								<tr>
										<form:label type="text" path="numCuenta"><b><spring:message  code="label.CtaFormNoClient"/> *</b></form:label>
										<spring:message  code="label.CtaFormNoClientph" var ="labelNoCliente"/>
										<form:input type="text" path="numCuenta" class="cuentasInput" placeholder="${labelNoCliente}" />
								</tr>
								<tr>
										<form:label type="text" path="tipocuenta"><b><spring:message  code="label.CtaFormTipoClient" /></b> </form:label>
										<spring:message  code="label.CtaFormTipoClient" var ="labelTipoCliente"/>
										<form:input type="text" path="tipocuenta"   class="cuentasInput" placeholder="${labelTipoCliente}"  />
								</tr>
								<tr>
										<form:label  type="text" path="aliasCliente"><b><spring:message  code="label.CtaFormAliasClient" /></b></form:label>
										<spring:message  code="label.CtaFormAliasClient" var ="labelAliasCliente"/>
										<form:input  type="text" path="aliasCliente" class="cuentasInput" placeholder="${labelAliasCliente}"  />
								</tr>
								<tr>
										<form:label  type="text" path="region"><b><spring:message  code="label.CtaFormReg" /></b></form:label>
										<spring:message  code="label.CtaFormRegph" var ="labelRegion"/>
										<form:input  type="text" path="region" class="cuentasInput" placeholder="${labelRegion}"  />
								</tr>
								<tr>
										<form:label type="text" path="Gerencia"><b><spring:message  code="label.CtaFormGer"/></b></form:label>
										<spring:message  code="label.CtaFormGer" var ="labelGerencia"/>
										<form:input type="text" path="gerencia" class="cuentasInput"  placeholder="${labelGerencia}"  />
								</tr>
								<tr>
										<form:label type="text" path="departamento"><b><spring:message  code="label.CtaFormDep" /></form:label>
										<spring:message  code="label.CtaFormDep" var ="labelDep"/>
										<form:input type="text" path="departamento" class="cuentasInput" placeholder="${labelDep}" />
								</tr>

							</table>
						</fieldset>		
						</div>
						<div id="datosFiscales">			
						<fieldset align="left" class="FloatRigth">
							<legend><spring:message  code="label.CtaFormDatosFisc" /></legend>
							<table align="center">
								<tr>
										<label type="text" ><spring:message  code="label.CtaFormRFC" /> </label>
										<spring:message  code="label.CtaFormRFC" var ="labelRFC"/>
										<form:input placeholder="${labelRFC}" type="text"  class="cuentasInput" path="unidadFacturacion.datosFiscales.rfc" />
								</tr>
								<tr>
										<label type="text" 	><b><spring:message  code="label.CtaFormRazonSoc" /></b></label>
										<spring:message  code="label.CtaFormRazonSocph" var ="labelRznSoc"/>
										<form:input placeholder="${labelRznSoc}" class="cuentasInput"  type="text" path="unidadFacturacion.datosFiscales.razonSocial"/>
								</tr>
								<tr>
										<label type="text" ><b><spring:message  code="label.CtaFormPais"/></b></label>
										<spring:message  code="label.CtaFormPaisph" var ="labelPais"/>
										<form:input placeholder="${labelPais}" type="text"  class="cuentasInput" path="unidadFacturacion.datosFiscales.pais"/>
								</tr>
									<tr>
										<label type="text" ><b><spring:message  code="label.CtaFormCP"/></b></label>
										<spring:message  code="label.CtaFormCPph" var ="labelCP"/>
										<form:input placeholder="${labelCP}" type="text"  class="cuentasInput" path="unidadFacturacion.datosFiscales.codigoPostal"/>
								</tr>
							</table>
						</fieldset>	
						</div>			
						
						    <div id="boton">
						    <spring:message  code="label.CtaFormBuscar" var ="labelBuscar"/>
						        <input type="submit" value="${labelBuscar}" class="botonSmartBilling" />
						    </div>
						
					</form:form>
			
			</div>
	</div>
</div>
			<div id="datosbotonesComp">
		<div id="botonBack">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/comprasFront"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar" /></a>
				</div>
			</div>
		<div id="botonHome">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png"><spring:message  code="label.NavPrin" /></a>
				</div>
			</div>
		</div>
			</div>
				
		</div>
		
	</body>
</html>