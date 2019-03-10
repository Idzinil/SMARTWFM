<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

		<title>
       		SMARTBILLING - Sytecso System
    	</title>
	<link href="<c:url value="/css/estiloSmartBilling.css" />" 	rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<link rel="stylesheet" type="text/css" href="css/estiloSmartBilling.css">
	<link rel="stylesheet" href="css/jquery.dataTables.min.css">
	<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
	<script src="<c:url value="/js/jquery.dataTables.min.js"/>"> </script>
	<script>
	function myFunction(prueba) {
		document.getElementById("imto").value=prueba;
	    var x = document.getElementById("myDIV");
	    if (x.style.display === "none") {
	        x.style.display = "block";
	    }
	}
	</script>
	<style>
			table {  
			    
			    
			     border: 1px #D8D8D8 solid;
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
		</style>
</head>
<body>
	<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
<jsp:include page="menu2.jsp" /> 
		
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;">  <spring:message  code="label.tittleUsrs"/>
		    </div>
		</div>
		<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
		<label type="text"><p><spring:message  code="label.UsrAdmTittle"/></p></label>
		<div id="datos"> 

	<form:form action="formularioUsuarioCuenta" method="POST" commandName="comando" id="formCuenta">
<table style="border:none;">
	
		<tr>
			<td bgcolor="#ffffff">
				<button class="w3-button w3-black w3-round-large" type="submit"><spring:message  code="label.UsrAdmButtn"/></button>
			</td>
			
		</tr>
		
	
</table>
</form:form>

<BR>
<div id="datosCuenta">
<table  border cellpadding=1 cellspacing=0 width="100%">
<thead>
  <tr class="letrath">
    <th><spring:message  code="label.UsrAdmTbUsr"/></th> 
    <th><spring:message  code="label.UsrAdmTbEstatus"/></th>
    <th><spring:message  code="label.UsrAdmTbNivel"/></th>
    <th><spring:message  code="label.UsrAdmTbModif"/></th>
    <th><spring:message  code="label.UsrAdmTbSusp"/></th>
    <th><spring:message  code="label.UsrAdmTbCancelar"/></th>
  </tr>
  </thead>
  <c:forEach var="listValue" items="${userlts}" >
  <tr class="letra">
    <td align="center"><B>${listValue.login}</B></td> 
    <td align="center"><c:if test="${listValue.status=='1'}"><spring:message  code="label.UsrAdmTbStatusAct"/></c:if><c:if test="${listValue.status=='11'}"><spring:message  code="label.UsrAdmTbStatusCanc"/></c:if><c:if test="${listValue.status=='10'}"><spring:message  code="label.UsrAdmTbStatusSusp"/></c:if></td>
    <td align="center">${listValue.nivelCuenta}</td>
     <td align="center"><a href="${pageContext.request.contextPath}/usuarioCuenta/modUsersAdm?usr=${listValue.idUsuarioCuenta}"><img src="/SmartBilling/img/edit_icn.png" ></p></a></td>
     <td align="center"><a href="${pageContext.request.contextPath}/usuarioCuenta/suspdUsersAdm?usr=${listValue.idUsuarioCuenta}"><img src="/SmartBilling/img/edit_icn.png" ></a></td>
     <td align="center"><a href="${pageContext.request.contextPath}/usuarioCuenta/canUsersAdm?usr=${listValue.idUsuarioCuenta}"><img src="/SmartBilling/img/edit_icn.png" ></a></td>
  </tr>
  	</c:forEach>
</table>
<br>
<br>
<br>
</div>
</div>
</div>
</div>
						<div id="datosbotonesComp">
							<div id="botonBack">
								<div class="col-sm-6">
									<a href="${pageContext.request.contextPath}/cuentasFront"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
								</div>
							</div>
							<div id="botonHome">
								<div class="col-sm-6">
									<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png"><spring:message  code="label.NavRegresar"/></a>
								</div>
							</div>
						</div>
</body>
</html>