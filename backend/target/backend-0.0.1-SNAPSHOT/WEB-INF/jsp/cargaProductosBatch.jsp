<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>SmartBilling - RedIt</title>

		<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
		 <link rel="stylesheet" type="text/css" href="<c:url value = "/css/secciones.css"/>">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
		<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
		<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
		<script src="<c:url value="/js/principal/principal.js"/>"></script>
		<script src="<c:url value="/js/productos/productosBatch.js"/>"></script>
		<script type="text/javascript">
		function getPtoductosList() {
			return ${rechazados};
		}
		function myFunction() {

		    var x = document.getElementById("myDIV");
		    if (x.style.display === "none") {
		        x.style.display = "block";
		    }
		}
		main(getPtoductosList());
		</script>
		 <style>  
			table {  
		
			   
			    border: 1px #D8D8D8 solid;
			   font-family: arial, sans-serif;
			    
			   
			} 
			
				thead { 
				background: linear-gradient(to bottom, #0066cc 3%, #ccffff 84%);
				color: #424242;
			 }
			 tr:nth-child(even)
			 {
			 	background-color: #E6E6E6;
			 }
			.letra {
				font-size: 15px;
				}
			.letrath {
				font-size: 13px;
				}
			
			
		</style>
	</head>
    <body>
    <div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
		<div id="mainContainerDiv">		
				<jsp:include page="menu3.jsp" /> 
				<div id="tituloyBarraBusqueda">
					<div id="tituloTablero">
						<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;">  <spring:message  code="label.AdmProdCarga"/>
					</div>
				</div>
			<div id="tableroSmartBilling">
				<div id="ventanaBienvenidaSmartBilling">
			    	<div id="datos">
			    		<p>
							<label for="image"><spring:message  code="label.AdmProdCargaProd"/>.</label>
						</p>
			    		<div align="center" id="cargar">
							<a href="javascript:myFunction();"><img src ="${pageContext.request.contextPath}/img/cargar_archivo.png"></a>
							<div id="myDIV" style="display:none">
								<form:form action="upload" method="POST" enctype="multipart/form-data">
									<div class="form-group">
										<br/>
										<label><spring:message  code="label.AdmProdCargaProdRuta"/></label> <input type="file" name="file" />
									</div>
									<br />
									<br />
									<div class="form-group">
										<button class="w3-button w3-black w3-round-large" type="submit" id="upload"><spring:message  code="label.AdmProdCargaUpload"/></button>
									</div>
								</form:form>
							</div>
						</div>
						<c:if test="${status}">
							<a href="${pageContext.request.contextPath}/obtenerProductos"><spring:message  code="label.AdmProdCargaVerProd"/></a><br/>
							<table id="rechazados" align="center">
							</table>
						</c:if>
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
		</div>
	</body>
</html>
