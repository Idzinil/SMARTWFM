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

	function validar(){

	var todo_correcto = true;


	if(document.getElementById('identificadorSAP').value.length >0 ){
	    todo_correcto = false;
	}
	if(document.getElementById('nombreInsumo').value.length >0 ){
	    todo_correcto = false;
	}
	if(document.getElementById('descripcionInsumo').value.length >0 ){
	    todo_correcto = false;
	}
	if(document.getElementById('claveInsumo').value.length >0 ){
	    todo_correcto = false;
	}
	if((!/^([0-9])*$/.test(document.getElementById('totalInsumo')) ){
	    todo_correcto = false;
	}
	if(!todo_correcto){
		alert('Se requiere informacion en todos los datos');
		}

		return todo_correcto;
	}
	

	</script>
</head>
<body>
<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Espa�ol</a> | <a href="?lang=en">English</a> 
    	</div>
<jsp:include page="menu3.jsp" /> 
	    <div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		           <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> Alta de Tipo de Orden
		    </div>
		
	    </div>
<div id="tableroSytecso">
<div id="ventanaSytecso">
<div id="datos">
	<form:form action="altaTipoOrden?cuenta=${cuenta}" method="POST" commandName="comando" modelAttribute="tipoOrden"
		id="formInsumo"  onsubmit='return validar()'>
		<p><label style="margin-left: 35%;" type="text"><b>Tipo de Orden para el Cliente ${cuenta} </b></label></p>
		<table align="center" width="60%" >
			<tr align="center">
				<td bgcolor="#FFFFFF">
				<form:hidden  path="cuentaCliente_idCuenta" value="${idCuenta}"/>
					<form:label path="tipoOrden" class="encabezadoCampos">Tipo de Orden:</form:label><br/>
					<form:input class="anchoCampos"  name="tipoOrden" id="tipoOrden" type="text" path="tipoOrden"  required="true"/>
    			</td>
    			<td bgcolor="#FFFFFF">
					<form:label path="descipcionOrden" class="encabezadoCampos">Descripci�n Orden:</form:label><br/>
					<form:input class="anchoCampos"  name="descipcionOrden" id="descipcionOrden" type="text" path="descipcionOrden"   required="true" />
    			</td>
    		</tr>
    		<tr align="center">
				<td bgcolor="#FFFFFF">
				<form:label type="text" path="nombreOrden" class="encabezadoCampos">Nombre Orden:</form:label><br/>
				<form:input class="anchoCampos"  name="nombreOrden" id="nombreOrden" type="text" path="nombreOrden"  required="true"/>
				</td>
				<td bgcolor="#FFFFFF">
					<form:label path="tiempoOrdenProm" class="encabezadoCampos">Tiempo Orden Prom:</form:label><br/>
					<form:input class="anchoCampos"  name="tiempoOrdenProm" id="tiempoOrdenProm" type="time" path="tiempoOrdenProm"   required="true" />
    			</td>
    			
			</tr>
				<tr align="center">
				<td bgcolor="#FFFFFF">
					<form:label path="montoOrden" class="encabezadoCampos">Monto Orden:</form:label><br/>
					<form:input class="anchoCampos"  name="montoOrden" id="montoOrden" type="text" path="montoOrden"   required="true" />
    			</td>
				<td bgcolor="#FFFFFF">
				<form:label type="text" path="divisa" class="encabezadoCampos">Divisa:</form:label><br/>
					<form:select path="divisa" class="anchoCampos" >
						<option value="USD">USD</option>
						<option value="MXN">MXN</option>
					</form:select>
					</td>
			</tr>
			</table>
<br/>
			<div align="center">
			<spring:message  code="label.AdmProdFormBtn" var="ProdBtn"/>
				<input class="w3-button w3-black w3-round-large"  type="submit" value="Registrar" />
			</div>	
	</form:form>
	</div>
	

	<br/>
<br/>
<br/>
<br/>

<table border cellpadding=1 cellspacing=0  width="85%">
<thead  class="letrath">
  <tr >
     <th>Identificador SAP</th>
     <th>nombre Insumo</th>
     <th>descripci�n  Insumo</th>
     <th>clave Insumo</th>
     <th>total Insumo</th>
     <th>unidad Medida Insumo</th>
  </tr>
  </thead>
  <c:forEach var="listValue" items="${insumos}">
  <tr  class="letra">
    <td align="center">${listValue.identificadorSAP}</td>
    <td align="center">${listValue.nombreInsumo}</td>
    <td align="center">${listValue.descripcionInsumo}</td>
    <td align="center">${listValue.claveInsumo}</td>
    <td align="center">${listValue.totalInsumo}</td>
    <td align="center">${listValue.unidadMedidaInsumo}</td>
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