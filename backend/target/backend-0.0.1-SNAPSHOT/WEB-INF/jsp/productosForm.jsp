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
		    <div id="tituloTablero">
		           <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;">    <spring:message  code="label.AdmProdFormTittle"/>
		    </div>
		
	    </div>
<div id="tableroSmartBilling">
<div id="ventanaSmartBilling">
<div id="datos">
	<form:form action="altaProducto" method="POST" commandName="comando" modelAttribute="prod"
		id="formProducto">
		<p><label style="margin-left: 45%;" type="text"><b><spring:message  code="label.AdmProdFormDatosProd"/></b></label></p>
		<table align="center" width="60%" >
			<tr align="center">
				<td bgcolor="#FFFFFF"><label type="text"  class="encabezadoCampos "><spring:message  code="label.AdmProdFormImp"/>:</label><br/>
				<div class="divProducto" align="left">
							<form:checkbox  path="iva"
								 value="IVA"
								checked="checked"/><label class="checkText">IVA</label>&nbsp;
							<form:checkbox  path="ieps"
								 value="IEPS"
								checked="checked"/><label class="checkText">IEPS</label>&nbsp;	
	    		</div>	
    			</td>
				<td bgcolor="#FFFFFF"><form:label type="text" path="tipoCargo" class="encabezadoCampos"><spring:message  code="label.AdmProdFormTipoCarg"/>:</form:label><br/>
					<form:select path="tipoCargo" class="anchoCampos" >
						<option value="MRC"><spring:message  code="label.AdmProdFormTipoCargMRC"/></option>
						<option value="NRC"><spring:message  code="label.AdmProdFormTipoCargNRC"/></option>
						<option value="PE"><spring:message  code="label.AdmProdFormTipoCargPE"/></option>
						<option value="CME"><spring:message  code="label.AdmProdFormTipoCargCME"/></option>
					</form:select>
					</td>
			</tr>
			<tr align="center">
				<td  bgcolor="#FFFFFF">
					<label type="text"  class="encabezadoCampos"><spring:message  code="label.AdmProdFormFactCada"/></label><br/>
					<spring:message  code="label.AdmProdFormNummes" var = "numMes"/>
					<input id="facturaCada" class="anchoCampos" type="text" placeholder="${numMes}">
				</td>
					<td bgcolor="#FFFFFF">
					<form:label path="prorrateoRadio" class="encabezadoCampos"><spring:message  code="label.AdmProdFormSelProrr"/></form:label>
					<br>
					<div class="divProducto" align="left">
						<form:radiobutton  name="radio-1" path="prorrateoRadio" value="SI" checked="checked"/>
						<label for="radio-1" class="checkText"><spring:message  code="label.AdmProdFormSelProrrY" /></label>
						<form:radiobutton  name="radio-1" path="prorrateoRadio" value="NO"/>
						<label for="radio-2" class="checkText"><spring:message  code="label.AdmProdFormSelProrrN" /></label>
					</div>
				</td>
			</tr>
			<tr align="center">
				<td bgcolor="#FFFFFF" style="width: 40%;">
					<label for="name" class="encabezadoCampos"><spring:message  code="label.AdmProdFormMesesDisp" /></label>
					<br>
					<input type="text" class="anchoCampos" >
				</td>
				<td bgcolor="#FFFFFF">
					<label for="name" class="encabezadoCampos"><spring:message  code="label.AdmProdFormTermProd" /></label>
					<br>
					<div class="divProducto" align="left">
						<input  type="radio" name="radio-1" id="radio-1" value="FAC" >
						<label for="radio-2" class="checkText"><spring:message  code="label.AdmProdFormAutRenov" /></label>
						<input  type="radio" name="radio-1" id="radio-2" value="EX">
						<label for="radio-2" class="checkText"> <spring:message  code="label.AdmProdFormExpir" /></label>
					</div>		
				</td>	
			</tr>
			</table>
			<table align="center" width="60%" >
			<tr align="center" >
				<td bgcolor="#FFFFFF" style="width: 40%;">
				<label class="encabezadoTitulo"><spring:message  code="label.AdmProdFormDestalDisp" /></label><br/><br/>
				<form:label path="estatus" class="encabezadoCampos"><spring:message  code="label.AdmProdFormStatus" />:</form:label><br/>
				<div class="divProducto" align="left">
				<form:radiobutton name="radio-1" path="estatus" value="AC" checked="checked"/>
						<label for="radio-1" class="checkText" ><spring:message  code="label.AdmProdFormAct" /></label>
						<form:radiobutton  name="radio-1" path="estatus" value="CA"/>
						<label for="radio-2" class="checkText"><spring:message  code="label.AdmProdFormInact" /></label>
					</div>	
				</td>
				<td bgcolor="#FFFFFF">
				<br/><br/>
					<form:label path="fechaCreacion" class="encabezadoCampos" ><spring:message  code="label.AdmProdFormDispo" />:</form:label>
					<br/>
					<form:input class="anchoCampos"  type="text" id="calendarDisponible" path="fechaCreacion" style="margin-left: 30px;" required="true"/>
					<img class="alineacionImage" src="img/calendario_azul.png" style="width:  25px;">	 
				</td>
			</tr>	
			</table>
			<table align="center" width="60%" >
				<tr align="center">	
					<td bgcolor="#FFFFFF" style=" width: 40%;">
					<label class="encabezadoTitulo"><spring:message  code="label.AdmProdFormInfoAd" /></label><br/><br/>
					<form:label path="monedaProducto" class="encabezadoCampos"><spring:message  code="label.AdmProdFormMondProd" />:</form:label><br/>
					<form:select class="anchoCampos"  path="monedaProducto" required="true">
						<option value="MXN">MXN</option>
						<option value="USD">USD</option>
					</form:select>
						<td bgcolor="#FFFFFF">
						<br/><br/>
						<form:label path="descripcion" class="encabezadoCampos" ><spring:message  code="label.AdmProdFormDescProd" />:</form:label><br/>
						<spring:message  code="label.AdmProdFormDescProdph" var="DescProd" />
						<form:input class="anchoCampos"  type="text"  path="descripcion" placeholder="${DescProd}" required="true"/></td>
				</tr>
				<tr align="center">
					<td bgcolor="#FFFFFF"><form:label path="idSalesforce" class="encabezadoCampos" ><spring:message  code="label.AdmProdFormCodProd" />:</form:label>
					<spring:message  code="label.AdmProdFormCodProdph" var="codProd" />
					<form:input class="anchoCampos"  type="text" path="idSalesforce" placeholder="${codProd }" required="true"/></td>
					<td bgcolor="#FFFFFF"><form:label path="claveProdSat" class="encabezadoCampos"><spring:message  code="label.AdmProdFormCveProdSat" />:</form:label><br/>
					<spring:message  code="label.AdmProdFormCveProdSat" var="cveprodSat"/>
					<form:input class="anchoCampos"  type="text" path="claveProdSat" placeholder="${cveprodSat}" required="true"/></td>		
	
				</tr>
				
				<tr align="center">
						<td bgcolor="#FFFFFF"><form:label path="capacidad" class="encabezadoCampos"><spring:message  code="label.AdmProdFormCap" />:</form:label><br/>
	   					<spring:message  code="label.AdmProdFormCap" var="cap"/>
	   					<form:input class="anchoCampos"  path="capacidad" type="text" placeholder="${cap }" required="true"/>
	   				</td>
	   				<td bgcolor="#FFFFFF"><form:label path="familia" class="encabezadoCampos"><spring:message  code="label.AdmProdFormFam" />:</form:label><br/>
	   				<spring:message  code="label.AdmProdFormFam" var="fam"/>
					<form:input class="anchoCampos"  type="text" path="familia" placeholder="${fam}" required="true"/></td>
				</tr>
			</table><br/>
