<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div>
	<form:form id="formPago" method="POST"
		action="${pageContext.request.contextPath.concat(pathPagar)}"
		modelAttribute="pago">
		<div>
			<label>Monto a pagar: </label><br/>
			<form:input id="montoPago" type="text" path="restantePago"
					autocomplete="off" onclick="smartBilling.entryOnlyPositiveNumbers(this)"/>
		</div>
		<div>			
			<label>Moneda:</label><br/> 
			<form:select id="selectMoneda" path="moneda" width="20px"
					required="true">
					<option></option>
					<form:option value="MXN">MXN</form:option>
					<form:option value="USD">USD</form:option>
				</form:select>
		</div>
		<div>		
			<label>Tipo de cambio: </label><br/>	
			<form:input path="tipoCambio" autocomplete="off" required="true" onclick="smartBilling.entryOnlyPositiveNumbers(this)"></form:input>
		</div>	
	</form:form>
</div>
