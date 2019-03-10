<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
       <title>
       		SMARTBILLING - Sytecso System
    	</title>
		<link href="<c:url value="/css/estiloSmartBilling.css" />" 	rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<style>  
			table {  
			    margin: auto;  
			   
			   
			   font-family: arial, sans-serif;
			    
			   
			} 
			
				thead { 
				background: linear-gradient(to bottom, #2E2E2E 3%, #151515 84%);
				color: #D8D8D8;
			 }
			 
			 
			 
			.letra {
				font-size: 14px;
				color:white;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
				}
			.letrath {
				font-size: 16px;
				color:white;
				font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande','Lucida Sans', Arial, sans-serif;
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
		        <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> <spring:message  code="label.tittleUsrs"/>
		    </div>
		</div>
		 <div id="tableroSmartBilling">
		<div id="ventanaSmartBilling">
		<label type="text"><p><spring:message  code="label.UsrAdmFormAltaUsr"/></p></label>
		<div id="datos"> 
<div id="datosCuenta"> 
<div id="datosForm">
        <form:form action="creaUsuarioCuenta" method="POST" commandName="comando" id="formUsuarioCuenta" >
            <table width="100%" class="letrath" >
            	<thead >
            		<tr class="letrath" ><td colspan="2"><spring:message  code="label.UsrAdmFormDatosUsr"/> </td></tr>
            	</thead>
	                <tr class="letra">
	                	<td bgcolor="#2584A7"><spring:message  code="label.UsrAdmFormLogin"/>: </td>
	                	<td bgcolor="#2584A7"><input type="text" name="login" ></td></tr>
	                <tr class="letra">
	                	<td bgcolor="#2584A7"><spring:message  code="label.UsrAdmFormPass"/>: </td>
	                	<spring:message  code="label.UsrAdmFormAlert" var="alert"/>
	                	<td bgcolor="#2584A7"><span onClick="alert('${alert}');"><input type="password" name="password" pattern="[A-Za-z0-9_#$!]{8,16}" required /><!--<input type="password" name="password">--></span></td>
	                </tr>
	                <tr class="letra">
	                	<td bgcolor="#2584A7"><spring:message  code="label.UsrAdmFormNivelCta"/>: </td>
	                	<td bgcolor="#2584A7">
	                    <select name="nivelCuenta">
	                     <option value="USER"><spring:message  code="label.UsrAdmFormUsr"/></option>
	                     <option value="BILLING"><spring:message  code="label.UsrAdmFormBl"/></option>
	                     <option value="CONFIG"><spring:message  code="label.UsrAdmFormCfg"/></option>
	                     <option value="ADMIN"><spring:message  code="label.UsrAdmFormAdm"/></option>
	                    </select>
	                	</td>
	                </tr>
	                <tr class="letra">
		                <td bgcolor="#2584A7" colspan="2"><button class="w3-button w3-black w3-round-large" type="submit"><spring:message  code="label.UsrAdmFormButtn"/></button></td>
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
									
									<a href="${pageContext.request.contextPath}/usuarioCuenta/obtenerUsersAdm"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
								</div>
							</div>
								<div id="botonHome">
								<div class="col-sm-6">
									
									<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png"><spring:message  code="label.NavPrin"/></a>
								</div>
							</div>
						</div>
        </div>
        </div>
    </body>
</html>