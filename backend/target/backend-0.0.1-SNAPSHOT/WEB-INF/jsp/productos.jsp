<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>SmartBilling - RedIt</title>
	<link href="<c:url value="/css/estiloSmartBilling.css" />" 	rel="stylesheet">
	<link rel="stylesheet" href="css/jquery.dataTables.min.css">
	<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
	<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
	<style>  
			table {  
			    
			    width:100%;
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
			fieldset{
			  border: 1px solid rgb(216,225,231) 22%;
			  width: 400px;
			  margin:auto;
			}
			
		</style>
	<script>
	
	function myFunction(prueba) {
		document.getElementById("imto").value=prueba;
	    var x = document.getElementById("myDIV");
	    if (x.style.display === "none") {
	        x.style.display = "block";
	    }
	}
	</script>
</head>
<body>
<jsp:include page="menu4.jsp" /> 
	    <div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		            <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;">    Alta de Impuestos
		    </div>
		
	    </div>
<div id="tableroSmartBilling">
	<div id="ventanaSmartBilling">
			<div id="datos">
				<form:form action="altaImpuesto" method="POST" commandName="comando" id="formCuenta" >
				<div id="datosCuenta">
					<table cellpadding=10 cellspacing=0>
						<tr align="center" >
							<td bgcolor="#FFFFFF"> <label type="text" >Tasa Impuesto:</label>
							<input type="text" name="tasaimp" placeholder="Tasa Impuesto"  required></td>
						</tr>
						<tr align="center">
							<td bgcolor="#FFFFFF"> <label type="text" >Tipo Impuesto:</label> 
							<input type="text" name="tipoimp" placeholder="Tipo Impuesto"  required></td>
						</tr>
						<tr align="center">
							<td bgcolor="#FFFFFF"> <label type="text" >Pais Impuesto:</label> 
							<select name="paisimp" style=" width: 70% !important;" >
								<option value="MEX">MEXICO</option>
								<option value="CR">COSTARICA</option>
								<option value="PAN">PANAMA</option>
							</select>
							</td>
						</tr>
						<tr align="right">
							<td bgcolor="#FFFFFF"><button class="w3-button w3-black w3-round-large" type="submit">Alta Impuesto!</button></td>
							<td bgcolor="#FFFFFF"></td>
						</tr>
					
					</table>
				</form:form>
			
			
			<br/>
			<br/>
			<br/>
			<br/>
			 	</div>
				<div id="datosFiscales">
					<table  border cellpadding=1 cellspacing=0 >
					<thead class="letrath">
					  <tr>
					    <th>Tasa Impuesto</th>
					    <th>Tipo Impuesto</th> 
					    <th>País</th>
					  </tr>
					  </thead>
					  <c:forEach var="listValue" items="${prods}">
					  <tr class="letra">
					    <td bgcolor="#FFFFFF"align="center">${listValue.tasaImpuesto}</td>
					    <td bgcolor="#FFFFFF" align="center">${listValue.tipoImpuesto}</td> 
					    <td bgcolor="#FFFFFF" align="center">${listValue.paisImpuesto}</td>
					  </tr>
						</c:forEach>
					</table>
				 </div>
				
				<br/>
				<br/>
				<br/>
			</div>
	<div id="myDIV" style="display:none">
		<form:form action="upload" method="POST"
			enctype="multipart/form-data">
			<div class="form-group">
				<label>Impuesto: <input type="text" name="imto" id="imto" readonly="readonly"></label>
				<br />
				<label>File input</label> <input type="file" name="file" />
			</div>
			<br />
			<br />
			<div class="form-group">
				<button type="submit" id="upload">Upload</button>
			</div>
		</form:form>
	</div>
	</div>
</div>
<div id="datosbotonesComp">
		<div id="botonBack">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/regresar.png">Regresar</a>
				</div>
			</div>
		<div id="botonHome">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png">Principal</a>
				</div>
			</div>
		</div>
</body>
</html>