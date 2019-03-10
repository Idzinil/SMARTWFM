<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sytecso - SmartField</title>
		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSytecso.css"/>">
		<link rel="stylesheet" href="js/jquery-ui-1.12.1/jquery-ui.css">
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<script src="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.js"/>"></script>
		<script src="<c:url value="/js/Sytecso/sytecso.js"/>"></script>
		<script src="<c:url value="/js/productos/altaProductos.js"/>"></script>
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

	</script>
</head>
<body>
<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
<jsp:include page="menu3.jsp" /> 
	    <div id="tituloyBarraBusqueda">
		
	    </div>
<div id="tableroSytecso">
<div id="ventanaSytecso">
<div id="datos">
<form:form action="altaCuadrilla" method="POST"  modelAttribute="cuadrilla"  >
<p><label style="margin-left: 45%;" type="text">Alta de Cuadrilla</label></p>
<br/>
	<table align="center" width="45%" >
		<tr align="center">
	   		<td bgcolor="#FFFFFF">
					<form:input class="anchoCampos"  name="numeroCuadrilla" id="numeroCuadrilla" type="text" path="numeroCuadrilla"  required="true"/>
			</td>
			<td bgcolor="#FFFFFF">
	   		<form:label path="placas" class="encabezadoCampos">Placas:</form:label><br/>
	   		<form:input class="anchoCampos"  name="placas" id="placas" type="text" path="placas"  required="true" />
			</td>
		</tr>
		<tr align="center">
	   		<td bgcolor="#FFFFFF">
	   		<form:label path="cuenta.numCuenta" class="encabezadoCampos">Numero Cuenta Cliente:</form:label><br/>
					<form:input class="anchoCampos"  type="text" path="cuenta.numCuenta"   />
			</td>
			<td bgcolor="#FFFFFF">
	   		<form:label path="seleccionable" class="encabezadoCampos">seleccionable:</form:label><br/>
<%-- 				<form:select name="seleccionable" id="seleccionable" path="seleccionable" width="20px" required="true"> --%>
<!-- 					<option value="1">SI</option> -->
<!-- 					<option value="2">NO</option> -->
<%-- 				</form:select> --%>
				<form:radiobutton  name="radio-1" path="seleccionable" value="0" />
				<label for="radio-1" class="checkText">SI</label>
				<form:radiobutton  name="radio-2" path="seleccionable" value="1" />
				<label for="radio-2" class="checkText">NO</label>
			</td>
		</tr>
	</table>
	<br/>
	<div align="center">
		<spring:message  code="label.ConfigDivisasFormTBButtonCrear" var="DivisaBtn"/>
		<input class="w3-button w3-black w3-round-large"  type="submit" value="Crear Cuadrilla" />
	</div>	
	<div id="errMsg">
		<c:if test="${status }">
			<label style="color: black;">Error al registrar Cuadrilla</label>
		</c:if>
		<c:if test="${statusnullCta }">
			<label style="color: black;">Error la cuenta no existe</label>
		</c:if>
	</div>
</form:form>
	</div>
	

	<br/>
<br/>
<br/>
<br/>

<table border cellpadding=1 cellspacing=0  width="60%">
<thead  class="letrath">
  <tr >
     <th>idCuadrilla</th>
     <th>Numero Cuadrilla</th>
     <th>Placas</th>
     <th>idCuentacliente</th>
     <th>seleccionable</th>
  </tr>
  </thead>
  <c:forEach var="listValue" items="${cuadrillas}">
  <tr  class="letra">
    <td align="center">${listValue.idCuadrilla}</td> 
    <td align="center">${listValue.numeroCuadrilla}</td>
    <td align="center">${listValue.placas}</td>
    <td align="center">${listValue.cuenta_idcuentacliente}</td>
    <td align="center">${listValue.seleccionable_cuadrilla}</td>
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
					
					<a href="${pageContext.request.contextPath}/cuadrillasFront"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar" /></a>
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