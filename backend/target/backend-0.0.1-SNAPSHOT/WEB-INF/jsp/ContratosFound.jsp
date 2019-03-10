<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<title>
       		SMARTBILLING - Sytecso System
    	</title>
		<link href="<c:url value="/css/estiloSmartBilling.css" />" 	rel="stylesheet">
	<style>
</style>
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
		<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
		   <script type="text/javascript">
// 		   if(window.location.href.indexOf("?") > -1) {
// 			   // var newUrl = refineUrl();
			  
// 			    var newUrl = ${pageContext.request.contextPath}'/FacturaAjuste';
// 			    window.history.pushState("object or string", "Title", "/"+newUrl );
// 			}

// 			function refineUrl()
// 			{
// 			    //get full url
// 			    var url = window.location.href;
// 			    //get url after/  
// 			    var value = url = url.slice( 0, url.indexOf('?') );
// 			    //get the part after before ?
// 			    value  = value.replace('@System.Web.Configuration.WebConfigurationManager.AppSettings["BaseURL"]','');  
// 			    return value;     
// 			}
// 			function myFunction(x) {
// 			    alert("Row index is: " + x.rowIndex);
// 			}
			
			
//  			function objeto() { 
			
//  				  var deudaCont = (document.getElementById("deudaCont").value);
//  				  var ajustar=document.getElementById("ajustar").value;
// 				  if(ajustar==0)
// 						 window.alert("El monto es 0"); 
				  
