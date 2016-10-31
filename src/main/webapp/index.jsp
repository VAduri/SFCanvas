<html>
  <head>
  <script type="text/javascript"
    src="https://na16.salesforce.com/canvas/sdk/js/37.0/canvas-all.js">
  </script>
  </head>
  <body>

 <script>
	function refreshSR1(){
            Sfdc.canvas.client.refreshSignedRequest(function(data){
                if(data.status == 200){
                    var signedRequest = data.payload.response;
                    var part = signedRequest.split('.')[1];
                    var obj1 = JSON.parse(Sfdc.canvas.decode(part));
    		document.getElementById("refresh_sr").innerHTML="INSTANCE ID:"+obj1.client.instanceId +
							"INSTANCE URL:"+ obj1.client.instanceUrl +
							"OAUTH TOKEN:"+ obj1.client.oauthToken + 
							"REFRESH TOKEN:"+obj1.client.refreshToken +
							"TARGET ORIGIN:"+obj1.client.targetOrigin+
							"APPLICATION NAME:"+obj1.context.application.name+
							"DEVELOPER NAME:"+obj1.context.application.developerName+
							"NAME SPACE:"+obj1.context.application.namespace;                
        	return obj1;        
	}
            });
        }
	
	function refreshSR2(){
            Sfdc.canvas.client.refreshSignedRequest(function(data){
                if(data.status == 200){
                    var signedRequest = data.payload.response;
                    var part = signedRequest.split('.')[1];
                    var obj2 = JSON.parse(Sfdc.canvas.decode(part));
    		document.getElementById("refresh_sr").innerHTML="INSTANCE ID:"+obj2.client.instanceId +
							"INSTANCE URL:"+ obj2.client.instanceUrl +
							"OAUTH TOKEN:"+ obj2.client.oauthToken + 
							"REFRESH TOKEN:"+obj2.client.refreshToken +
							"TARGET ORIGIN:"+obj2.client.targetOrigin+
							"APPLICATION NAME:"+obj2.context.application.name+
							"DEVELOPER NAME:"+obj2.context.application.developerName+
							"NAME SPACE:"+obj2.context.application.namespace;                
        	        
	}
            });
        }
	var sr = refreshSR1();

   </script>

 <h1>Zebra Siebel Signed Request Play ground Example</h1>
      <div>
	 <input id="refresh" type="button" value="Refresh Signed Request" onclick="refreshSR2();"/>
	</div>
	<textarea id="refresh_sr" value="Signed Request JSON String" rows="10" cols="80"></textarea>
  </body>
</html>