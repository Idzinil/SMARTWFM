<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
<table class="tablePrincipal"style="width: 90%" align="center">
	<tbody>
		<tr>
			<td><strong>Monto Pago Ingresado a ${tipo} :</strong> <fmt:setLocale value="en_US"
						scope="session" /> <fmt:formatNumber value="${montoPagar}"
						type="currency" maxFractionDigits="3" pattern="$#,##0.0##" /> ${moneda}</td>
		</tr>
		<tr>
			<td><strong>Deuda de ${tipo} : </strong><fmt:setLocale value="en_US"
						scope="session" /> <fmt:formatNumber value="${deuda}"
						type="currency" maxFractionDigits="3" pattern="$#,##0.0##" /> ${moneda}</td>
		</tr>
		<tr>
			<td><strong>Monto Pago Disponible a aplicar :</strong> <fmt:setLocale value="en_US"
						scope="session" /> <fmt:formatNumber value="${montoDispoPago}"
						type="currency" maxFractionDigits="3" pattern="$#,##0.0##" /> ${moneda}</td>
		</tr>
	</tbody>
</table>
</div>