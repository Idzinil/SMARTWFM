<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alta de Servicio</title>
</head>
<body>
<label>Alta de Servicios</label>
<form:form method="POST" action="registarServicio">
	<input type="text" placeholder="Nombre paquete" name="paquete">
	<input type="text" placeholder="Id Cliente" name="tipoimp">
	<input type="text" placeholder="Direccion Servicio" name="paisimp">
	<input type="text" placeholder="Tipo Circuito" name="tipocircuito">
	<input type="text" placeholder="Estatus Servicio" name="estatusServ">
	<input type="submit" value="Registrar">
</form:form>
</body>
</html>