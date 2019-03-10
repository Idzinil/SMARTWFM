<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SmartBilling - RedIt</title>
<link rel="stylesheet" type="text/css"  href="<c:url value="/css/estiloSmartBilling.css"/>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
<script src="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.js"/>"></script>
<script src="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/js/jquery-ui-1.12.1/jquery-ui.css"/>">
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
<script src="<c:url value="/js/productos/actualizacionProductos.js"/>"></script>
<script type="text/javascript">
	function getProdList() {
		return ${prods}
	}
	
	function lenguaje(){
		return "<spring:message  code="label.lang"/>";
	}
	
	producto(getProdList(), lenguaje());
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
</head>
<body>
<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
	<jsp:include page="menu3.jsp" />
	<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		           <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;">   <spring:message  code="label.AdmProdAct"/>
		    </div>
		
	    </div>
	<div id="mainDivCompra">
		
		<div id="containerActProducto"
			style="margin-left: 10px; height: 440px;">
			<table id="tableActProd">
			<thead>
					<tr>
						<th><spring:message  code="label.AdmProdActTbFech" /></th>
						<th><spring:message  code="label.AdmProdActTbSta" /></th>
						<th><spring:message  code="label.AdmProdActTbCu" /></th>
						<th><spring:message  code="label.AdmProdActTbDes" /></th>
						<th><spring:message  code="label.AdmProdActTbCod" /></th>
						<th><spring:message  code="label.AdmProdActTbCve" /></th>
						<th><spring:message  code="label.AdmProdActTbTipoC" /></th>
						<th><spring:message  code="label.AdmProdActTbBttn" /></th>
					</tr>
					</thead>
			

			</table>
		</div>

		<div id="containerActProducto"
			style="margin-left: 35px; height: 500px;">
			<div id="formProductos"></div>
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