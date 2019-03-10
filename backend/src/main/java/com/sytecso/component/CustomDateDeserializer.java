package com.sytecso.component;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.deser.std.StdDeserializer;
import com.sytecso.exceptions.SytecsoException;

@Component
public class CustomDateDeserializer extends StdDeserializer<Date> {

	private static final long serialVersionUID = 1L;
	private static final String DATE_FORMAT_YYYY_MM_DD_HH_MM_SS= "dd-MM-yyyy hh:mm:ss";
	private SimpleDateFormat formatter = new SimpleDateFormat(DATE_FORMAT_YYYY_MM_DD_HH_MM_SS);
    private static Pattern datePattern = Pattern.compile("((19|20)\\\\d\\\\d)[/|-](0?[1-9]|1[012])[/|-](0?[1-9]|[12][0-9]|3[01]) (0?[1-9]|[1][0-9]|[2][0-2])[:](0?[0-9]|[1-5][0-9])[:](0?[0-9]|[1-5][0-9])");

	public CustomDateDeserializer() {
		this(null);
	}

	public CustomDateDeserializer(Class<?> vc) {
		super(vc);
	}

	@Override
	public Date deserialize(JsonParser jsonparser, DeserializationContext context) throws IOException {
		String date = jsonparser.getText();
		try {
			if(UtileriaFechas.validateDateFormat(date,datePattern,DATE_FORMAT_YYYY_MM_DD_HH_MM_SS))
				return formatter.parse(date);
			else
	            return null;
		} catch (ParseException e) {
			SytecsoException.logClassAndMethodWithException(e);
		}
		return null;
	}
}