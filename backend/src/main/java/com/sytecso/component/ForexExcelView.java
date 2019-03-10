package com.sytecso.component;




import java.io.InputStream;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.util.IOUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsView;


@Component("forexView")
public class ForexExcelView extends AbstractXlsView {

  @Override
  protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
     // List<DetalleFactura> listDetalleFactura = (List<DetalleFactura>) model.get("listDetallFact");
     
      Sheet sheet = workbook.createSheet("Detalle de la Factura ");
      
      sheet.setColumnWidth(0, 2000);
      sheet.setColumnWidth(1, 3700);
      sheet.setColumnWidth(2, 4000);
      sheet.setColumnWidth(3, 3200);
      sheet.setColumnWidth(4, 3200);
      sheet.setColumnWidth(5, 3200);
      sheet.setColumnWidth(6, 3200);
      sheet.setColumnWidth(7, 3200);
      
      sheet.addMergedRegion(new CellRangeAddress(4,4,1,2));
      ;
            
      sheet.setFitToPage(true);
      
      
      
		
      InputStream inputStream = request.getServletContext().getResourceAsStream("/WEB-INF/img/logo.JPG");
      //Get the contents of an InputStream as a byte[].
      byte[] bytes = IOUtils.toByteArray(inputStream);
      //Adds a picture to the workbook
      int pictureIdx = workbook.addPicture(bytes, Workbook.PICTURE_TYPE_PNG);
      //close the input stream
      inputStream.close();

      //Returns an object that handles instantiating concrete classes
      CreationHelper helper = workbook.getCreationHelper();

      //Creates the top-level drawing patriarch.
      Drawing drawing = sheet.createDrawingPatriarch();

      //Create an anchor that is attached to the worksheet
      ClientAnchor anchor = helper.createClientAnchor();
      //set top-left corner for the image
      anchor.setCol1(1);
      anchor.setRow1(4);

      //Creates a picture
      Picture pict = drawing.createPicture(anchor, pictureIdx);
      //Reset the image to the original size
      pict.resize( 1,  1);

     
      
      CellStyle style = workbook.createCellStyle();
      CellStyle styleFont = workbook.createCellStyle();
      Font cellFont = workbook.createFont();
      Font cellFontN = workbook.createFont();
      styleFont.setWrapText(true);
      styleFont.setAlignment(CellStyle.ALIGN_LEFT);
      
      cellFont.setFontName("Calibri");
      cellFont.setFontHeightInPoints((short) 10);
      
      cellFontN.setFontName("Calibri");
      cellFontN.setFontHeightInPoints((short) 11);
      cellFontN.setBoldweight(Font.BOLDWEIGHT_BOLD);
      
      style.setFont(cellFont);
      styleFont.setFont(cellFontN);
      
     // DecimalFormat df = new DecimalFormat("###,###,###,###,###.00");
     
      
      
      Row fila = sheet.createRow(4);
      String[] linea1DetalleFact = {"", "", "", "" ,"" ,"" ,"Detalle de la\r\n"+"Factura No."};
		for(int i = 0; i < linea1DetalleFact.length; i++) {
		Cell celda = fila.createCell(i);
		celda.setCellValue(linea1DetalleFact[i]);
		celda.setCellStyle(styleFont); 
		}
		
		fila = sheet.createRow(5);
		String[] lineaDatoDetalleFact = {"", "", "", "" ,"" ,"" ,/*listDetalleFactura.get(0).getFactura().getNumeroFactura()*/};
			for(int i = 0; i < lineaDatoDetalleFact.length; i++) {
			Cell celda = fila.createCell(i);
			celda.setCellValue(lineaDatoDetalleFact[i]);
			celda.setCellStyle(style); 
			}

		fila = sheet.createRow(7);
		String[] linea2PeriodoFact = {"", "Fecha de Factura", "", "Per\u00edodo de Facturaci\u00f3n" ,"" ,"" ,"Cliente"};
			for(int i = 0; i < linea2PeriodoFact.length; i++) {
			Cell celda = fila.createCell(i);
			celda.setCellValue(linea2PeriodoFact[i]);
			celda.setCellStyle(styleFont); 
			}
			
