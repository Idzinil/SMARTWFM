<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
				font-size: 17px !important;
				color:white !important;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
				.ui-datepicker-calendar {
    display: none;
    }
			
		</style>
		  <script>
		  
		  $(function() {
			    $('.date-picker').datepicker( {
			        changeMonth: true,
			        changeYear: true,
			        showButtonPanel: true,
			        dateFormat: 'mm',
			        onClose: function(dateText, inst) { 
			            $(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
			        }
			    });
			});
  </script>
	</head>
	<body >
	<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
		<jsp:include page="menu6.jsp" /> 
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> <spring:message  code="label.ReportesCta"/>
		    </div>
		</div>
		<div id="tableroSmartBilling">
	    	<div id="ventanaSmartBilling500">	
	        	<div class="contenido">
	      	 		<div id="datos">
						<div id="datosForm">  
							<form:form  id="formRepo" action="${pageContext.request.contextPath }/buscarReporteCliente" method="POST"   modelAttribute="reporte">
									<table  id="test" style="width: 90%; border="0" class="letra">
										<tr>
											
											<td class="letrath"  bgcolor="#2584A7" >
												<form:label path="year" type="text" ><b><spring:message  code="label.ReportFiltroYear"/></b></form:label>
												<abbr title="Campo obligatorio">
													<form:select id="year"  path="year" >
													<option value="0" selected="selected">-<spring:message  code="label.ReportFiltroYear"/>-</option>
													<option value="2018">2018</option>
													<option value="2019">2019</option>
													<option value="2020">2020</option>
													<option value="2021">2021</option>
													<option value="2022">2022</option>
												</form:select>
												</abbr>
											</td>
											<td class="letrath"  bgcolor="#2584A7" >
											<form:label path="ciclo" type="text" ><b><spring:message  code="label.ReportFiltroCiclo"/></b></form:label>
						 						<form:select id="ciclo"  path="ciclo" >
													<option value="0" selected="selected">-<spring:message  code="label.AdjSel"/>-</option>
													<option value="1">1</option>
													<option value="21">21</option>
												</form:select>
											</td>
											<td class="letrath"  bgcolor="#2584A7" >
												<form:label path="mes" type="text" ><b><spring:message  code="label.ReportFiltroMes"/></b></form:label>
												<abbr title="Campo obligatorio">
													<form:select id="mes"  path="mes" >
													<option value="0" selected="selected">-<spring:message  code="label.ReportFiltroMes"/>-</option>
													<option value="01"><spring:message  code="label.ReportFiltroMes01"/></option>
													<option value="02"><spring:message  code="label.ReportFiltroMes02"/></option>
													<option value="03"><spring:message  code="label.ReportFiltroMes03"/></option>
													<option value="04"><spring:message  code="label.ReportFiltroMes04"/></option>
													<option value="05"><spring:message  code="label.ReportFiltroMes05"/></option>
													<option value="06"><spring:message  code="label.ReportFiltroMes06"/></option>
													<option value="07"><spring:message  code="label.ReportFiltroMes07"/></option>
													<option value="08"><spring:message  code="label.ReportFiltroMes08"/></option>
													<option value="09"><spring:message  code="label.ReportFiltroMes09"/></option>
													<option value="10"><spring:message  code="label.ReportFiltroMes10"/></option>
													<option value="11"><spring:message  code="label.ReportFiltroMes11"/></option>
													<option value="12"><spring:message  code="label.ReportFiltroMes12"/></option>
												</form:select>
												</abbr>
											</td>
											
											<td class="letrath"  bgcolor="#2584A7" >
											<form:label path="ciclo" type="text" ><b><spring:message  code="label.ReportFiltroCta"/></b></form:label>
											<spring:message  code="label.ReportFiltroCta" var="labelNUmClient"/>
						 						<form:input id="numCuenta" autocomplete="off" type="text" path="cuenta.numCuenta" 	placeholder="${labelNUmClient }" />
											</td>
										</tr>
										<tr>
											<td class="letra"  bgcolor="#2584A7" >
												&nbsp;
											</td>
											<td class="letra"  bgcolor="#2584A7" >
											<spring:message code="label.AdjBuscar" var="labelBuscar"></spring:message>
												<input class="w3-button w3-black w3-round-large" type="submit" value="${labelBuscar}" class="botonSmartBilling" />
											</td>
											<td class="letra"  bgcolor="#2584A7" >
												&nbsp;
											</td>
										</tr>
										<tr>
										<td  bgcolor="#2584A7"  colspan="6" bgcolor="white">
							<div id="errMsg">
								<c:if test="${status }">
									<label style="color: white;"><spring:message  code="label.AdjResult"/></label>
								</c:if>
							</div>
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
						
						<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
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
