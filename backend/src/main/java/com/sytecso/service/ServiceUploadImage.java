package com.sytecso.service;

import org.springframework.web.multipart.MultipartFile;

public interface ServiceUploadImage {
	public boolean uploadImage(MultipartFile file);
}
