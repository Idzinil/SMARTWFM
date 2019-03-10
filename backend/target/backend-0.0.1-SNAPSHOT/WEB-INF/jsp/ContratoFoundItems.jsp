<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib  uri="http://www.springframework.org/tags/form" prefix="form"  %>
<html>
	<head>
		<title>
       		SMARTBILLING - Sytecso System
    	</title>
		<link href="<c:url value="/css/estiloSmartBilling.css" />" 	rel="stylesheet">
		<style>
			input{
  color: black;
  border: 1px solid #00C1DE;
  
}
		</style>
		<script src="<c:url value="/js/jquery-1.12.4.js" />"></script>
		<script src="<c:url value="/js/SmartBilling/smartBilling.js"/>"></script>
		<script src="<c:url value="/js/utils/UrlUtils.js"/>"></script>
		   <script type="text/javascript">
// 		   if(window.location.href.indexOf("?") > -1) {
// 			   // var newUrl = refineUrl();
// 			    var newUrl = ${pageContext.request.contextPath }'/FacturaAjusteItem';
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
// 			function objeto() { 
// 				  var ajustado = document.getElementById("ajustado").value;
// 				  var ajustar=document.getElementById("ajustar").value;
// 				  ajustado = Math.abs(ajustado)
				  
				  
// 				  if(ajustar>=ajustado)
// 					 window.alert("El monto a ajustar es mayor"); 
// 				  if(ajustar<0)
// 						 window.alert("El monto es incorrecto"); 
// 				  if(ajustar==0)
// 						 window.alert("El monto es incorrecto"); 
// 				  if(ajustar==ajustado)
// 					  document.getElementById("ajustar").disabled = true;
				 
// 				}
			
			function deshabilita(){
				 var ajustado = document.getElementById("ajustado").value;
				  var ajustar=document.getElementById("ajustar").value;
				  var monto=document.getElementById("monto").value;
				  ajustado = Math.abs(ajustado)
				  if(ajustar==ajustado)
					  document.getElementById("ajustar").disabled = true;
				  if(ajustado==0)
					  document.getElementById("ajustar").disabled = false;
			}
			
			
			
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
		        	var url='realizaAjusteItem';
		        	var monto = trInputVal(index,table,'monto');
		        	var idItem = trInputVal(index,table, 'idItem');
		        	var idFactura =trInputVal(index,table, 'idFactura');
		        	var idCuenta = trInputVal(index,table, 'idCuenta');
		        	var idUnidadFacturacion = trInputVal(index,table, 'idUnidadFacturacion');
		        	var tipoAjuste = trInputVal(index,table, 'tipoAjuste');
		        	var contrato = trInputVal(index,table, 'contrato');
		        	var leyenda = trInputVal(index,table, 'leyenda');
		        	var numFactura = trInputVal(index,table, 'numFactura');
		        	var aliasCliente = trInputVal(index,table, 'aliasCliente');
		        	var deudaItem = trInputVal(index,table, 'deudaItem');
		       
// 		        	if(monto>=deudaItem)
// 						 window.alert("El monto a ajustar es mayor que la deuda del Item");
		        	 if(monto==0)
						 window.alert("El monto es incorrecto");
		        	
		        	var request = smartBilling.ajaxPost(url,{
		        		index:index,monto:monto,idItem:idItem, idUnidadFacturacion:idUnidadFacturacion,
		        		idCuenta:idCuenta, idFactura:idFactura,  tipoAjuste:tipoAjuste,
		        		contrato:contrato, leyenda:leyenda,
		        		numFactura:numFactura, aliasCliente:aliasCliente});
		        	request.then(response=>{
		        		window.location=response;
		        	},error=>{
		        		console.log("MAL");
		        	});
		        }		   
			   
			    

			
		    
			
			
