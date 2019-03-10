<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<html>
	<head>
		<title>
       		SMARTBILLING - Sytecso System
    	</title>
    	



		  <script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
<link href="<c:url value="/css/estiloSmartBilling.css" />" 	rel="stylesheet">
	<link href="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.css" />" rel="stylesheet">
	
	<script src="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.js"/>"></script>
	<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
	<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>

		<style>
			table {
				font-family: arial, sans-serif;
				border-collapse: collapse;
				width: 100%;
			}
			
				thead { 
				background: linear-gradient(to bottom, #2E2E2E 3%, #151515 84%);
				color: #D8D8D8;
			 }
			td, th {
				
				text-align: left;
				padding: 8px;
			}
			.letra {
				font-size: 14px !important;
				color:#1C1C1C !important;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
			.letrath {
				font-size: 14px !important;
				color:#626262 !important;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
			
			
		</style>
		  <script>
  
  $(function() {
	    $('.date-picker').datepicker( {
	        changeMonth: true,
	        changeYear: true,
	        showButtonPanel: true,
	        dateFormat: 'dd-mm-yy',
	        onClose: function(dateText, inst) { 
	            $(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
	        }
	    });
	});
  
  function myFunction() {
	    confirm("Se registró Nota de Credito!");
	}
  
 
	

  
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
	        	<p > <spring:message  code="label.AdjNotaCredResult"/> <strong> ${factura} </strong>:</p>
	      	 		<div id="datos">
						<div id="datosForm4">  
							<form:form   method="GET" action="registrarNotaCredito.html"  modelAttribute="ajustes" >
									<table  id="notacredito" style="width: 90%; border="0" class="letra">
							
										<tr>
											<td class="letrath" colspan="3" >
												<label><b><spring:message  code="label.AdjNotaCredNoFolio"/></b></label>
												<abbr title="Campo obligatorio">
												<form:input path="idFactura" value="${idfactura}" style="display:none"   />
												<form:input path="tipo" value="${tipo}"   style="display:none"   />
												<form:input path="item.deudaItem" value="${deudaItem}"    style="display:none"  />
												<form:input path="contrato" value="${contrato}"   style="display:none"   />
												<form:input path="item.idItem" value="${iditem}"   style="display:none"   />
												<form:input path="contratosFact.idContratosFactura" value="${idcontratoFact}"  style="display:none"    />
												<form:input path="ajustado" value="${ajustado}" style="display:none"    />
												<form:input path="cuenta.unidadFacturacion.idunidadFacturacion" value="${idUnidadFacturacion}"  style="display:none"  />
												<form:input path="cuenta.idCuenta" value="${idCuenta}"  style="display:none"  />
												<form:input path="numFactura" value="${factura}"   />
												</abbr>
											</td>
											<td class="letrath"  >
											<label><b><spring:message  code="label.AdjNotaCredAlsClient"/></b></label>
												<form:input path="aliasCliente" class="aliasCliente" value="${aliasCliente}"   />
											</td>
											
											<td class="letrath" >
											<label><b><spring:message  code="label.AdjNotaCredMon"/></b></label>
						 						<form:input  path="" value="${moneda}"/>
											</td>
											<td class="letrath" colspan = "2" >
											<label ><b><spring:message  code="label.AdjNotaCredPeriodo"/>:</b></label>
											<abbr title="Campo obligatorio">
												<form:input path="" placeholder="Periodo NC" />
											</abbr>
											</td>
											<tr>
											<td class="letrath" colspan="4" >
											<label ><b><spring:message  code="label.AdjNotaCredServ"/></b></label>
						 						<select id="ciclo"   >
													<option value="0" selected="selected"><spring:message  code="label.AdjNotaCredSel"/>...</option>
													<option value="1"><spring:message  code="label.AdjNotaCredServ"/> 1</option>
													<option value="11"><spring:message  code="label.AdjNotaCredServ"/> 2	</option>
												</select>
											</td>
											<td class="letrath" >
											<label ><b><spring:message  code="label.AdjNotaCredImpor"/>:</b></label>
											<abbr title="Campo obligatorio">
												<form:input path="monto"  value="-${monto}"   />
											</abbr>
											</td>
											<td class="letrath" >
											
											</td>
											<td class="letrath" >
											<label ><b><spring:message  code="label.AdjNotaCredTotal"/></b></label>
											<abbr title="Campo obligatorio">
												<form:input path="monto"  value="${monto}"   />
											</abbr>
											</td>
											</tr>
											<tr>
											<td colspan="5" >
											<label  ><p><spring:message  code="label.AdjNotaCredServ"/></p></label>
											<abbr title="Campo obligatorio">
												<textarea rows="10" cols="40">${leyenda} </textarea>
											</abbr>
											</td>
											<td colspan="3">
											<p><spring:message  code="label.AdjNotaCredNota"/>:</p>
											<textarea name="comentarios" rows="5" cols="40"><spring:message  code="label.AdjNotaCredInfo"/> ${factura}  </textarea>
											</td>
											</tr>
											<tr>
											<td class="letrath" colspan="4"  >
												<label  ><b><spring:message  code="label.AdjNotaCredFechCre"/> </b></label>
												<abbr title="Campo obligatorio">
													<input  class="date-picker" />
												</abbr>
											</td>
											
											<td class="letrath" colspan="2"  >
												<label ><b><spring:message  code="label.AdjNotaCredFechAp"/></b></label>
												<abbr title="Campo obligatorio">
													<input   class="date-picker" />
												</abbr>
											</td>
											
											<td class="letrath"  colspan="2" >
												<label><b><spring:message  code="label.AdjNotaCredFechCancel"/></b></label>
												<abbr title="Campo obligatorio">
													<input  class="date-picker" />
												</abbr>
											</td>
											
										</tr>
										<tr>
											<td class="letra" bgcolor="white"  colspan="4" >
												&nbsp;
											</td>
											</tr>
											<tr>
											<td class="letra" bgcolor="white"  >
											<spring:message  code="label.AdjNotaCredBtn" var ="btnReg"/>
												<input class="w3-button w3-black w3-round-large" onclick="myFunction()" type="submit" value="${btnReg }" class="botonSmartBilling" />
											</td>
											<td class="letra" bgcolor="white"  >
												&nbsp;
											</td>
										</tr>
							
									</table>
								</form:form>
										
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="datosbotonesComp">
			<div id="botonBack">
					<div class="col-sm-6">
						
						<a href="${pageContext.request.contextPath}/FacturaAjuste?factura=${factura}"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
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
