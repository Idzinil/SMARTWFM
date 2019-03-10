<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
	integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SMARTBILLING - Sytecso System</title>
<script>
	$(document)
			.on(
					"click",
					"[type='checkbox']",
					function(e) {
						if (this.checked) {
							$(this).attr("value", "true");
							$('input[name="password"]').removeAttr('disabled');
							$("#div1").show();
							alert('Te recordamos que con esta opción, se establecera como contraseña, lo contenido en el campo password...\nSe aceptan [ Mayúsculas, Minúsculas, _#$! ] y una longitud entre [8-16] caracteres...');
						} else {
							$(this).attr("value", "false");
							$("#div1").hide();
							$('input[name="password"]').attr("disabled",
									"disabled");
							$('input[name="password"]').removeAttr('required');
							$('input[name="password"]').val("");
						}
					});
</script>

<link href="<c:url value="/css/estiloSmartBilling.css" />" 	rel="stylesheet">
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
}

td, th {
	text-align: left;
	padding: 8px;
}

thead {
	background: linear-gradient(to bottom, #2E2E2E 3%, #151515 84%);
	color: #E6E6E6;
}

tr:nth-child(even) {
	background-color: #E6E6E6;
}

.letra {
	font-size: 13px;
	color: white;
}

.letrath {
	font-size: 15px;
	color: white;
}
}
</style>
</head>
<body>
<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
	<jsp:include page="menu2.jsp" />

	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> <spring:message  code="label.UsrAdmFormModf"/>
		</div>
	</div>
	<div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
			<label type="text"><p><spring:message  code="label.UsrAdmFormModfDtosUsr"/></p></label>

			<div id="datos">
				<div id="datosForm1">
					<form:form action="modificaUsuarioCuenta" method="POST"
						commandName="comando" id="formUsuarioCuenta">
						<table width="70%" class="letrath">
							<tr>
								<td bgcolor="#2584A7"><spring:message  code="label.UsrAdmFormModfLogin"/>:</td>
								<td bgcolor="#2584A7"><input type="text" name="login"
									value="<c:out value='${elusuario.login}'/>"></td>
							</tr>
							<tr>
								<td bgcolor="#2584A7"><spring:message  code="label.UsrAdmFormModfpass"/>?</td>
								<td bgcolor="#2584A7"><input type="checkbox" name="cmbpwd"
									value="false" />
									<div id='div1' style='display: none;'>
										<input type="password" disabled name="password" pattern="[A-Za-z0-9_#$!]{8,16}" required/>
									</div></td>
							</tr>
							<tr>
								<td bgcolor="#2584A7"><spring:message  code="label.UsrAdmFormModfNivelCta"/>:</td>
								<td bgcolor="#2584A7"><select name="nivelCuenta">
										<c:if test="${elusuario.nivelCuenta=='USER'}">
											<option selected value="USER">USUARIO</option>
										</c:if>
										<c:if test="${elusuario.nivelCuenta!='USER'}">
											<option value="USER">USUARIO</option>
										</c:if>
										<c:if test="${elusuario.nivelCuenta=='BILLING'}">
											<option selected value="BILLING">FACTURACION</option>
										</c:if>
										<c:if test="${elusuario.nivelCuenta!='BILLING'}">
											<option value="BILLING">FACTURACION</option>
										</c:if>
										<c:if test="${elusuario.nivelCuenta=='CONFIG'}">
											<option selected value="CONFIG">CONFIGURACION</option>
										</c:if>
										<c:if test="${elusuario.nivelCuenta!='CONFIG'}">
											<option value="CONFIG">CONFIGURACION</option>
										</c:if>
										<c:if test="${elusuario.nivelCuenta=='ADMIN'}">
											<option selected value="ADMIN">ADMINISTRACION</option>
										</c:if>
										<c:if test="${elusuario.nivelCuenta!='ADMIN'}">
											<option value="ADMIN">ADMINISTRACION</option>
										</c:if>
								</select></td>
							</tr>
							<tr>
								<td bgcolor="#2584A7"><spring:message  code="label.UsrAdmFormModfStatus"/>:</td>
								<td bgcolor="#2584A7"><select name="status">
										<c:if test="${elusuario.status=='1'}">
											<option selected value="1">ACTIVO</option>
										</c:if>
										<c:if test="${elusuario.status!='1'}">
											<option value="1">ACTIVO</option>
										</c:if>
										<c:if test="${elusuario.status=='10'}">
											<option selected value="10">SUSPENDIDO</option>
										</c:if>
										<c:if test="${elusuario.status!='10'}">
											<option value="10">SUSPENDIDO</option>
										</c:if>
										<c:if test="${elusuario.status=='11'}">
											<option selected value="11">CANCELADO</option>
										</c:if>
										<c:if test="${elusuario.status!='11'}">
											<option value="11">CANCELADO</option>
										</c:if>
								</select></td>
							</tr>
							<tr>
								<td bgcolor="#2584A7"><input type="hidden"
									name="idUsuarioCuenta"
									value="<c:out value='${elusuario.idUsuarioCuenta}'/>">
								</td>
							</tr>
							<tr>
								<td bgcolor="#2584A7" colspan="2"><button
										class="w3-button w3-black w3-round-large" type="submit"><spring:message  code="label.UsrAdmFormModfBtn"/></button></td>

							</tr>
						</table>
					</form:form>
				</div>


			</div>
		</div>
	</div>
	<div id="datosbotonesComp">
		<div id="botonBack">
			<div class="col-sm-6">

				<a
					href="${pageContext.request.contextPath}/usuarioCuenta/obtenerUsersAdm"><img
					src="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
			</div>
		</div>
		<div id="botonHome">
			<div class="col-sm-6">

				<a href="${pageContext.request.contextPath}/principal"><img
					src="${pageContext.request.contextPath}/img/home.png"><spring:message  code="label.NavPrin"/></a>
			</div>
		</div>
	</div>
</body>
</html>