<br/>
			<div align="center">
			<spring:message  code="label.AdmProdFormBtn" var="ProdBtn"/>
				<input class="w3-button w3-black w3-round-large"  type="submit" value="${ProdBtn }" />
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
     <th><spring:message  code="label.AdmProdTabFechCr" /></th>
     <th><spring:message  code="label.AdmProdTabMndProd" /></th>
     <th><spring:message  code="label.AdmProdTabDesc" /></th>
     <th><spring:message  code="label.AdmProdTabSalesF" /></th>
     <th><spring:message  code="label.AdmProdTabCveProd" /></th>
     <th><spring:message  code="label.AdmProdTabTC" /></th>
     <th><spring:message  code="label.AdmProdTabFam" /></th>
     <th><spring:message  code="label.AdmProdTabCap" /></th>
  </tr>
  </thead>
  <c:forEach var="listValue" items="${prods}">
  <tr  class="letra">
    <td align="center">${listValue.fechaCreacion}</td> 
    <td align="center">${listValue.monedaProducto}</td>
    <td align="center">${listValue.descripcion}</td>
    <td align="center">${listValue.idSalesforce}</td>
    <td align="center">${listValue.claveProdSat}</td>
    <td align="center">${listValue.tipoCargo}</td>
    <td align="center">${listValue.familia}</td>
    <td align="center">${listValue.capacidad}</td>
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