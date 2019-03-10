<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>
        SMARTBILLING - Sytecso System
    </title>
	<link rel="stylesheet" type="text/css" href="<c:url value = "/css/estiloSmartBilling.css"/>">
</head>

<body>
	<jsp:include page="menu4.jsp" /> 
    <div id="tituloyBarraBusqueda">
        <div id="tituloTablero">
                TABLERO
        </div>
    </div>
    <div id="tableroSmartBilling">
        <div id="ventanaBienvenidaSmartBilling">
            <div class="contenedorTitulo">
                <div class="tituloBienvenida">
                    Bienvenido a SmartBilling
                </div>
                
            </div>
            <div class="contenido">
                <h2>Permítenos ayudarte a configurar SmartBilling para tu negocio</h2>
                <div class="columnasSmartBilling">
                        <div style="float: left; width: 25%;"><span class="title">1. GENERAL</span>
                            <div>
                                    <ul>
                                        <li> Completa los detalles de tu compañia </li>
                                        <li> Completar tus detalles de facturación </li>
                                        <li> Configurar tus notificaciones de cliente </li>
                                    </ul>
                            </div>
                        </div>
                        <div style="float: left; width: 25%;"><span class="title">2. PAGOS </span>
                                <div>
                                    <ul>
                                        <li> Definir y activar tipos de moneda </li>
                                        <li> Configurar puerta de enlace </li>
                                        <li> Instalar forma de pago </li>
                                        <li> Activar canales de venta </li>
                                </ul>
                                </div>
                        </div>
                        <div style="float: left; width: 25%;"><span class="title"> 3. PRODUCTOS </span>
                                <div>
                                    <ul>
                                        <li> Establecer impuestos </li>
                                        <li> Crear productos </li>
                                        <li> configurar uso de las tarifas </li>
                                </ul>
                                </div>
                        </div>
                        <div style="float: left; width: 25%;"><span class="title"> 4. COMENZAAR A VENDER </span>
                                <div>
                                    <ul>
                                        <li> Agregar cuentas </li>
                                        <li> Vender productos </li>
                                </ul>
                                </div>
                        </div>
                    </div>
            </div>
        </div>
    <div>
        <div id="ventanaCuadradaSmartBilling">
                <div class="contenedorTitulo">
                        <div class="tituloCuadro">
                            Ingresos
                        </div>
                        <span class="etiquetaCuadrada">77.00%</span>
                </div>
                <div class="contenidoCuadrado"><br>
                	<img src="img/graficadepie.PNG" width="80%" height="80%"><br></div>
                <span class="verReporte">Ver Reporte</span>
            </div>

        <div id="ventanaCuadradaSmartBilling">
                <div class="contenedorTitulo">
                        <div class="tituloCuadro">
                            Inscripciones
                        </div>
                        <span class="etiquetaCuadrada">77.00%</span>
                </div>
                <div class="contenidoCuadrado"><br>
                	<img src="img/graficadepie.PNG" width="80%" height="80%"><br></div>
                <span class="verReporte">Ver Reporte</span>
            </div>

        <div id="ventanaCuadradaSmartBilling">
                <div class="contenedorTitulo">
                        <div class="tituloCuadro">
                            Tasa de abandono
                        </div>
                        <span class="etiquetaCuadrada">77.00%</span>
                </div>
                <div class="contenidoCuadrado"><br>
                	<img src="img/graficadepie.PNG" width="80%" height="80%"><br>
                </div>
                <span class="verReporte">Ver Reporte</span>
        </div>

        <div id="ventanaCuadradaSmartBilling">
                <div class="contenedorTitulo">
                        <div class="tituloCuadro">
                            ARPU
                        </div>
                        <span class="etiquetaCuadrada">77.00%</span>
                </div>
                <div class="contenidoCuadrado"><br>
                	<img src="img/graficadepie.PNG" width="80%" height="80%"><br></div>
                <span class="verReporte">Ver Reporte</span>
        </div>
    </div>

    </div>

    </body>

</html>