<html>
  <head>
  <title> Zebra Siebel into Salesforce case Detail</title>
  <script type="text/javascript"
    src="https://na16.salesforce.com/canvas/sdk/js/37.0/canvas-all.js">
  </script>
  <script type="text/javascript"
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js">
  </script>
  </head>
  <body>
 <script>
	var sr="";
  	function srObj() {
  		Sfdc.canvas.client.refreshSignedRequest(function(data)
  		{
  			if(data.status == 200){
  			var signedRequest = data.payload.response;
  		       	var part = signedRequest.split('.')[1];
  		       	sr = JSON.parse(Sfdc.canvas.decode(part));
 			document.getElementById("case_number_VF").innerHTML  = sr.context.environment.record.CaseNumber;
 			}	
		}
		);
	}
	
	Sfdc.canvas.onReady(function(){srObj();});
	
	Sfdc.canvas(function(){
	    		$('#CopyRMAToSF').click(handleSiebeltoSF);
	});
   
   	$("#case_number_VF").val(sr.context.environment.record.CaseNumber);
          
        function handleSiebeltoSF(){
        	
        	caseId = sr.context.environment.record.Id;
		var caseUri = sr.context.links.sobjectUrl + "Case/"+caseId;
		var siebelRMANum = document.getElementById("RMA_Siebel_Num").innerHTML;
		var body = {"siebelRMANum__c":siebelRMANum};
		Sfdc.canvas.client.ajax(caseUri,{
		        	     	client : sr.client,
			             	method: "PATCH",
		                     	contentType: "application/json",
			             	data:JSON.stringify(body),
			             	success : function() {
				     	   window.top.location.href=getRoot()+"/"+caseId;                         
			             	} ,
				     	error: function() {
				     	    alert("Error Occured updating Siebel RMA# to SFDC");
				     	}
                  			});
        }
        
        function getRoot(){
        	return sr.client.instanceUrl;
        }

   </script>

 <h1>Zebra Siebel Canvas App</h1>
  
   <label><b>SF Case Number from SF on Siebel Page</b></label>
   <textarea id="case_number_VF" rows="1" value="test" cols="10"></textarea><br><br><br>
   <button id="CopyRMAToSF"> TO SF</button><br>
   <label><b>Siebel RMA# from Siebel on Siebel Page</b></label>
   <textarea id="RMA_Siebel_Num" value="87878778" rows="1" cols="10">1111111</textarea>
  
  </body>
</html>