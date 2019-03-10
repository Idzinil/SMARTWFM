<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="datos">
	<div id="datosForm">
		<form:form action="${pageContext.request.contextPath }/pagos/cuentas"
			method="POST" modelAttribute="cuenta">
			<table id="test" style="width: 90%;border: 0;"  class="letraPrincipal">
				<tr class="letrathPrincipal">
					<td  bgcolor="#2584A7"><form:label
							path="numCuenta" type="text">
							<b><spring:message  code="label.PagosNumCliente"/></b>
						</form:label> <abbr title="Campo obligatorio"> 
						<spring:message code="label.PagosNumClienteph" var="labelNUmClient"></spring:message>
						<form:input
								id="numCuenta" autocomplete="off" type="text" path="numCuenta"
								placeholder="${labelNUmClient }" />
					</abbr></td>
				</tr>
				<tr>
					<td class="letra" bgcolor="#2584A7"></td>
					<td class="letra" bgcolor="#2584A7">
					<spring:message code="label.PagosBtnBuscar" var="PagosBtnBuscar"></spring:message>
					<input
						class="w3-button w3-black w3-round-large" type="submit"
						value="${PagosBtnBuscar }" class="botonSmartBilling" /></td>
				</tr>

			</table>
		</form:form>
	</div>
</div>

