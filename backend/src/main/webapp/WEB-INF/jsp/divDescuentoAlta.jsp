<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="divDescuento">
	<p>
		<label><b>Descuento </b></label>
	</p>
	<table>
		<tr>
			<td bgcolor="#FFFFFF"><label>Fecha Fin</label> <br /> <form:input
					id="fechaFin" type="text" path="descuento2.fechaFin" placeholder="dd-mm-yyyy" /></td>
			<td bgcolor="#FFFFFF"><form:errors	path="descuento2.tipoDescuento" class="control-label"></form:errors>
				<label>Tipo Descuento</label><br /> 
				<form:select id="sDescuento"	path="descuento2.tipoDescuento" style="width:90%">
					<form:option value="0">---</form:option>
					<form:option value="1">Monto</form:option>
					<form:option value="2">Porcentaje</form:option>
				</form:select></td>
			<td bgcolor="#FFFFFF"><form:errors
					path="descuento2.montoDescuento" class="control-label"></form:errors>
				<label>Monto Descuento</label> <br /> 
				<form:input	id="montoDescuento" disabled="true" path="descuento2.montoDescuento" placeholder="$0.0" required="true" /></td>	
			<td bgcolor="#FFFFFF"><form:errors path="descuento2.porcentaje"
					class="control-label"></form:errors> <label>Porcentaje</label> <br />
				<form:input id="porcentaje" disabled="true" type="text" path="descuento2.porcentaje" placeholder="0.0%" required="true" /></td>
		</tr>
	</table>
	<hr>
</div>