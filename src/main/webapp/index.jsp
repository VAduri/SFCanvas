<html>
  <head>
  <script type="text/javascript"
    src="https://na16.salesforce.com/canvas/sdk/js/37.0/canvas-all.js">
  </script>
  </head>
  <body>
    <h1>Zebra Siebel Signed Request Play ground Example</h1>
      <div>refresh_SR</div>
	<textarea id="refresh_sr" rows="20" cols="80"></textarea>
	 <input id="refresh" type="button" value="Refresh Signed Request" onclick="refreshSR();"/>

    <script>
	function refreshSR(){
            Sfdc.canvas.client.refreshSignedRequest(function(data){
                if(data.status == 200){
                    var signedRequest = data.payload.response;
                    var part = signedRequest.split('.')[1];
                    var obj = JSON.parse(Sfdc.canvas.decode(part));
                    alert(obj.context.organization.name);
                }
            });
        }

</script>

  </body>
</html>