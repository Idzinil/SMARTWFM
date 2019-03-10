<!DOCTYPE html >
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SmartBilling - RedIt</title>
<link rel="stylesheet" type="text/css"  href="<c:url value="/css/estiloSmartBilling.css"/>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery-1.12.4.js"></script>
<script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
<script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="js/jquery-ui-1.12.1/jquery-ui.css">
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/utils/UrlUtils.js"></script>
<script src="js/SmartBilling/smartBilling.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
.big-col {
	width: 100px !important;
}
table {  
			    margin: auto;  
			    border: 1px #D8D8D8 solid;
			   font-family: arial, sans-serif;
			   border-left:0px;
			   border-right:0px;
			} 
			
				thead { 
				background: linear-gradient(to bottom, #2E2E2E 3%, #151515 84%);
				color: #D8D8D8;
			 }
			 tr:nth-child(even)
			 {
			 	background-color: #E6E6E6;
			 }
			.letra {
				font-size: 13px;
				color:#1C1C1C;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
			.letrath {
				font-size: 14px;
				color:white;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
			
			fieldset{
			  border: 1px solid rgb(216,225,231) 22%;
			  width: 400px;
			  margin:auto;
			}
</style>
	   <script type="text/javascript">
			
		    
	        function updateDivisa(index,table){
	        	var url='actualizarDivisas';
	        	var idCambioDivisa = smartBilling.trInputVal(index,table,'idCambioDivisa');
	        	var nombreMonedaA =smartBilling.trInputVal(index,table,'nombreMonedaA');
	        	var nombreMonedaB =smartBilling.trInputVal(index,table,'nombreMonedaB');
	        	var baseMonedaA =smartBilling.trInputVal(index,table,'baseMonedaA');
	        	var baseMonedaB =smartBilling.trInputVal(index,table,'baseMonedaB');
	        	var cambioAValorB =smartBilling.trInputVal(index,table,'cambioAValorB');
	        	
	        	var request = smartBilling.ajaxPost(url,{
	        		index:index,idCambioDivisa:idCambioDivisa,nombreMonedaA:nombreMonedaA,
	        		nombreMonedaB:nombreMonedaB,baseMonedaA:baseMonedaA,
	        		baseMonedaB:baseMonedaB,cambioAValorB:cambioAValorB});
	        	
	        	//request.then(response=>{console.log(response)},error=>{alert(error)});
	        	
 	        	request.then(response=>{
 	        		window.location=response;
 	        	},error=>{
					alert(error)
 	        	});
	        }		   
			</script>

</head>
<body>
<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
	<jsp:include page="menu3.jsp" />
	<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		           <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;">   Cambio Divisas
		    </div>
		
	    </div>
	    <div id="tableroSmartBilling">
			<div id="ventanaBienvenidaSmartBilling">
			
			<p><label style="margin-left: 15%;" type="text"><b>Actualizacion de Cambio de Divisas</b></label></p>
			
	<div id="mainDivCompra">
		<form:form action="actualizarDivisas.html" method="POST"  modelAttribute="cambioDiv" >
		<table id = "tableDivisas" border cellpadding=1 cellspacing=0  width="40%" align="left">
<thead  class="letrath">
  <tr >
     <th><spring:message  code="label.ConfigDivisasTBNamMonA"/></th>
     <th><spring:message  code="label.ConfigDivisasTBNamMonB"/></th>
     <th><spring:message  code="label.ConfigDivisasTBBaseMonA"/></th>
     <th><spring:message  code="label.ConfigDivisasTBBaseMonB"/></th>
     <th><spring:message  code="label.ConfigDivisasTBCambioAValorB"/></th>
     <th>Actualizar</th>
  </tr>
  </thead>
  <c:forEach var="listValue" items="${divisas}" varStatus="status">
  <tr  class="letra">
    <td align="center">
    <input  class="idCambioDivisa"  type="text" path="idCambioDivisa" value="${listValue.idCambioDivisa}"  style="display:none"/>
    <input class="nombreMonedaA" type="text" path="nombreMonedaA" value="${listValue.nombreMonedaA}" style="display:none"/>
    <label>${listValue.nombreMonedaA}</label>
    </td> 
    <td align="center"><input class="nombreMonedaB"  type="text" path="nombreMonedaB" value="${listValue.nombreMonedaB}" style="display:none"/>
    <label>${listValue.nombreMonedaB}</label></td>
    <td align="center"><input class="baseMonedaA"  type="text" path="baseMonedaA" value="${listValue.baseMonedaA}" style="display:none"/>
    <label>${listValue.baseMonedaA}</label></td>
    <td align="center"><input class="baseMonedaB"  type="text" path="baseMonedaB" value="${listValue.baseMonedaB}" style="display:none"/>
    <label>${listValue.baseMonedaB}</label></td>
    <td align="center"><input class="cambioAValorB"  type="text" path="cambioAValorB" value="${listValue.cambioAValorB}" style="display:none"/>
    <label>${listValue.cambioAValorB}</label></td>
    <td><button type="button" name="ssdf" onclick="updateDivisa(${status.index},'#tableDivisas')">Actualizar</button></td>
  </tr>
	</c:forEach>
</table>
</form:form>
<div id="errMsg">
								<c:if test="${status }">
									<label style="color: white;">El cambio de Divisa ya existe</label>
								</c:if>
							</div>
  </div>
		
	    </div>
		<div id="dialog"></div>
	</div>
		<div id="datosbotones">
			<div id="botonBack">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/productosFront"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
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