class Login{

	set stringLogin(login){
		this._login=login+UrlUtils.loginURL();
	}
	get stringLogin(){
		return this._login;
	}
	set stringLoginLogout(loginLogout){
		this._loginLogout=loginLogout+UrlUtils.loginURL()+UrlUtils.logoutURL();
	}
	get stringLoginLogout(){
		return this._loginLogout;
	} 
	
	set stringLoginError(loginError){
		this._loginError=loginError+UrlUtils.loginURL()+UrlUtils.errorURL();
	}
	get stringLoginError(){
		return this._loginError;
	}

	set actURL(actURL){
		this._actURL=actURL;
	}
	
	get actURL(){
		return this._actURL;
	}
	newURL(actURL,context){
		var index=actURL.search(context);
		return actURL.substr(index);
	}

	updateURL(login,loginLogout,loginError,actURL){
		if(!(actURL===loginLogout) && actURL!=login && !(actURL===loginError)){
			   window.history.replaceState(null, null, login);
		}
	}
}

let  login = new Login();


var urlControl = function(URL,context){
	if(login!=null && login!=undefined){
		localStorage.setItem("contextPath",context);
		login.stringLogin=context;
		login.stringLoginLogout=context;
		login.stringLoginError=context;
		login.actURL=login.newURL(URL,context);
		
		var sLogin = login.stringLogin;
		var sLogout =login.stringLoginLogout;
		var sError = login.stringLoginError 
		var sNewURL =login.actURL; 
		
		login.updateURL(sLogin,sLogout,sError,sNewURL);
	}	
}

