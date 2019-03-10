<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>SmartBilling - Sytecso System</title>
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
		 <link rel="stylesheet" type="text/css" href="<c:url value = "/css/secciones.css"/>">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<link href="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.css" />" rel="stylesheet">
		<script src="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.js"/>"></script>
		<script src="<c:url value="/js/SmartBilling/loader.js"/>"></script>
		<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
		<script src="<c:url value="/js/balance/mainBalance.js" />"></script> 
		
		<script type="text/javascript">
			function blanceDiff(){
				var diff=[${ctaMonthDiff},${diffMXN},${diffUSD},${churnMxnLastMonth},${churnUsdLastMonth}];
				return diff;
			}
			startMainBalance(blanceDiff());
		      google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawChartFact);
		      google.charts.setOnLoadCallback(drawChartCta);
		      google.charts.setOnLoadCallback(drawChartChurn);

		      function drawChartFact() {

		        var data = google.visualization.arrayToDataTable([
		          ['Mes', 'Valor'],
		          ['<spring:message  code="label.BalEsteMes"/> MXN',     ${mxn1}],
		          ['<spring:message  code="label.BalMesAnt"/> MXN',  ${mxn2 }],
		          ['<spring:message  code="label.BalEsteMes"/> USD',  ${usd1}],
		          ['<spring:message  code="label.BalMesAnt"/> USD', ${usd2 }]
		       
		        ]);

		        var options = {
		          title: '<spring:message  code="label.BalFact1"/>'
		        };

		        var chart = new google.visualization.PieChart(document.getElementById('facturacion'));

		        chart.draw(data, options);
		      }
		      function drawChartCta() {
		    	
			        var data = google.visualization.arrayToDataTable([
			          ['Mes', 'Valor'],
			          ['<spring:message  code="label.BalEsteMes"/> <spring:message  code="label.BalCta"/>',     ${ctaMonth1 }],
			          ['<spring:message  code="label.BalMesAnt"/> <spring:message  code="label.BalCta"/>', ${ctaMonth2 }]
			        ]);

			        var options = {
			          title: '<spring:message  code="label.BalCta"/>'
			        };

			        var chart = new google.visualization.PieChart(document.getElementById('cuentas'));

			        chart.draw(data, options);
			      }
		      
		      google.charts.load("current", {packages:['corechart']});
		      google.charts.setOnLoadCallback(drawChartChurn);
		      function drawChartChurn() {
		    	  var churnMXN =Math.abs( ${churnMXN});
		    	  var churnUSD =Math.abs( ${churnUSD});
		        var data = google.visualization.arrayToDataTable([
		          ["Element", "Density", { role: "style" } ],
		          ['<spring:message  code="label.BalEsteMes"/> MXN',    churnMXN, "#FE2E2E"],
		          ['<spring:message  code="label.BalMesAnt"/> MXN',  churnMXN, "#0040FF"],
		          ['<spring:message  code="label.BalEsteMes"/> USD',  churnUSD, "#088A08"],
		          ['<spring:message  code="label.BalMesAnt"/> USD', churnUSD, "#642EFE"]
		        ]);

		        var view = new google.visualization.DataView(data);
		        view.setColumns([0, 1,
		                         { calc: "stringify",
		                           sourceColumn: 1,
		                           type: "string",
		                           role: "annotation" },
		                         2]);

		        var options = {
		          title: '<spring:message  code="label.BalChurn"/>',
		          width: 350,
		          height: 200,
		          bar: {groupWidth: "95%"},
		          legend: { position: "none" },
		        };
		        var chart = new google.visualization.ColumnChart(document.getElementById("churn"));
		        chart.draw(view, options);
		    }
		</script>
		<style type="text/css">
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
		<div id="mainContainerDiv">							
			<jsp:include page="menu2.jsp" />
			<fmt:setLocale value="en_US"	scope="session" /> 
		    <div id="tituloyBarraBusqueda">
		        <div id="tituloTablero">
		            <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;">   <spring:message  code="label.tittleBalance"/>
		        </div>
			
		    </div>
		    <div id="tableroSmartBilling">
		        <div id="ventanaSmartBilling">
		            <div class="contenido">
		            <form:form id="formBalance" action="${pageContext.request.contextPath.concat(path)}" method="POST" >
			<div id="datos">
			<div id="datosForm">
				<table  id="test" style="width: 90%; border-radius: 25px;"  class="letra">
					<tr >
						
						<td class="letra"  bgcolor="#2584A7" ><pre><spring:message  code="label.FactBillInicioPeriod"/>:   </pre></td>
						<td  class="letra" bgcolor="#2584A7"  widht="150px">
							<input type="text" id="fecha" path="fecha" required="required" autocomplete="off"/>
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
								<c:if test="${status }">
									<label style="color: white;"><spring:message  code="label.FactBillInicioInfo3" /></label>
								</c:if>
							</div>
						</td>
					</tr>
				</table>
				 </div>
				 </div>
			</form:form>
		            <div id="ventanaCuadradaSmartBilling" class="altoVentanaCuadradaBalance">
				<div class="contenedorTitulo">
					<div class="tituloCuadro"><spring:message  code="label.BalFact"/></div>
				</div>
				<div class="contenidoCuadradoT" id="contenidoCuadradoTasaT">
					<div align="left">
						<label><spring:message  code="label.BalFactPesos"/></label><img id="imgCuandroFacturacionMXN"><label class="tamTextInfoFacCuadro"> 
						<fmt:formatNumber value="${mxn1}" type="currency" maxFractionDigits="4" pattern="$#,##0.0###" /> <spring:message  code="label.BalFactMxn"/> </label>
						<label><spring:message  code="label.BalFactDolares"/> <img id="imgCuandroFacturacionUSD"></label>
						<label class="tamTextInfoFacCuadro">
						<fmt:formatNumber value="${usd1}" type="currency" maxFractionDigits="4" pattern="$#,##0.0###" />  <spring:message  code="label.BalFactUsd"/></label>
						<label class="alTextMesAct"><spring:message  code="label.BalEsteMes"/></label>
					</div>
					
					<div id="wrapper">
						<div id="leftcolumn">
							<span class="alineacionResdiferenciaFac"><spring:message  code="label.BalFactPesos"/>: &nbsp;
							<fmt:formatNumber value="${diffMXN}" type="currency" maxFractionDigits="4" pattern="$#,##0.0###" />&nbsp; <spring:message  code="label.BalFactMxn"/> &nbsp;</span> 
							<span class="alineacionResdiferenciaFac"><spring:message  code="label.BalFactDolares"/>: &nbsp; <fmt:formatNumber value="${diffUSD }" type="currency" maxFractionDigits="4" pattern="$#,##0.0###" /> &nbsp; <spring:message  code="label.BalFactUsd"/></span><p class="alineacionResdiferenciaFac"><spring:message  code="label.BalCtaDif"/></p>
						</div>
						<div id="rightcolumn">
							<p class="alineacionResAnterior"><spring:message  code="label.BalFactPesos"/>: <fmt:formatNumber value="${mxn2 }" type="currency" maxFractionDigits="4" pattern="$#,##0.0###" /> <spring:message  code="label.BalFactMxn"/> <spring:message  code="label.BalFactDolares"/>:  
							<fmt:formatNumber value="${usd2 }" type="currency" maxFractionDigits="4" pattern="$#,##0.0###" /> <spring:message  code="label.BalFactUsd"/></p>
							<p class="alineacionResAnterior"><spring:message  code="label.BalMesAnt"/> </p>
							<div align="justify" id="facturacion"></div>
						</div>
					</div>
					
				</div>
			</div>

			<div id="ventanaCuadradaSmartBilling" class="altoVentanaCuadradaBalance">
				<div class="contenedorTitulo">
					<div class="tituloCuadro"><spring:message  code="label.BalCta"/></div>
				</div>
				<div class="contenidoCuadradoT" id="contenidoCuadradoTasaT">
					<div align="left">
						<label class="tamTextInfoFacCuadro"> <img id="imgFlechaCuenta"> &nbsp; ${ctaMonth1 } </label><label><spring:message  code="label.BalCtas"/></label>
					</div>
					<label class="alTextMesAct"><spring:message  code="label.BalEsteMes"/></label>
					<div id="wrapper">
						<div id="leftcolumn">
							<span class="alineacionResdiferenciaFac">${ctaMonthDiff }</span><p class="alineacionResdiferenciaFac"><spring:message  code="label.BalCtaDif"/></p>
						</div>
						<div id="rightcolumn">
							<p class="alineacionResAnterior">${ctaMonth2 }</p><p class="alineacionResAnterior"><spring:message  code="label.BalMesAnt"/> </p>
							<div id="cuentas"></div>
						</div>
					</div>
				</div>
			</div>
			<div id="ventanaCuadradaSmartBilling" class="altoVentanaCuadradaBalance">
				<div class="contenedorTitulo">
					<div class="tituloCuadro"><spring:message  code="label.BalChurn"/></div>
				</div>
				<div class="contenidoCuadradoT" id="contenidoCuadradoTasaT">
					<div align="left">
						<label><img id="churnMxnDiff"><spring:message  code="label.BalFactPesos"/></label>
						<label class="tamTextInfoFacCuadro"><fmt:formatNumber value="${churnMXN}" type="currency" maxFractionDigits="4" pattern="$#,##0.0###" /></label> 
						<label><img id="churnUsdDiff"><spring:message  code="label.BalFactDolares"/></label>
						<label class="tamTextInfoFacCuadro"><fmt:formatNumber value="${churnUSD}" type="currency" maxFractionDigits="4" pattern="$#,##0.0###" /></label>
						<label class="alTextMesAct"><spring:message  code="label.BalEsteMes"/></label>
					</div>
					
					<div id="wrapper">
						<div id="rightcolumn" style="margin-top:  20px;">
							<p class="alineacionResAnterior"><spring:message  code="label.BalFactMxn"/>: <fmt:formatNumber value="${churnMxnLastMonth}" type="currency" maxFractionDigits="4" pattern="$#,##0.0###" /> <spring:message  code="label.BalFactUsd"/>: <fmt:formatNumber value="${churnUsdLastMonth}" type="currency" maxFractionDigits="3" pattern="$#,###.000" /></p><p class="alineacionResAnterior"><spring:message  code="label.BalMesAnt"/></p>
						<div style="width: 100%; height: 100%;" id="churn"></div>
						</div>
					</div>
				</div>
			</div>
			
			
			 </div>
		        </div>
		    </div>
	    </div>
	  <jsp:include page="divRegresarPrincipal.jsp" />
	    
	</body>
</html>