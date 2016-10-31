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
                    var sr1 = JSON.parse(Sfdc.canvas.decode(part));
    		document.getElementById("refresh_sr1").innerHTML="INSTANCE ID:"+sr1.client.instanceId + "<br>"+
							"INSTANCE URL:"+ sr1.client.instanceUrl + "<br>" +
							"OAUTH TOKEN:"+ sr1.client.oauthToken + "<br>" +
							"REFRESH TOKEN:"+sr1.client.refreshToken + "<br>" +
						"TARGET ORIGIN:"+sr1.client.targetOrigin;                
        	return sr1;        
	}
            });
        }
	
	var sr2 = refreshSR();

   </script>


 <h1>Zebra Siebel Signed Request Play ground Example</h1>
      <div>
	 <input id="refresh" type="button" value="Refresh Signed Request" onclick="refreshSR();"/>
	</div>
	<textarea id="refresh_sr1" value="Signed Request JSON String" rows="10" cols="80"></textarea>
	 <textarea id="refresh_sr2" value="Signed Request JSON String" rows="10" cols="80"></textarea>
	document.getElementById("refresh_sr2").innerHTML="INSTANCE ID:"+sr2.client.instanceId + "<br>"+
							"INSTANCE URL:"+ sr2.client.instanceUrl + "<br>" +
							"OAUTH TOKEN:"+ sr2.client.oauthToken + "<br>" +
							"REFRESH TOKEN:"+sr2.client.refreshToken + "<br>" +
						"TARGET ORIGIN:"+sr2.client.targetOrigin;                
           
  </body>
</html>