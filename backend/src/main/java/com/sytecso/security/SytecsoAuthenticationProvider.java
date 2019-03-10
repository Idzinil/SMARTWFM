package com.sytecso.security;


import com.sytecso.beans.UsuarioCuenta;
import com.sytecso.component.SytecsoLogger;
import com.sytecso.service.ServiceUsuarioCuenta;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;



import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


public class SytecsoAuthenticationProvider  implements AuthenticationProvider {
	
	String ROLE_PREFIX = "ROLE_";
	@Autowired
	ServiceUsuarioCuenta serviceUsuarioCuenta;
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username=authentication.getName();
		String password=(String)authentication.getCredentials();
		UsuarioCuenta usuario=null;
		try {
			usuario=serviceUsuarioCuenta.traerUsuarioPorUsername(username);
		} catch (Exception ex) {
			SytecsoLogger.error("Error al buscar usuario.", ex);
			throw new BadCredentialsException("Error al buscar usuario.", ex);
		}
		if (usuario==null || !usuario.getLogin().equalsIgnoreCase(username)) {
			throw new BadCredentialsException("Usuario no encontrado.");
		}
		if (!validaPassword(password,usuario.getPassword())) {
			throw new BadCredentialsException("Password incorrecto.");
		}
		SytecsoLogger.info("Login correcto");
		Collection<? extends GrantedAuthority> authorities=getAuthorities(usuario);
		return new UsernamePasswordAuthenticationToken(usuario.getLogin(),usuario.getPassword(),authorities);
	}
	public boolean supports(Class<?> aClass) {
		return true;
	}
	private boolean validaPassword(String password, String userPassword) {
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.update(password.getBytes("UTF-8"), 0, password.length());
			String hashedPass = new BigInteger(1, messageDigest.digest()).toString(16);
			if (hashedPass.length() < 32) {
				hashedPass = "0" + hashedPass;
			}
			return userPassword.equals(hashedPass);
		} catch (Exception ex) {
			SytecsoLogger.error("Error.", ex);
			return false;
		}
	}
	private Collection<? extends GrantedAuthority> getAuthorities(UsuarioCuenta usuarioCuenta) {
		List<SimpleGrantedAuthority> authorities=new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(ROLE_PREFIX + usuarioCuenta.getNivelCuenta()));
		return authorities;
	}

}
