package com.sytecso.component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.supercsv.io.ICsvBeanWriter;

import com.sytecso.dto.ReporteFacturacionMRR;



public class CsvViewImpl extends AbstractCsvView {

	@Override
	public void setRequestContextAttribute(String requestContextAttribute) {
		super.setRequestContextAttribute("MALO");
	}
	@Override
	protected void buildCsvDocument(ICsvBeanWriter csvWriter,Map<String, Object> model) throws IOException {
		@SuppressWarnings("unchecked")
		List<ReporteFacturacionMRR> reportes  =(ArrayList<ReporteFacturacionMRR>) model.get("csvData");
		String[] header = (String[]) model.get("csvHeader");
		csvWriter.writeHeader(header);
			for (ReporteFacturacionMRR reporte : reportes) {
				csvWriter.write(reporte, header);
				
			}
	}
	@Override
	public void setFileName(String fileName) {
		super.setFileName("preciclo.csv");
	}
}