// 				  if(ajustar>=deudaCont)
// 					 window.alert("El monto a ajustar es mayor que la deuda del Contrato"); 
// 				  if(ajustar<0)
// 						 window.alert("El monto es incorrecto"); 
// 				}
			
			
		    function trInputVal(index,table, inputclass){
		    	var inputVal =0;
	        	var ind=index+1;
	        	var tab=$(table).find("tr").filter(function(i,v){
	        		if(i==ind){
	        			inputVal = $(v).find("input[class="+inputclass+"]").val();
	        			return false;
	        		}
	        			
	        	});
	        	return inputVal;
		    }
	
	        function updateAjuste(index,table){
	        	var url=UrlUtils.urlRealizaAjuste();
	        	var monto = trInputVal(index,table,'monto');
	        	var idContratosFactura = trInputVal(index,table,'idContratosFactura');
	        	var idFactura = trInputVal(index,table, 'idFactura');
	        	var ajustado = trInputVal(index,table,'ajustado');
	        	var totalCont=trInputVal(index,table,'totalCont');
	        	var tipoAjuste=trInputVal(index,table,'tipoAjuste');
	        	var numFactura=trInputVal(index,table,'numFactura');
	        	var leyendaContrato= trInputVal(index,table,'leyendaContrato');
	        	var aliasCliente=trInputVal(index,table,'aliasCliente');
	        	var contrato=trInputVal(index,table,'contrato');
	        	var deudaItem=trInputVal(index,table,'deudaItem');
	        	var idUnidadFacturacion=trInputVal(index,table,'idUnidadFacturacion');
	        	var idCuenta=trInputVal(index,table,'idCuenta');
	        	var deudaCont=trInputVal(index,table,'deudaCont');
	        	
// 	        	if(ajustar>=deudaCont)
// 					 window.alert("El monto a ajustar es mayor que la deuda del Contrato"); 
	        	if(ajustar==0){
	        		window.alert("El monto es incorrecto"); 
	        		return false;
	        	}
					 
	        	
	        	var request = smartBilling.ajaxPost(url,{
	        		monto:monto,index:index,idContratosFactura:idContratosFactura,
	        		idFactura:idFactura, ajustado:ajustado,
	        		totalCont:totalCont, tipoAjuste:tipoAjuste, 
	        		numFactura:numFactura,leyendaContrato:leyendaContrato,
	        		aliasCliente:aliasCliente,contrato:contrato, deudaItem:deudaItem,
	        		idUnidadFacturacion:idUnidadFacturacion,idCuenta:idCuenta, deudaCont:deudaCont });
	        	
	        	request.then(response=>{
	        		window.location=response;
	        	},error=>{
	        		alert(response);
	        		console.log("MAL");
	        	});
	        }		   
		   
			

			
			</script>
			
	</head>
	<body>
			<div style="text-align: right;padding:5px;margin: 0px;background:#ccc;">
			Language : <a href="?lang=es">Español</a> | <a href="?lang=en">English</a> 
    	</div>
		<jsp:include page="menu4.jsp" /> 
		<div id="tituloyBarraBusqueda">
		    <div id="tituloTablero">
		        <img src="${pageContext.request.contextPath}/img/das.png" width="16px" height="16px" style="margin-left:10px;"> <spring:message  code="label.tittleAdj"/>
		    </div>
		</div>
		<div id="tableroSmartBilling">
	    	<div id="ventanaSmartBilling">	
	        	<div class="contenido">
	        	<p > <spring:message  code="label.AdjFactContResult"/> <strong> ${factura} </strong>:</p>
	      	 		<div id="datos">
						<div id="datosForm">
							
							  <form:form  id="formAjustes" action="${pageContext.request.contextPath }/FacturaAjuste" method="POST"   modelAttribute="itemsContratoFactura">
									<table  id="test" style="width: 90%;  class="letra">
										<tr>
											<td class="letrath"  bgcolor="#2584A7" >
												<form:label path="idContrato" type="text" ><b><spring:message  code="label.AdjFactContNoCont"/>  :</b></form:label>
												<abbr title="Campo obligatorio">
												<spring:message  code="label.AdjFactContNoContph" var ="numCont"/>
													<form:input id="idContrato" type="text" path="idContrato"  placeholder="${numCont }" />
													<form:input id="factura.numeroFactura" type="text" path="factura.numeroFactura" style="display:none"  />
												</abbr>
											</td>
											<td class="letrath"  bgcolor="#2584A7" >
												
											</td>
										</tr>
										
										<tr>
											<td class="letra"  bgcolor="#2584A7" >
												&nbsp;
											</td>
											<td class="letra"  bgcolor="#2584A7" >
											<spring:message  code="label.AdjFactContBuscar" var ="btnBuscar"/>  
												<input class="w3-button w3-black w3-round-large" type="submit" value="${btnBuscar }" class="botonSmartBilling" />
											</td>
										</tr>
									</table>
								</form:form>
								</div>
								</div>
								
								<form:form modelAttribute="itemsContratoFactura" method="post" action="ajustar.html" onsubmit="return valida(this)" >
								 <table id="tableAjuste" style="width: 80%" id="test" align="center" class="tablePrincipal">
									<thead  class="theadPrincipal" >
									 <tr class="letrathPrincipal">
												<th ><spring:message  code="label.AdjFactContTbIDCont"/> </th>
												<th  ><spring:message  code="label.AdjFactContTbLeyCont"/></th>
												<th  ><spring:message  code="label.AdjFactContTbAlClien"/></th>
												<th  ><spring:message  code="label.AdjFactContTbMont"/> </th>
												<th  ><spring:message  code="label.AdjFactContTbMontDeuda"/> </th>
												<th ><spring:message  code="label.AdjFactContTbMontAdj"/></th>
												<th  ><spring:message  code="label.AdjFactContTbAjustr"/></th>
												<th  ><spring:message  code="label.AdjFactContTbAct"/></th>
											</tr>
									 </thead>
											<c:forEach items="${itemsContratoFactura.listContratosFactura}" var="itemsValue" varStatus="status">
												<tr class="letraPrincipal">
													<td >
														<input class="contrato" name="listContratosFactura[${status.index}].idContrato"  value="${itemsValue.idContrato}"  style="display:none" />
														<input class="idFactura" name="listContratosFactura[${status.index}].factura_idfactura"  value="${itemsValue.factura_idfactura}" style="display:none" />
														<input class="idContratosFactura"  name="listContratosFactura[${status.index}].idContratosFactura"  value="${itemsValue.idContratosFactura}" style="display:none" />
														<input class="moneda"  name="listContratosFactura[${status.index}].moneda"  value="${itemsValue.moneda}" style="display:none" />
														<input class="tipoAjuste"  value="CONTRATO" name="listContratosFactura[${status.index}].ajuste.tipoAjuste" style="display:none" />
														<input class ="numFactura" name="listContratosFactura[${status.index}].factura.numeroFactura"  value="${itemsValue.factura.numeroFactura}" style="display:none" />
														<input  class="deudaItem"  name="listContratosFactura[${status.index}].item.deudaItem"  value="${itemsValue.item.deudaItem}" style="display:none" />
														<input  class="idUnidadFacturacion"  name="listContratosFactura[${status.index}].cuenta.unidadFacturacion.idunidadFacturacion"  value="${itemsValue.cuenta.unidadFacturacion.idunidadFacturacion}"  style="display:none"   />
														<input  class="idCuenta"  name="listContratosFactura[${status.index}].cuenta.idCuenta"  value="${itemsValue.cuenta.idCuenta}"  style="display:none"   />
														<u><b><a href="${pageContext.request.contextPath}/FacturaAjusteContrato?factura=${factura}&contrato=${itemsValue.idContrato}" /></b></u>
														<b>${itemsValue.idContrato}</b>
													
													<td>
														<input class="leyendaContrato" name="listContratosFactura[${status.index}].leyendaContrato" value="${itemsValue.leyendaContrato}" style="display:none"  />
														<label>${itemsValue.leyendaContrato}</label>
													</td>
													<td>
														<input class="aliasCliente" name="listContratosFactura[${status.index}].cuenta.aliasCliente" value="${itemsValue.cuenta.aliasCliente}" style="display:none" />  
														<label>${itemsValue.cuenta.aliasCliente}</label>
													</td>
													<td>
														<input class="totalCont" name="listContratosFactura[${status.index}].monto"  value="${itemsValue.monto}" style="display:none" id="monto"/>
														<fmt:setLocale value="en_US"  scope="session"/>
       													<fmt:formatNumber value="${itemsValue.monto}" type="currency" maxFractionDigits="3" pattern="$#,##0.0###"/>							
													</td>
													<td>
														<input class="deudaCont"  name="listContratosFactura[${status.index}].deudaContrato"  value="${itemsValue.deudaContrato}" style="display:none" id="deudaCont"/>
														<fmt:setLocale value="en_US"  scope="session"/>
       													<fmt:formatNumber value="${itemsValue.deudaContrato}" type="currency" maxFractionDigits="3" pattern="$#,##0.0###"/>							
													</td>
													<td>
														<input class="ajustado" name="listContratosFactura[${status.index}].ajustado"  value="${itemsValue.ajustado}" id="ajustado" style="display:none" />
														<fmt:setLocale value="en_US"  scope="session"/>
       													<fmt:formatNumber value="${itemsValue.ajustado}" type="currency" maxFractionDigits="3" pattern="$ #,##0.0###"/>							
													</td>							
													<td >
															<input class="monto" name="listContratosFactura[${status.index}].ajuste.montoAjusteNoImpuestos"  value="${itemsValue.ajuste.montoAjusteNoImpuestos}0" id="ajustar" type="text" placeholder="0" />
													</td>
										
													<td><button type="button" name="ssdf" onclick="updateAjuste(${status.index},'#tableAjuste')"><spring:message  code="label.AdjFactContTbBtnAdj"/></button></td>
													
												</tr>
											</c:forEach>
									<td bgcolor="#ffffff" ></td>
									<td bgcolor="#ffffff"> 
									<spring:message  code="label.AdjFactContTbBtnAdj" var ="btnAdj"/>
	              						<input type="submit" class="w3-button w3-black w3-round-large"  value="${btnAdj }"  onclick="objeto()"/>										
									</td>
									<td bgcolor="#ffffff"></td>
									<td bgcolor="#ffffff"></td>
              				</table>
	
					        	</form:form>
						</div>
					</div>
				</div>
			
	
		<div id="datosbotonesComp">
			<div id="botonBack">
					<div class="col-sm-6">
						
						<a href="${pageContext.request.contextPath}/buscarDatosAjuste"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
					</div>
				</div>
		<div id="botonHome">
				<div class="col-sm-6">
					
					<a href="${pageContext.request.contextPath}/principal"><img src ="${pageContext.request.contextPath}/img/home.png"><spring:message  code="label.NavPrin"/></a>
				</div>
			</div>
		</div>
	</body>
</html>
