<html>
  <head>
  <script type="text/javascript"
    src="https://na16.salesforce.com/canvas/sdk/js/37.0/canvas-all.js">
  </script>
  </head>
  <body>

 <script>
	function refreshSR(){
            Sfdc.canvas.client.refreshSignedRequest(function(data){
                if(data.status == 200){
                    var signedRequest = data.payload.response;
                    var part = signedRequest.split('.')[1];
                    var obj = JSON.parse(Sfdc.canvas.decode(part));
    		document.getElementById("refresh_sr").innerHTML="INSTANCE ID:"+obj.client.instanceId +
							"INSTANCE URL:"+ obj.client.instanceUrl +
							"OAUTH TOKEN:"+ obj.client.oauthToken + 
							"REFRESH TOKEN:"+obj.client.refreshToken +
							"TARGET ORIGIN:"+obj.client.targetOrigin;                
        	return obj;        
	}
            });
        }
	
	var sr = refreshSR();

   </script>

 <h1>Zebra Siebel Signed Request Play ground Example</h1>
      <div>
	 <input id="refresh" type="button" value="Refresh Signed Request" onclick="refreshSR();"/>
	</div>
	<textarea id="refresh_sr" value="Signed Request JSON String" rows="10" cols="80"></textarea>
  </body>
</html>