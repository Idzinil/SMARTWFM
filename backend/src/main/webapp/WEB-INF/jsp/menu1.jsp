<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<div id="cabeceraSytecso">
<div id="usuarioDivSytecso"><spring:message  code="label.Bienvenido"/> , <strong>${pageContext.request.remoteUser}</strong><a href="<c:url value="/logout" />">     <spring:message  code="label.Salir"/> </a></div>
<br>
	<ul id="css-nav">
		<li><span class="fa fa-home"></span><a href="principal" class="selected"> <spring:message  code="label.MenuInicio"/>   <img src ="${pageContext.request.contextPath}/img/flecha-abajo-icono-8630-16.png" > </a></li>
		<security:authorize access="hasRole('ROLE_USER')">	
			<li><span class="fa fa-users"></span><a  href="${pageContext.request.contextPath}/cuentasFront"> Cuentas Clientes  <img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" ></a></li>
			<li><span class="fas fa-file"></span><a  href="${pageContext.request.contextPath}/tipoOrdenFront">Manejo de Ordenes<img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" ></a></li>
		</security:authorize>
		<security:authorize access="hasRole('ROLE_ADMIN')">	
			<li><span class="fa fa-desktop"></span><a href="${pageContext.request.contextPath}/cuentasFront"><spring:message  code="label.MenuAdmSis"/>  <img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" ></a></li>
			<li><span class="fa fa-car"></span><a href="${pageContext.request.contextPath}/cuadrillasFront">Admin Cuadrillas <img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" ></a></li>
			<li><span class="fa fa-toolbox"></span><a href="${pageContext.request.contextPath}/insumosFront">Admin Insumos <img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" ></a></li>
		</security:authorize>
		<security:authorize access="hasRole('ROLE_BILLING')">
<!-- 			<li><a href="${pageContext.request.contextPath}/verBalance"> Balance   <img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" ></a></li>	 -->
			<li><a href="${pageContext.request.contextPath}/facturacionFront"> <spring:message  code="label.MenuFact"/>   <img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" ></a></li>
			<li><a href="${pageContext.request.contextPath}/verBalance"> <spring:message  code="label.MenuBalanc"/>    <img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" ></a></li>
			<li><a href="${pageContext.request.contextPath}/irAjustes" > <spring:message  code="label.MenuAdj"/>    <img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" ></a></li>
			<li><a href="${pageContext.request.contextPath}/pagos" > <spring:message  code="label.MenuPagos"/>    <img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" ></a></li>
			<li><a href="${pageContext.request.contextPath}/reportes" > <spring:message  code="label.MenuRep"/>   <img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" ></a></li>
		</security:authorize>
		<security:authorize access="hasRole('ROLE_CONFIG')">	
		<li><a href="${pageContext.request.contextPath}/administracionPantallas" >  <spring:message  code="label.MenuAdmPantallas"/> <img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" > </a></li>
		<li><a href="${pageContext.request.contextPath}/divisasFront" >   <spring:message  code="label.MenuAdmDivisas"/><img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" ></a></li>
		<li><a href="${pageContext.request.contextPath}/obtenerImpuestos" >   <spring:message  code="label.MenuAdmImp"/><img src ="${pageContext.request.contextPath}/img/flecha-al-lado-derecho-icono-8630-16.png" ></a></li>		
		</security:authorize>
	</ul>
<!-- 	<div id="iconoSmart"> -->
<%-- 		<img src ="${pageContext.request.contextPath}/img/logoPrincialSytecso.png" class="imagenLogoSytecso" width="200%"> --%>
<!-- 	</div> -->
	
</div>