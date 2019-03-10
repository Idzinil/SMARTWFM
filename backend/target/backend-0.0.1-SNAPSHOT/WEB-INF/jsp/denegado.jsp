<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<body>
		<h1 id="banner">ERROR - Sin Autorización de Acceso a esta opción
			!!</h1>
		<hr />
		<c:if test="${not empty error}">
			<div style="color: red">
				El intento de acceso al sistema presento errores, Contacta al
				administrador del sistema e intentalo de nuevo !!<br />
				CAUSA_PRINCIPAL :
				${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
			</div>
		</c:if>
		<p class="message">ACCESO DENEGADO !</p>
		<a href="${pageContext.request.contextPath}/index">Regresar a
			página principal.</a>
	</body>
</html>