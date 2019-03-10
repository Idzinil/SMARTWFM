class Compras extends SmartBilling{
	constructor(){
		super();
	}
	
	set urlRequest(urlRequest){
		this._urlRequest=urlRequest;
	}
	get urlRequest(){
		return this._urlRequest;
	}
	set dataRequest(data){
		this._dataRequest=data
	}
	get dataRequest(){
		return this._dataRequest;
	}
	
	set actUrl(actUrl){
		this._actUrl= actUrl;
	}
	get actUrl(){
		return this._actUrl;
	}
	remove_js(src){
		$('script[src="' + src + '"]').remove();
	}
	reload_js(src) {
        $('script[src="' + src + '"]').remove();
        $('<script>').attr('src', src).appendTo('head');
    }
	reload_css(src) {
        $('link[href="' + src + '"]').remove();
        $('<link>').attr({'rel':'stylesheet','href': src}).appendTo('head');
    }
	reloadCurrentPage(domElementProperties,url,data){
				var ajax = compra.ajaxGet(url,data);
				ajax.then(response=>{
					var content = $(response).find(domElementProperties.property);
					$(domElementProperties.idMainElement).empty().html(content);
					compra.reloadJsContent(url);
				},error=>{window.location="login"});
}

	replaceHtmlContentAndSetData(content,data,params,url){
		compra.dataRequest=params;
		compra.urlRequest=url;
		var res = $(data).find(".contenido"); 
		$( content ).empty().replaceWith( res );
	}
	reloadJsContent(url){
		switch(url){
			case "altaCompra":
				compra.reload_js("js/compras/altaCompras.js");
				compra.remove_js("actualizaCompras.js")
				break;
			case "actualizarCompra":
				compra.reload_js("js/compras/actualizaCompras.js");
				compra.remove_js("altaCompras.js")
				break;
				
		}
	}
}

var compra = new Compras();
