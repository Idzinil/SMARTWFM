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
       		Sytecso - SmartField
    	</title>
    	


	<link href="<c:url value="/css/estiloSytecso.css" />" 	rel="stylesheet">
	<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
	<link href="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.css" />" rel="stylesheet">
	
	<script src="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.js"/>"></script>
	<script src="<c:url value="/js/Sytecso/sytecso.js"/>"></script>
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
	        dateFormat: 'mm-yy',
	        onClose: function(dateText, inst) { 
	            $(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
	        }
	    });
	});
  </script>
	</head>
	<body>
	<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
		<jsp:include page="menu4.jsp" /> 
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> Insumos Cliente
		    </div>
		</div>
		<div id="tableroSytecso">
	    	<div id="ventanaSytecso500">	
	        	<div class="contenido">
	      	 		<div id="datos">
						<div id="datosForm">  
							<form:form  id="formCtaInsumos" action="${pageContext.request.contextPath }/buscarCtaInsumo" 
							method="POST"   modelAttribute="ctaInsum">
									<table  id="test" style="width: 90%; border="0" class="letra">
										<tr>
											<td class="letrath"  bgcolor="#2584A7" >
											<form:label path="cuenta.numCuenta" type="text" ><b><spring:message  code="label.AdjNoClient" /></b></form:label>
											<abbr title="Campo obligatorio">
											<spring:message  code="label.AdjNoClientph" var="labelCliente"/>
												<form:input id="numCuenta" type="text" path="cuenta.numCuenta"  placeholder="${labelCliente}" />
											</abbr>
											</td>
										</tr>
										<tr>
											<td class="letra"  bgcolor="#2584A7" >
												&nbsp;
											</td>
											<td class="letra"  bgcolor="#2584A7" >
											<spring:message code="label.AdjBuscar" var="labelBuscar"></spring:message>
												<input class="w3-button w3-black w3-round-large" type="submit" value="${labelBuscar}" class="botonSytecso" />
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
