package com.sytecso.security.profile.impl;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import com.sytecso.security.profile.Profile;
@Component
@Qualifier("config")
public class ConfigImpl implements Profile{
	@Value("${profile.config.name}")
	private String userName;
	@Value("${profile.config.password}")
	private String password;
	@Value("${profile.config.role}")
	private String role;
	@Override
	public String getUserName() {
		return userName;
	}
	@Override
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String getPassword() {
		return password;
	}
	@Override
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String getRole() {
		return role;
	}
	@Override
	public void setRole(String role) {
		this.role = role;
	}
}
