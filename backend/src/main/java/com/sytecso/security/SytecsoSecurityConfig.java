package com.sytecso.security;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import com.sytecso.security.profile.Profile;
@EnableWebSecurity
public class SytecsoSecurityConfig extends WebSecurityConfigurerAdapter {
	
	private @Autowired @Qualifier("admin") Profile admin;
	private @Autowired @Qualifier("facturacion") Profile facturacion;
	private @Autowired @Qualifier("user") Profile user;
	private @Autowired @Qualifier("config") Profile config;
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
		auth.inMemoryAuthentication().withUser(admin.getUserName()).password(admin.getPassword()).roles(admin.getRole());
		auth.inMemoryAuthentication().withUser(facturacion.getUserName()).password(facturacion.getPassword()).roles(facturacion.getRole());
		auth.inMemoryAuthentication().withUser(user.getUserName()).password(user.getPassword()).roles(user.getRole());
		auth.inMemoryAuthentication().withUser(config.getUserName()).password(config.getPassword()).roles(config.getRole());
		auth.authenticationProvider(sytecsoAuthenticationProvider());
	}
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		final String access ="hasRole("+admin.getRole()+") or hasRole("+facturacion.getRole()+")";
		http.authorizeRequests()
		.antMatchers("runtime.js").permitAll()
		.antMatchers("polyfills.js").permitAll()
		.antMatchers("styles.js").permitAll()
		.antMatchers("vendor.js").permitAll()
		.antMatchers("main.js").permitAll()
		.antMatchers("/login", "/services/**").permitAll()
		.antMatchers("/ws/**").permitAll()
		.antMatchers("/angular/**").permitAll()
		.antMatchers("/ordenes/**").permitAll()
		.antMatchers("/resources/**")
				.access(access).antMatchers(SytecsoSecurityUtils.ACCESS_ADMIN).hasRole(admin.getRole())
				.antMatchers(SytecsoSecurityUtils.ACCESS_BILLING).hasRole(facturacion.getRole())
				.antMatchers(SytecsoSecurityUtils.ACCESS_CONFIG).hasRole(config.getRole())
				.antMatchers(SytecsoSecurityUtils.ACCESS_USER).hasRole(user.getRole()).anyRequest().fullyAuthenticated().and().formLogin()
				.loginPage("/login").successHandler(new RefererRedirectionAuthenticationSuccessHandler()).defaultSuccessUrl("/principal",true).failureUrl("/login?error")
				.usernameParameter("username").passwordParameter("password").and()
				.exceptionHandling().authenticationEntryPoint(new AjaxAwareAuthenticationEntryPoint("/login"))
				.accessDeniedPage("/accesodenegado").and().logout().logoutSuccessUrl("/login?logout")
				.deleteCookies("JSESSIONID").invalidateHttpSession(true).and().csrf().disable().headers().defaultsDisabled().cacheControl();
		http.headers().defaultsDisabled().cacheControl().and();
	}
	public void configure(WebSecurity web) throws Exception {
		web
		.ignoring().antMatchers("/img/**")
			.and()
				.ignoring().antMatchers("/css/**")
			.and()
				.ignoring().antMatchers("/js/**")
		.and()
		.ignoring().antMatchers("/angular/**");	
	}
	@Bean
	SytecsoAuthenticationProvider sytecsoAuthenticationProvider() {
		return new SytecsoAuthenticationProvider();
	}
	 @Bean
	  CorsConfigurationSource corsConfigurationSource() {
	      CorsConfiguration configuration = new CorsConfiguration();
	      configuration.setAllowedOrigins(Arrays.asList("http://localhost:4200"));
	      configuration.setAllowedMethods(Arrays.asList("GET","POST"));
	      UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
	      source.registerCorsConfiguration("/**", configuration);
	      return source;
	  }
}