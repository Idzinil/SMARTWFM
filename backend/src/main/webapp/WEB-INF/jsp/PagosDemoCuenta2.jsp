<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>SMARTBILLING - Sytecso System</title>
<link rel="stylesheet" type="text/css" href="css/estiloSmartBilling.css">
	<link rel="stylesheet" href="js/jquery-ui-1.12.1/jquery-ui.css">
	<script src="js/jquery-1.12.4.js"></script>
	<script src="js/utils/UrlUtils.js"></script>
	<script src="js/SmartBilling/smartBilling.js"></script>
	<script src="js/cuentas/actualizaEstatusCuenta.js"></script>
	<script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
<title>SMARTBILLING - Sytecso System</title>
</head>
<body>
	<jsp:include page="menu5.jsp" />
	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="/SmartBilling/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> ${ nombreMenuFacturacion}
		</div>
	</div>
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
			<div class="datos">
				<div class="contenido">
					<div id="datos">
						<div id="datosForm1" style="width: auto;">
							<table style="width: 80%" class="tableFiltroColor">
								<tr class="letrathPrincipal">
									<td>N&uacute;mero Cliente:</td>
									<td><input id="cuenta" class="resFac" /></td>
									<td>Alias Cliente:</td>
									<td><input id="aliasCliente" class="resFac" /></td>
									<td>N&uacute;mero Factura:</td>
									<td><input id="numeroFactura" class="resFac" /></td>
									<td>Nombre Cliente:</td>
									<td><input id="nombreCliente" class="resFac" /></td>

								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><button id="btnBillginFiltroBuscarDatosFacturado">Buscar</button>
									</td>
									<td></td>
									<td><button id="btnBillgLimpiarFiltro">Limpiar</button></td>
								</tr>
								<tr>
									<td bgcolor="#2584A7">
										<div id="errMsg"></div>
									</td>
									<td bgcolor="#2584A7"></td>
									<td bgcolor="#2584A7"></td>
									<td bgcolor="#2584A7"></td>
									<td bgcolor="#2584A7"></td>
									<td bgcolor="#2584A7"></td>
									<td bgcolor="#2584A7"></td>
									<td bgcolor="#2584A7"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div id="datosForm" align="center">
					<table class="tablePrincipal" width="90%">
						<tbody>
							<tr>
								<form id="formPago" method="POST"		action="">
									<td><label>Monto a pagar:</label></td>
									<td><input  type="text"
											 autocomplete="off" /></td>
									<td><input type="submit"
										class="w3-button w3-black w3-round-large"
										style="font-size: 11px;" value="Pagar"></td>
								</form>
								<td>Saldo a Favor: <strong> <fmt:setLocale
											value="en_US" scope="session" /> <fmt:formatNumber value="0"
											type="currency" maxFractionDigits="3" pattern="$#,##0.0##" /></strong>
								</td>
								<td><form method="POST" action="/Smartbilling/">
										<input type="submit" disabled="true"						
											class="w3-button w3-black w3-round-large"
											style="font-size: 11px;" value="Usar saldo a favor" />
									</form></td>
							</tr>
						</tbody>
					</table>
					<table style="width: 90%" id="test" class="tablePrincipal">
						<thead class="theadPrincipal">
							<tr class="letrathPrincipal">
								<th>N&uacute;mero Cliente</th>
								<th>Alias Cliente</th>
								<th>Nombre Cliente</th>
								<th>N&uacute;mero Factura</th>
								<th>Monto Factura</th>
								<th>Deuda Factura</th>
								<th>Monto Pagado</th>
								<th>Periodo</th>
								<th>Moneda</th>
							</tr>
						</thead>
						<tbody id="fBody">
							<tr class="letraPrincipal">
								<td id="cuenta">123456</td>
								<td id="aliasCliente">AXTEL</td>
								<td id="nombreCliente">AXTEL S.A.B DE C.V.</td>
								<td id="numeroFactura"><strong><a href="SmartBilling/test/pagos/contratos/12346/FT-5">FT-5</a></strong></td>
								<td><strong> $114,314.56</strong></td>
								<td>$0.0/</td>
								<td>$0.0</td>
								<td>2018-09-01 A 2018-09-30</td>
								<td>MXN</td>
							</tr>
							<tr class="letraPrincipal">
								<td id="cuenta">12346</td>
								<td id="aliasCliente">AXTEL</td>
								<td id="nombreCliente">AXTEL S.A.B DE C.V.</td>
								<td id="numeroFactura"><strong><a href="SmartBilling/test/pagos/contratos/12346/FT-1">FT-1</a></strong></td>
								<td><strong> $214,314.56</strong></td>
								<td>$0.0</td>
								<td>$0.0</td>
								<td>2018-08-01 A 2018-08-31</td>
								<td>USD</td>
							</tr>
						</tbody>
					</table>
					<br />
				</div>
			</div>

		</div>

	</div>
	<br />
	<br />
	<jsp:include page="divRegresarPrincipal.jsp" />
</body>
<script type="text/javascript">
	function msg() {
		if ("${status}") {
			alert("${msg}");
		}
	}
	window.onload = setTimeout(msg, 100);
</script>
</html>