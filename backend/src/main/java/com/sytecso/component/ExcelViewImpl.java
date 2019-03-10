package com.sytecso.component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.supercsv.io.ICsvBeanWriter;



public class ExcelViewImpl extends AbstractCsvView{

	@SuppressWarnings("unchecked")
	@Override
	protected void buildCsvDocument(ICsvBeanWriter csvWriter,Map<String, Object> model) throws IOException {

		List<ExcelDTO> reportes  =(ArrayList<ExcelDTO>) model.get("csvData");
		String[] header = (String[]) model.get("csvHeader");
		csvWriter.writeHeader(header);
			for (ExcelDTO aBook : reportes) {
				csvWriter.write(aBook, header);
			}
	}

}
