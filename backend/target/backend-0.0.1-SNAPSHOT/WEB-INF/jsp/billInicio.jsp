<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
	<head>
		<title>
       		SMARTBILLING - Sytecso System
    	</title>
    <script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
	<link href="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.css" />" rel="stylesheet">
	
	<script src="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.js"/>"></script>
	<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
	<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
	<script src="<c:url value="/js/facturacion/billInicio.js"/>"></script>
	<script type="text/javascript">
	</script>
		<style>
			table {
				font-family: arial, sans-serif;
				
				border-collapse: collapse;
				width: 100%;
				font-color:white;

			}
			
			td, th {
				
				text-align: left;
				padding: 8px;
				widht:150px;
				font-color:white;
			}
			pre {
			    font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
			    white-space: pre;
				font-color:white;
} 
.letra {
	
	color:white !important;
	font-size: 15px !important;
	
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
	            <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> <spring:message  code="label.tittleFact"/>
	        </div>
	    </div>
	    <div id="tableroSmartBilling">
	    <div id="ventanaSmartBilling500">
        <div class="contenido">
        <div class="row">
				<c:if test="${success=='success' }">
					<div class="alert alert-success alert-dismissable  col-md-6"
						align="center">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<strong><spring:message  code="label.FactBillInicioInfo"/></strong> <spring:message  code="label.FactBillInicioInfo2"/>
					</div>
				</c:if>

			</div>
			<form:form id="formBill" action="${pageContext.request.contextPath.concat(path)}" method="POST" modelAttribute="facturacion">
			<div id="datos">
			<div id="datosForm">
				<table  id="test" style="width: 90%; border-radius: 25px;"  class="letra">
					<tr >
						<td class="letra"  bgcolor="#2584A7" ><spring:message  code="label.FactBillInicioCiclo"/>:</td>
						 <td class="letra"  bgcolor="#2584A7"> 
						 <form:select id="ciclo" path="ciclo" >
								<option value="0" selected="selected">- <spring:message  code="label.FactBillInicioSel"/> -</option>
								<option value="1">1</option>
								<option value="21">21</option>
						</form:select></td>
						<td class="letra"  bgcolor="#2584A7" ><pre><spring:message  code="label.FactBillInicioPeriod"/>:   </pre></td>
						<td  class="letra" bgcolor="#2584A7"  widht="150px">
							<form:input type="text" id="fecha" path="fecha" required="required" autocomplete="off"/>
						</td>
					</tr>
								
				
					<tr class="letra" bgcolor="#2584A7">
					<td class="letra" bgcolor="#2584A7" colspan=3" >&nbsp;</td>
						<td bgcolor="#2584A7"  >
						<spring:message  code="label.FactBillInicioBuscar" var="Buscar"/>
								<input class="w3-button w3-black w3-round-large" type="submit"  value="${Buscar }" />
						</td>
					</tr>
					<tr>
						<td  bgcolor="#2584A7"  colspan="6" bgcolor="white">
							<div id="errMsg">
								<c:if test="${statusFactura }">
									<label style="color: white;"><spring:message  code="label.FactBillInicioInfo3" /></label>
								</c:if>
							</div>
						</td>
					</tr>
				</table>
				 </div>
				 </div>
			</form:form>
    </div>

			<br />
			<br />
		
			
	</div>
		</div>
			<div id="datosbotonesComp">
		<div id="botonBack">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/billResultado"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
				</div>
			</div>
		<div id="botonHome">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png"><spring:message  code="label.NavPrin"/></a>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
	function msg() {
		if ("${status}") {
			alert("${msg}");
		}
	}
	window.onload = setTimeout(msg, 100);
</script>
</html>