</script>
			
	</head>
	<body onload="deshabilita()">
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
	      	 		<div class="datos">
						<div class="datosForm">
							 <spring:message  code="label.AdjFactContResult"/><strong> ${factura}</strong> <spring:message  code="label.AdjFactContResult2"/> <strong>${contrato}</strong>
							  <br />
							   <br />
 <table id="tableAjuste" style="width: 80%"  class="tablePrincipal" >
 <thead  class="theadPrincipal" >
			<tr class="letrathPrincipal">
			<th class="letrath" ><spring:message  code="label.AdjFactContNoClient"/></th>
			<th class="letrath" ><spring:message  code="label.AdjFactContTbAlClien"/> </th>
			<th class="letrath" ><spring:message  code="label.AdjFactContTbNomClien"/> </th>
			<th class="letrath" ><spring:message  code="label.AdjFactContTbDescMk"/></th>
			<th class="letrath" ><spring:message  code="label.AdjFactContTbItemSinImp"/></th>
			<th class="letrath" ><spring:message  code="label.AdjFactContTbItemDeuda"/></th>
			<th class="letrath" ><spring:message  code="label.AdjFactContTbMontAdj"/></th>
			<th class="letrath" ><spring:message  code="label.AdjFactContTbItemAdj"/></th>
			<th class="letrath" ><spring:message  code="label.AdjFactContTbCuProd"/></th>
			<th class="letrath" ><spring:message  code="label.AdjFactContTbTipCarg"/></th>
			<th class="letrath" ><spring:message  code="label.AdjFactContTbFechAct"/></th>
			<th class="letrath" ><spring:message  code="label.AdjFactContTbFechPriFact"/></th>
			<th class="letrath" ><spring:message  code="label.AdjFactContTbLey"/></th>
			<th class="letrath" ><spring:message  code="label.AdjFactContTbAdj"/></th>
		</tr>
 </thead>
 <form:form modelAttribute="itemsContratoFactura" method="post" action="ajustarItem.html" >
	<c:forEach items="${itemsContratoFactura.listItemContratosFactura}" var="itemsValue" varStatus="status">
		<tr>
			<td><input name="listItemContratosFactura[${status.index}].cuenta.numCuenta" value="${itemsValue.cuenta.numCuenta}"  style="display:none" />
			<input class="idFactura" name="listItemContratosFactura[${status.index}].factura_idFactura"  value="${itemsValue.factura_idFactura}" style="display:none" />
			<input class="tipoAjuste"  value="ITEM" name="listItemContratosFactura[${status.index}].ajuste.tipoAjuste"  style="display:none" />
			<input  class="idItem"  name="listItemContratosFactura[${status.index}].idItem"  value="${itemsValue.idItem}"  style="display:none" />
			<input class="numFactura" name="listItemContratosFactura[${status.index}].factura_numFactura"  value="${itemsValue.factura_numFactura}" style="display:none" />
			<input class="idUnidadFacturacion" name="listItemContratosFactura[${status.index}].cuenta.unidadFacturacion.idunidadFacturacion"  value="${itemsValue.cuenta.unidadFacturacion.idunidadFacturacion}" style="display:none" />
				<input class="idCuenta" name="listItemContratosFactura[${status.index}].cuenta.idCuenta"  value="${itemsValue.cuenta.idCuenta}" style="display:none" />
			<input class="contrato" name="listItemContratosFactura[${status.index}].compra.idContrato"  value="${itemsValue.compra.idContrato}" style="display:none"  />
						<label>${itemsValue.cuenta.numCuenta}</label></td>
			<td><input name="listItemContratosFactura[${status.index}].cuenta.aliasCliente"  value="${itemsValue.cuenta.aliasCliente}"  style="display:none" />
			<label>${itemsValue.cuenta.aliasCliente}</label>
			<input class="aliasCliente" value="${itemsValue.cuenta.aliasCliente}" style="display:none"  /></td>
			<td><input name="listItemContratosFactura[${status.index}].cuenta.unidadFacturacion.datosFiscales.razonSocial" value="${itemsValue.cuenta.unidadFacturacion.datosFiscales.razonSocial}"  style="display:none" />
			<label>${itemsValue.cuenta.unidadFacturacion.datosFiscales.razonSocial}</label></td>
			<td><input name="listItemContratosFactura[${status.index}].producto.descripcionMarqueting"  value="${itemsValue.producto.descripcionMarqueting}"  style="display:none" />
			<label class="number">${itemsValue.producto.descripcionMarqueting}</label></td>
			<td><input class="totalItem" name="listItemContratosFactura[${status.index}].montoItemNoImpuestos" value="${itemsValue.montoItemNoImpuestos}" id="monto"style="display:none"/>
			<fmt:setLocale value="en_US"  scope="session"/>
			<fmt:formatNumber value="${itemsValue.montoItemNoImpuestos}" type="currency" maxFractionDigits="4" pattern="$#,##0.0###"/>
			</td>
			<td><input  name="listItemContratosFactura[${status.index}].deudaItem" value="${itemsValue.deudaItem}" style="display:none"/>
			<fmt:setLocale value="en_US"  scope="session"/>
			<fmt:formatNumber value="${itemsValue.deudaItem}" type="currency" maxFractionDigits="4" pattern="$#,##0.0###"/>
			</td>
			<td><input class="ajustado" name="listItemContratosFactura[${status.index}].montoAjustadoItem" value="${itemsValue.montoAjustadoItem}" id="ajustado" style="display:none"/>
			<fmt:setLocale value="en_US"  scope="session"/>
			<fmt:formatNumber value="${itemsValue.montoAjustadoItem}" type="currency" maxFractionDigits="4" pattern="$#,##0.0###"/>
			</td>						
			<td><input class="monto" name="listItemContratosFactura[${status.index}].montoAjusteItem" value="0" id="ajustar" onchange="objeto()" /></td>
			<td><input name="listItemContratosFactura[${status.index}].producto.monedaProducto" value="${itemsValue.producto.monedaProducto}" style="display:none"/>
			<label>${itemsValue.producto.monedaProducto}</label></td>
			<td><input name="listItemContratosFactura[${status.index}].producto.tipoCargo" value="${itemsValue.producto.tipoCargo}" style="display:none"/>
			<label>${itemsValue.producto.tipoCargo}</label></td>
			<td><input name="listItemContratosFactura[${status.index}].compra.fechaActivacion" value="${itemsValue.compra.fechaActivacion}" style="display:none"/>
			<label>${itemsValue.compra.fechaActivacion}</label></td>
			<td><input name="listItemContratosFactura[${status.index}].compra.fechaPrimeraFac" value="${itemsValue.compra.fechaPrimeraFac}" style="display:none"/>
			<label>${itemsValue.compra.fechaPrimeraFac}</label></td>
			<td><input name="listItemContratosFactura[${status.index}].leyendaFacturacion" value="${itemsValue.leyendaFacturacion}" style="display:none"/>
			<label>${itemsValue.leyendaFacturacion}</label>
			<input class="leyenda" value="${itemsValue.leyendaFacturacion}" style="display:none"  /></td>
			<td><button type="button" name="ssdf" onclick="updateAjuste(${status.index},'#tableAjuste')"><spring:message  code="label.AdjFactContTbBtnAdj"/></button></td>
			<td><input class="deudaItem" name="listItemContratosFactura[${status.index}].deudaItem" value="${itemsValue.deudaItem}" style="display:none"/>
		</tr>
	</c:forEach>
	<tr>
			<td bgcolor="#ffffff" ></td>
			<td bgcolor="#ffffff"></td>
			<td bgcolor="#ffffff"></td>
			<td bgcolor="#ffffff"></td>
			<td bgcolor="#ffffff">
			<spring:message  code="label.AdjFactContTbBtnAdj" var = "btnAdj"/>
			<input class="w3-button w3-black w3-round-large" type="submit" value="${btnAdj }"  /></td>
			<td bgcolor="#ffffff"></td>
			<td bgcolor="#ffffff"></td>
			<td bgcolor="#ffffff"></td>
			<td bgcolor="#ffffff"></td>
		</tr>
			</form:form>
</table>	
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="datosbotonesComp">
			<div id="botonBack">
					<div class="col-sm-6">
						
						<a href="${pageContext.request.contextPath}/FacturaAjuste?factura=${factura}"><img src ="${pageContext.request.contextPath}/img/regresar.png"><spring:message  code="label.NavRegresar"/></a>
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
