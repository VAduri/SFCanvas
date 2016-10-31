<html>
  <head>
  <script type="text/javascript"
    src="https://na16.salesforce.com/canvas/sdk/js/37.0/canvas-all.js">
  </script>
  </head>
  <body>
    <h1>Zebra Siebel Signed Request Play ground Example</h1>
      <div>
	 <input id="refresh" type="button" value="Refresh Signed Request" onclick="refreshSR();"/><br/>
	</div>
	
	<textarea id="refresh_sr" value="Signed Request JSON String" rows="20" cols="80"></textarea>
	 
    <script>
	function refreshSR(){
            Sfdc.canvas.client.refreshSignedRequest(function(data){
                if(data.status == 200){
                    var signedRequest = data.payload.response;
                    var part = signedRequest.split('.')[1];
                    var sr = JSON.parse(Sfdc.canvas.decode(part));
                    alert(sr.client.targetOrigin+""+sr.client.instanceId+""+sr.client.instanceId+""+sr.client.instanceUrl+""+sr.client.oauthToken+""+sr.client.oauthToken);
                }
            });
        }

</script>

  </body>
</html>