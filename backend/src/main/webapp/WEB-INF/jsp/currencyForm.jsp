<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>SmartBilling - RedIt</title>
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
		<link rel="stylesheet" href="js/jquery-ui-1.12.1/jquery-ui.css">
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<script src="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.js"/>"></script>
		<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<style>  
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
	<script>
	function validaNameMonedas(monedaA,monedaB) {
		
		monedaA=document.getElementById(monedaA).value;
		monedaB=document.getElementById(monedaB).value;
		
		if(monedaA==monedaB)
			{
			alert("Error: Las Divisas son iguales: "+monedaA+" , "+monedaB);
			}
	    
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
		           <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> <spring:message  code="label.ConfigDivisasFormTittle"/>
		    </div>
		
	    </div>
<div id="tableroSmartBilling">
<div id="ventanaSmartBilling">
<div id="datos">
<br/>
<br/>
<form:form action="altaDivisas" method="POST"  modelAttribute="cambioDiv" onsubmit="validaNameMonedas('monedaA','monedaB')" >
<p><label style="margin-left: 45%;" type="text"><b><spring:message  code="label.ConfigDivisasFormTBAlta"/></b></label></p>
<br/>
	<table align="center" width="45%" >
		<tr align="center">
	   		<td bgcolor="#FFFFFF">
	   		<form:label path="nombreMonedaA" class="encabezadoCampos"><spring:message  code="label.ConfigDivisasFormTBNamMonA"/>:</form:label><br/>
					<form:input class="anchoCampos"  name="monedaA" id="monedaA" type="text" path="nombreMonedaA" value="MXN" required="true" readonly="true"/>
			</td>
			<td bgcolor="#FFFFFF">
	   		<form:label path="nombreMonedaB" class="encabezadoCampos"><spring:message  code="label.ConfigDivisasFormTBNamMonB"/>:</form:label><br/>
					<form:select name="monedaB" id="monedaB" path="nombreMonedaB" width="20px" required="true">
					<option value="MXN">MXN</option>
					<option value="USD">USD</option>
				</form:select>
			</td>
		</tr>
		<tr align="center">
	   		<td bgcolor="#FFFFFF">
	   		<form:label path="baseMonedaA" class="encabezadoCampos"><spring:message  code="label.ConfigDivisasFormTBBaseMonA"/>:</form:label><br/>
					<form:input class="anchoCampos"  type="text" path="baseMonedaA" value="1" required="true" readonly="true"/>
			</td>
			<td bgcolor="#FFFFFF">
	   		<form:label path="baseMonedaB" class="encabezadoCampos"><spring:message  code="label.ConfigDivisasFormTBBaseMonB"/>:</form:label><br/>
					<form:input class="anchoCampos" type="text" path="baseMonedaB" required="true"/>
			</td>
		</tr>
		<tr align="center">
	   		<td bgcolor="#FFFFFF">
	   		<form:label path="cambioAValorB" class="encabezadoCampos"><spring:message  code="label.ConfigDivisasFormTBCambioAValorB"/>:</form:label><br/>
					<form:input class="anchoCampos"  type="text" path="cambioAValorB" required="true"/>
		</tr>
	</table>
	<br/>
	<div align="center">
		<spring:message  code="label.ConfigDivisasFormTBButtonCrear" var="DivisaBtn"/>
		<input class="w3-button w3-black w3-round-large"  type="submit" value="${DivisaBtn}" />
	</div>	
	<div id="errMsg">
		<c:if test="${status }">
			<label style="color: black;">El cambio de Divisa ya existe</label>
		</c:if>
	</div>
</form:form>
	</div>
	<br/>
  </div>
<br/>
<br/>
<br/>

<table border cellpadding=1 cellspacing=0  width="50%">
<thead  class="letrath">
  <tr >
     <th><spring:message  code="label.ConfigDivisasTBNamMonA"/></th>
     <th><spring:message  code="label.ConfigDivisasTBNamMonB"/></th>
     <th><spring:message  code="label.ConfigDivisasTBBaseMonA"/></th>
     <th><spring:message  code="label.ConfigDivisasTBBaseMonB"/></th>
     <th><spring:message  code="label.ConfigDivisasTBCambioAValorB"/></th>
    
  </tr>
  </thead>
  <c:forEach var="listValue" items="${divisas}">
  <tr  class="letra">
    <td align="center">${listValue.nombreMonedaA}</td> 
    <td align="center">${listValue.nombreMonedaB}</td>
    <td align="center">${listValue.baseMonedaA}</td>
    <td align="center">${listValue.baseMonedaB}</td>
    <td align="center">${listValue.cambioAValorB}</td>
  </tr>
	</c:forEach>
</table>


<br/>
<br/>
<br/>
</div>
</div>
<div id="datosbotonesComp">
		<div id="botonBack">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/productosFront"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar" /></a>
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