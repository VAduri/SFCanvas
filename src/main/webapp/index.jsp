<html>
  <head>
  <title> Zebra Siebel into Salesforce case Detail</title>
  <script type="text/javascript"
    src="https://na16.salesforce.com/canvas/sdk/js/37.0/canvas-all.js">
  </script>
  </head>
  <body>

 <script>
	
	var sr;
	
	function getSignedRequest()
	{
		
		Sfdc.canvas.client.refreshSignedRequest(function(data)
		{
	             if(data.status == 200){
	             var signedRequest = data.payload.response;
	            var part = signedRequest.split('.')[1];
                    sr = JSON.parse(Sfdc.canvas.decode(part));
                    }
                 });
          return sr;
	}
	
	Sfdc.canvas(function(){
    		
    		sr = getSignedRequest();
    		handleSFtoSiebel(sr);	
		handleSiebeltoSF(sr);
	});
            
         function handleSFtoSiebel(sr)
         {
         	
         	document.getElementById("case_number_VF").innerHTML  = sr.context.environment.record.caseNumber;	
         }
          
        function handleSiebeltoSF(sr)
	{
        	var sr = getSignedRequest();
        	caseId = sr.context.environment.record.Id;
         	var caseUri = sr.context.links.sobjectUrl + "Case/"+"'"+caseId+"'";
         	var siebelRMANum = JSON.stringify(document.getElementById("RMA_Siebel_Num"));
         	var body = {"siebelRMANum__c":siebelRMANum};
        	Sfdc.canvas.client.ajax(caseUri,{
        	     client : sr.client,
	             method: "PATCH",
                     contentType: "application/json",
	             data:JSON.stringify(body),
	             success : function() {
		        window.top.location.href=getRoot()+"/"+"'"+caseId+"'";                         
	             } ,
		     error: function() {
		         alert("Error Occured updating Siebel RMA# to SFDC");
		     }
                  });
        }
        
        function getRoot(sr){
        return sr.client.instanceUrl;
        }

   </script>

 <h1>Zebra Siebel Canvas App</h1>
  
   <label><b>SF Case Number from SF on Siebel Page</b></label>
   <input type="textfield" id="case_number_VF" rows="1" cols="10"></input><br><br><br>
  
   <label><b>Siebel RMA# from Siebel on Siebel Page</b></label>
   <input type="textfield" id="RMA_Siebel_Num" value="99999999" rows="1" cols="10"></input>
  
  </body>
</html>