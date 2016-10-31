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
        	return obj;        
	}
            });
        
        }Sfdc.canvas());
	
	

   </script>

 <h1>Zebra Siebel Signed Request Play ground Example</h1>
	<textarea id="refresh_sr" value="Signed Request JSON String" rows="15" cols="80"></textarea>
  </body>
</html>