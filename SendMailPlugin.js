require(["dojo/_base/declare",
         "dojo/_base/lang",
         "dojo/_base/array",
         "dojo/dom", 
         "dojo/aspect",
         "ecm/model/Request",
         "ecm/model/Desktop",
         "dojo/dom-construct",         
         "dojo/domReady!",
         "sendMailPluginDojo/CustomAction"
         ], 
function(declare, lang, array, dom, aspect, Request, Desktop, domConstruct) {		
	/**
	 * Use this function to add any global JavaScript methods your plug-in requires.
	 */
	
	lang.setObject("sendMailActionLink", function(repository, items, callback, teamspace, resultSet, parameterMap) {
		var docIds = [];
		var templName = [];
		var docNames = [];

		array.forEach(items, function(item, index) {
			docIds.push(item.id.split(',')[2]);
			docNames.push(item.name);
			templName.push("Document");
		});
		
		var serviceParams = {
					desktopName : ecm.model.desktop.name,
					repId : repository.id,
					docIds: docIds,
					templNames: templName,
					serverType : repository.type,
					version: "current",
					docNames: docNames
				};

			return this._downloadFormServiceAPI("SendMailPlugin",
					"SendMailAsLinkService",{
			      requestParams: serviceParams,
			}, this._createDownloadForm());
	});

	lang.setObject("_downloadFormServiceAPI", function(pluginName, pluginServiceName, params, downloadForm) {
		var origParams;
		var inputs = []; // temporary input elements for additional parameters

		if (Request.enableSecureService) {
		    Request.setSecurityToken(params.requestParams);
		}
		if (Request.enableSecureService && Request._security_token) {
		      inputs.push(domConstruct.create("input", {
		                 type: "hidden",
		                 name: "security_token",
		                 value: Request._security_token
		     }, downloadForm));
		}

		if (params.requestParams) {
		   origParams = params.requestParams;

		  // All request parameters are added to the form.
		  for ( var name in params.requestParams) {

		        var value = params.requestParams[name];
		        
		        if (lang.isArray(value)) {
		               for ( var i in value) {
		                      inputs.push(domConstruct.create("input", {
		                                     type: "hidden",
		                                    name: name,
		                                    value: value[i]
		                      }, downloadForm));
		              }
		      } else {
		           inputs.push(domConstruct.create("input", {
		                         type: "hidden",
		                         name: name,
		                         value: value
		            }, downloadForm));
		       }
		  } 
		     params.requestParams = {};
		}

		var pluginParams = {};
		pluginParams["plugin"] = pluginName;
		pluginParams["action"] = pluginServiceName;

		try 
		{
			params.requestUrl = Request.getServiceRequestUrl("plugin", "", pluginParams);
			var request = new Request(params);
	
			if (origParams) {
				request._origParams = origParams;
			}
			request.dojoIOIFrameDownload(downloadForm);
		} finally 
		{
			// clean up temporary input elements
			array.forEach(inputs, domConstruct.destroy);
		}
		return request;
	});
	
	lang.setObject("_createDownloadForm", function(repository, items, callback, teamspace, resultSet, parameterMap) {
		
				var downloadForm = dom.byId("documentDownloadForm");
				if (downloadForm) {
					document.body.removeChild(downloadForm);
				}
				downloadForm = document.createElement("form");
				downloadForm.setAttribute("id","documentDownloadForm");
				downloadForm.setAttribute("method","post");
				downloadForm.setAttribute("accept-charset","UTF-8");
				document.body.appendChild(downloadForm);
				return downloadForm;
	});
});
			