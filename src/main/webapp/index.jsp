<html>
  <head>
  <title> Zebra Siebel into Salesforce case Detail</title>
  <script type="text/javascript"
    src="https://na16.salesforce.com/canvas/sdk/js/37.0/canvas-all.js">
  </script>
  </head>
  <body>

 <script>
	
	var obj; 
	
	function getSignedRequest()
	{
		Sfdc.canvas.client.refreshSignedRequest(function(data)
		{
	             if(data.status == 200){
	             var signedRequest = data.payload.response;
	            var part = signedRequest.split('.')[1];
                     obj = JSON.parse(Sfdc.canvas.decode(part));
                    }
                 });
          
	}
	
	Sfdc.canvas(function(){
    		getSignedRequest();
		handleSFtoSiebel();	
		handleSiebeltoSF();
	});
            
         function handleSFtoSiebel()
         {
         	document.getElementById("case_number_VF").innerHTML  = obj.context.environment.record.CaseNumber;	
         }
          
        function handleSiebeltoSF()
	{
        	caseId = obj.context.environment.record.Id;
         	var caseUri = obj.context.links.sobjectUrl + "Case/"+caseId;
         	var siebelRMANum = document.getElementById("RMA_Siebel_Num");
         	var body = {"siebelRMANum__c":"99999999"};
        	Sfdc.canvas.client.ajax(caseUri,{
        	     client : obj.client,
	             method: "PATCH",
                     contentType: "application/json",
	             data:JSON.stringify(body),
	             success : function() {
		        var a =1;                         
	             } ,
		     error: function() {
		         alert("Error Occured updating Siebel RMA# to SFDC");
		     }
                  });
        }
        
        function getRoot(){
        return obj.client.instanceUrl;
        }

   </script>

 <h1>Zebra Siebel Canvas App</h1>
  
   <label><b>SF Case Number from SF on Siebel Page</b></label>
   <input type="textfield" id="case_number_VF" rows="1" cols="10"></input><br><br><br>
  
   <label><b>Siebel RMA# from Siebel on Siebel Page</b></label>
   <input type="textfield" id="RMA_Siebel_Num" value="99999999" rows="1" cols="10"></input>
  
  </body>
</html>