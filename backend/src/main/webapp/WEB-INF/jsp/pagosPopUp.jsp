<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script type="text/javascript">
$(document).ready(function(){
	if($("#selectMoneda").val()=="MXN"){$("#tipoCambio").attr("readOnly",true);}
	$("#selectMoneda").on("change",function(){
		if($(this).val()=="USD"){$("#tipoCambio").attr("readOnly",false);
		}else{$("#tipoCambio").val("").attr("readOnly",true);}
	});
	$("#pagoCustom").on("click",function(){
		if($(this).is(":checked")){
			$("#formPago").attr("action","${pageContext.request.contextPath.concat(pathPagar)}");
		}else{
			$("#formPago").attr("action","${pageContext.request.contextPath.concat(pathSimplePagar)}");
		}
	});
});
</script>
<div>
	<form:form id="formPago" method="POST"
		action="${pageContext.request.contextPath.concat(pathSimplePagar)}"
		modelAttribute="pago">
		<c:if test="${isNormalPago }">
		<div>
			<label>Monto a pagar: </label><br/>
			<form:input id="montoPago" type="text" path="restantePago" readonly="true"
					autocomplete="off" onclick="smartBilling.entryOnlyPositiveNumbers(this)"/>
		</div>
		<div>			
			<label>Moneda:</label><br/> 
			<form:select id="selectMoneda" path="moneda" width="20px"
					required="true">
					<c:forEach var="listVar" items="${divisa}" varStatus="status"><option>${listVar}</c:forEach>
				</form:select>
		</div>
		</c:if>
		<div>
			<label>Pago Custom</label>
			<form:checkbox id="pagoCustom" path="pagoCustom"/>
		</div>
		<c:if test="${isNormalPago }">
		<div>		
			<label>Tipo de cambio: </label><br/>	
			<form:input id="tipoCambio" path="tipoCambio" placeholder="${valorDivisa }" autocomplete="off" required="true" onclick="smartBilling.entryOnlyPositiveNumbers(this)"></form:input>
		</div>	
		</c:if>
	</form:form>
</div>
