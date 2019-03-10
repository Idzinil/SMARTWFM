<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<c:url value = "/css/estiloSmartBilling.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value = "/css/secciones.css"/>">
<script src="js/jquery-1.12.4.js"></script>
<script src="js/jquery-ui-1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="js/jquery-ui-1.12.1/jquery-ui.css">
<script src="js/SmartBilling/smartBilling.js"></script>
<script src="js/facturacion/invocing.js"></script>
<title>SmartBilling - RedIt</title>
</head>
<body>
	<jsp:include page="menu3.jsp" />
	<div id="tituloyBarraBusqueda">
		<div id="tituloTablero">
			<img src="/SmartBilling/img/das.png" width="16px" height="16px"
				style="margin-left: 10px;"> FACTURACIÓN
		</div>
	</div>
	<div id="tableroSmartBilling">
		<div id="ventanaBienvenidaSmartBilling">
			<label></label>
			<form:form id="formBill" action="${pageContext.request.contextPath}/obtenDataPeriodoFactura"
				method="POST">
				<div id="datos">
					<div id="datosForm">
						<table id="test" style="width: 90%; border-radius: 25px;"
							class="letra">
							<tr>
								<td class="letra" bgcolor="#2584A7">Ciclo:</td>
								<td class="letra" bgcolor="#2584A7" widht="80px"><select id="ciclo" name="ciclo">
										<option name="ciclo" value="0" selected="selected">-Seleccione-</option>
										<option value="1">1</option>
										<option value="11">21</option>
								</select></td>
								<td class="letra" bgcolor="#2584A7"><pre>MES:</pre></td>
								<td class="letra" bgcolor="#2584A7" widht="80px"><select name="mes">
										<option value="0" selected="selected">-Seleccione-</option>
										<c:if test="${fn:length(lstMes)>0}">
										  <c:forEach items="${lstMes}" var="listValue">
										    <c:set var="string2" value="${fn:split(listValue,'|')}"/>
                                              <c:if test="${fn:length(string2)>0}">
											    <option value="${string2[0]}">${string2[1]}</option>
											  </c:if>
										  </c:forEach>
										</c:if>
								 </select></td>
								<td class="letra" bgcolor="#2584A7"><pre>A&Ntilde;O:   </pre></td>
								<td class="letra" bgcolor="#2584A7" widht="80px"><select name="anio">
										<option value="0" selected="selected">-Seleccione-</option>
										<c:forEach var="listVal" items="${lstAnio}">
											<option value="${listVal}">${listVal}</option>
										</c:forEach>
								 </select></td>
							</tr>


							<tr class="letra" bgcolor="#2584A7">
								<td class="letra" bgcolor="#2584A7" colspan=3" >&nbsp;</td>
								<td bgcolor="#2584A7"><input type="submit" id="buscar"
									value="Buscar" /></td>
							</tr>
							<tr>
								<td bgcolor="#2584A7" colspan="6" bgcolor="white">
									<div id="errMsg"></div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	<div id="datosbotonesComp">
		<div id="botonBack">
			<div class="col-sm-6">
				<a href="${pageContext.request.contextPath}/billResultado"><img
					src="/SmartBilling/img/regresar.png">Regresar</a>
			</div>
		</div>
		<div id="botonHome">
			<div class="col-sm-6">

				<a href="${pageContext.request.contextPath}/principal"><img
					src="/SmartBilling/img/home.png">Principal</a>
			</div>
		</div>
	</div>
</body>
</html>