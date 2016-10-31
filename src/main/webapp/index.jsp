<html>
  <head>
  <script type="text/javascript"
    src="https://na16.salesforce.com/canvas/sdk/js/37.0/canvas-all.js">
  </script>
  </head>
  <body>

 <script>
	
	Sfdc.canvas(function(){
	
            Sfdc.canvas.client.refreshSignedRequest(function(data){
                if(data.status == 200){
                    var signedRequest = data.payload.response;
                    var part = signedRequest.split('.')[1];
                    var obj = JSON.parse(Sfdc.canvas.decode(part));
    		document.getElementById("refresh_sr").innerHTML="INSTANCE ID:"+obj.client.instanceId +
							"INSTANCE URL:"+ obj.client.instanceUrl +
							"OAUTH TOKEN:"+ obj.client.oauthToken + 
							"REFRESH TOKEN:"+obj.client.refreshToken +
							"TARGET ORIGIN:"+obj.client.targetOrigin+
							"APPLICATION NAME:"+obj.context.application.name+
							"DEVELOPER NAME:"+obj.context.application.developerName+
							"NAME SPACE:"+obj.context.application.namespace+
							"CASE ID:"+obj.context.environment.record.Id;                
        	        caseNumberHandler(obj);
	}
	
            });
            
             
                }(Sfdc.canvas));
	
	
	function caseNumberHandler(sr)
	{
	  var caseId = JSON.stringify(sr.context.environment.record.Id);
          var url = sr.context.links.queryUrl+"?q=SELECT+CaseNumber+from+Case+where+id+="+caseId;
		       Sfdc.canvas.client.ajax(url,
		                	      {client : sr.client,
		                               method: "GET",
		                               contentType: "application/json",
		                               success : function(data) {
		                                 if (data.status ===200) {
		                                 document.getElementById("case_number").innerHTML  = JSON.stringify(data.payload.records[0].CaseNumber);
		                 	         }
		                               },
		            	               error: function() {
		                         	 alert("I'm sorry we can't populate the menu at this time. Please contact your system administrator if the problem persists.");
		                               }
                                      });
	
	}


   </script>

 <h1>Zebra Siebel Signed Request Play ground Example</h1>
	<textarea id="refresh_sr" value="Signed Request JSON String" rows="15" cols="80"></textarea>
	<textarea id="case_number" value="Case Number" rows="1" cols="10"></textarea>
  </body>
</html>