<%@page import="org.springframework.ui.Model"%>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="main">
	<div class="formActProd">
		<form:form action="actualizaProducto" method="POST"
			modelAttribute="prod" id="formCuenta">
			<table cellspacing="15">
				<tr align="center">
				<td bgcolor="#FFFFFF" style="width: 40%;">
				<label class="encabezadoTitulo"><spring:message  code="label.AdmProdActDetal"/></label><br/><br/>
				<form:label path="estatus" class="encabezadoCampos"><spring:message  code="label.AdmProdActEstatus"/>:</form:label><br/>
						<form:select path="estatus">
							<form:options items="${estatusProd}" />
						</form:select>
				</td>
				<td bgcolor="#FFFFFF">
				<br/><br/>
				<form:label path="claveProdSat" class="encabezadoCampos"><spring:message  code="label.AdmProdActCveProd"/>:</form:label><br/>
				
						<form:input type="text" name="prodsat" path="claveProdSat"
							placeholder="Clave Prod Sat" /></td>
				</tr>
				<tr align="center">
					<td bgcolor="#FFFFFF" style=" width: 40%;">
					<form:label path="monedaProducto" class="encabezadoCampos"><spring:message  code="label.AdmProdActModProd"/>:</form:label><br/> 
							<form:select path="monedaProducto">
							<form:options items="${tipoMonedas}" />
						</form:select></td>
					<td bgcolor="#FFFFFF"><form:label path="familia" class="encabezadoCampos"><spring:message  code="label.AdmProdActFam"/>:</form:label><br/>
					<spring:message  code="label.AdmProdActFam" var="fam"/>
						<form:input type="text" path="familia" placeholder="${fam }" /></td>	
				</tr>
				
				<tr align="center">
					<td bgcolor="#FFFFFF">
					<form:label path="descripcion" class="encabezadoCampos" ><spring:message  code="label.AdmProdActDesProd"/>:</form:label><br/>
						<spring:message  code="label.AdmProdActDesProd" var="desc"/>
						<form:input type="text" name="descripcion" path="descripcion"
							placeholder="${desc}" class="descr" /></td>
					<td bgcolor="#FFFFFF"><form:label path="capacidad" class="encabezadoCampos"><spring:message  code="label.AdmProdActCap"/>:</form:label><br/>
						<spring:message  code="label.AdmProdActCap" var="cap"/>
						<form:input id="capacidad" path="capacidad"
							placeholder="${cap }" />	
				</tr>
				<tr align="center">
					<td bgcolor="#FFFFFF"><form:label path="idSalesforce" class="encabezadoCampos" ><spring:message  code="label.AdmProdActCodProd"/>:</form:label><br/>
						<spring:message  code="label.AdmProdActCodProdph" var="codProd"/>
						<form:input type="text" name="sales" path="idSalesforce"
							placeholder="${codProd }" /></td>
				<td bgcolor="#FFFFFF"><form:label path="idSalesforce" class="encabezadoCampos" ><spring:message  code="label.AdmProdActImp"/>:</form:label><br/> 
					<c:forEach
							var="item" items="${prod.impuestos}">
							<input type="checkbox" name="idImpuestos"
								value="${item.idImpuesto}" <c:if test="${item.checkImpuesto}">
								checked</c:if>
								>${item.tipoImpuesto}${item.tasaImpuesto}&nbsp;
    				</c:forEach>
    			</td>		
				</tr>
				<tr align="center">
					<td bgcolor="#FFFFFF"></td>
					<spring:message  code="label.AdmProdActBtn" var="act"/>
					<td bgcolor="#FFFFFF"><input type="submit" value="${act }" /></td>

				</tr>


			</table>
		</form:form>
		<%
			Long idProducto = (Long) request.getAttribute("idProd");
			pageContext.setAttribute("idProducto", idProducto, PageContext.APPLICATION_SCOPE);
		%>
	</div>

</div>
