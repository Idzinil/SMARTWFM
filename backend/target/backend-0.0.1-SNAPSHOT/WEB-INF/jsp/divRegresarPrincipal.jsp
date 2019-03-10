<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="datosbotonesComp">
	<div id="botonBack">
		<div class="col-sm-6">
			<a href="${pageContext.request.contextPath.concat(pathRegresar)}"><img
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