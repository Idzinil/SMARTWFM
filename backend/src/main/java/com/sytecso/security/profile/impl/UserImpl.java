package com.sytecso.security.profile.impl;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import com.sytecso.security.profile.Profile;
@Component
@Qualifier("user")
public class UserImpl implements Profile{
	@Value("${profile.user.name}")
	private String userName;
	@Value("${profile.user.password}")
	private String password;
	@Value("${profile.user.role}")
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