		fila = sheet.createRow(8);
		String[] lineaDatoPeriodFact = {"",/* listDetalleFactura.get(0).getFechaCreacion()*/"", "", /*listDetalleFactura.get(0).getPeriodo()*/"" ,"" ,"" ,/*listDetalleFactura.get(0).getCuenta().getNumCuenta()*/""};
			for(int i = 0; i < lineaDatoPeriodFact.length; i++) {
			Cell celda = fila.createCell(i);
			celda.setCellValue(lineaDatoPeriodFact[i]);
			celda.setCellStyle(style); 
			}

		fila = sheet.createRow(11);
		String[] linea3Encabezado = {"Cant.", "No. De orden", "Identificador del cliente", "Tipo de circuito" ,"Per\u00edodo" ,"Precio unitario" ,"Descuento","Total"};
        for(int i = 0; i < linea3Encabezado.length; i++) {
            Cell celda = fila.createCell(i);
            celda.setCellValue( linea3Encabezado[i] );
            celda.setCellStyle(styleFont); 
           
        }
     
        
       
//      int rowCount = 12;
//      int cont =0;
//      for (DetalleFactura detalleFact : listDetalleFactura) {
//          Row detalleRow = sheet.createRow(rowCount++);
//          cont++;
//          detalleRow.createCell(0).setCellValue(1);
//          detalleRow.createCell(1).setCellValue(detalleFact.getCompra().getOrderId());
//          detalleRow.createCell(2).setCellValue(detalleFact.getCompra().getIdClienteEnlace());
//          detalleRow.createCell(3).setCellValue(detalleFact.getCompra().getTipoCircuito());
//          detalleRow.createCell(4).setCellValue(detalleFact.getPeriodo());
//          detalleRow.createCell(5).setCellValue(df.format(detalleFact.getSubtotal()));
//          detalleRow.createCell(6).setCellValue(df.format(detalleFact.getDescuento()));
//          detalleRow.createCell(7).setCellValue(df.format(detalleFact.getTotal()));
//          detalleRow.setRowStyle( style);
//      }
//      
//      int position = 12+listDetalleFactura.size();
//      fila = sheet.createRow(position);
//      int cant = 0;
//      BigDecimal preciouni =  new BigDecimal(0) ;
//      BigDecimal desc = new BigDecimal(0);
//      BigDecimal total= new BigDecimal(0);
//      
//      for (int i = 0; i<listDetalleFactura.size(); i++){ 
//			
//    	  cant=listDetalleFactura.get(i).getCantidad()+cant;
//    	  preciouni = listDetalleFactura.get(i).getSubtotal().add(preciouni);
//    	  desc = listDetalleFactura.get(i).getDescuento().add(desc);
//    	  total = listDetalleFactura.get(i).getTotal().add(total);
//		    } 
//      
//		String[] lineatotal= {String.valueOf(listDetalleFactura.size()), String.valueOf(listDetalleFactura.size()), "", "" ,"" ,String.valueOf("$ "+df.format(preciouni)) ,String.valueOf("$ "+df.format(desc)),String.valueOf("$ "+df.format(total))};
//      for(int i = 0; i < lineatotal.length; i++) {
//          Cell celda = fila.createCell(i);
//          celda.setCellValue( lineatotal[i] );
//          celda.setCellStyle(styleFont); 
//         
//      }
////      fila = sheet.createRow(position+2);
////      String[] lineatotalf= {String.valueOf(cant), String.valueOf(cant), "", "" ,"" ,String.valueOf("$ "+df.format(preciouni)) ,String.valueOf("$ "+df.format(desc)),String.valueOf("$ "+df.format(total))};
////      for(int i = 0; i < lineatotalf.length; i++) {
////          Cell celda = fila.createCell(i);
////          celda.setCellValue( lineatotalf[i] );
////          celda.setCellStyle(styleFont); 
////         
////      }

      
      response.setHeader("Content-Disposition", "attachment; filename=Detalle-Fact_.xls");
  }
}