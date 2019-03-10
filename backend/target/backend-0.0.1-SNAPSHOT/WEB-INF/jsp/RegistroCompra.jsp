<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="headerCompra.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	function getComprasList() {
		return ${cmp};
	}
	function getJsonEstatus() {
		return ${jsonEstatus};
	}
	function getjsonProductos() {
		return ${prods};
	}
	function lenguaje() {
		return "<spring:message  code="label.lang"/>";
	}
		var jsonCompra = mainCompras.jsonCompras("<spring:message  code="label.CmpRegTBComIdCliente"/>","<spring:message  code="label.CmpRegTBCompDesc"/>",
				"<spring:message  code="label.CmpRegTBCapacidad"/>","<spring:message  code="label.CmpRegTBCant"/>",
				"<spring:message  code="label.CmpRegTBCompMont"/>","<spring:message  code="label.CmpRegTBCompMone"/>","<spring:message  code="label.CmpRegTBCompStatus"/>","<spring:message  code="label.CmpRegTBCompActu"/>","<spring:message  code="label.CmpRegTBBtnAct"/>");
		var jsonProd = mainCompras.jsonProductos("<spring:message  code="label.CmpTabProdBtn"/>");
		compras(getComprasList(), getjsonProductos(), lenguaje(),jsonCompra,jsonProd);	

	
});
</script>
</head>
<body>

	<jsp:include page="menu4.jsp" />
	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;">
			<spring:message code="label.tittleCompras" />
		</div>
	</div>
	<div id="tableroSmartBilling">

		<div class="contenido">

			<div class="columnasSmartBilling">

				<div id="mainDivCompra">

					<div id="containerCompra" class="divHW1">
						<p>
							<label style="margin-left: 40%;" ><b><spring:message
										code="label.tableTitleCompras" /></b></label>
						</p>
						<table id="data" class="tablePrincipal">
							<thead class="theadPrincipal">
								<tr class="letrathPrincipal">
									<th><spring:message code="label.CmpRegTBComIdCliente" /></th>
									<th><spring:message code="label.CmpRegTBCompDesc" /></th>
									<th><spring:message code="label.CmpRegTBCapacidad" /></th>
									<th><spring:message code="label.CmpRegTBCant" /></th>
									<th><spring:message code="label.CmpRegTBCompMont" /></th>
									<th><spring:message code="label.CmpRegTBCompMone" /></th>
									<th><spring:message code="label.CmpRegTBCompStatus" /></th>
									<th><spring:message code="label.CmpRegTBCompActu" /></th>
									<th><spring:message code="label.CmpContractId" /></th>
								</tr>
							</thead>
						</table>
					</div>

					<div id="containerCompra" class="divHW2">
						<p>
							<label style="margin-left: 15%;" type="text"><b><spring:message
										code="label.tableTitleProductos" /></b></label>
						</p>
						<table id="productos" class="tablePrincipal">
							<thead class="theadPrincipal">
								<tr class="letrathPrincipal">
									<th><spring:message code="label.CmpRegTBProdSF" /></th>
									<th><spring:message code="label.CmpRegTBProdDes" /></th>
									<th><spring:message code="label.CmpRegTBProdPrec" /></th>
									<th><spring:message code="label.CmpRegTBProdMon" /></th>
									<th><spring:message code="label.CmpRegTBProdTC" /></th>
									<th><spring:message code="label.CmpRegTBProdComprar" /></th>
								</tr>
							</thead>
						</table>
					</div>
					<div id="datosbotonesComp">
						<div id="botonBack">
							<div class="col-sm-6">

								<a
									href="${pageContext.request.contextPath}/irBuscarCta?seccion=<%=session.getAttribute("seccionLoad") %>"><img
									src="/SmartBilling/img/regresar.png">
								<spring:message code="label.NavRegresar" /></a>
							</div>
						</div>
						<div id="botonHome">
							<div class="col-sm-6">

								<a href="${pageContext.request.contextPath}/principal"><img
									src="${pageContext.request.contextPath}/img/home.png">
								<spring:message code="label.NavPrin" /></a>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>


</body>

</html>