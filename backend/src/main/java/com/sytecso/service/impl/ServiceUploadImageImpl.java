package com.sytecso.service.impl;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sytecso.service.ServiceUploadImage;

@Service
public class ServiceUploadImageImpl implements ServiceUploadImage {

	@Override
	public boolean uploadImage(MultipartFile file) {
		String ruta = System.getProperty("java.io.tmpdir");
		String tmpDirStr = ruta.endsWith("/tmp") ? ruta.concat("/") : ruta;
		try {
			File dest = new File(tmpDirStr + "/" + file.getOriginalFilename());
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
