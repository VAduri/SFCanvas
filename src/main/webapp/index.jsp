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
	
  	function srObj() {
  		Sfdc.canvas.client.refreshSignedRequest(function(data)
  		{
  			
  			if(data.status == 200){
  			var signedRequest = data.payload.response;
  		       	var part = signedRequest.split('.')[1];
  		       	alert(signedRequest);
  		       	alert(part);
  		       	var check = JSON.parse(Sfdc.canvas.decode(part));
  		       	console.log(check);
  		       	alert("context" + check.context);
  		        return JSON.parse(Sfdc.canvas.decode(part));
  		        
 			}	
		}
		);
	}
	
	Sfdc.canvas(function(){
    		$('#CopyCasefromSF').click(handleSFtoSiebel);
    		$('#CopyRMAToSF').click(handleSiebeltoSF);
	});
            
         function handleSFtoSiebel(){
           
            document.getElementById("case_number_VF").innerHTML  = srObj().context.environment.record.CaseNumber;	
         }
          
        function handleSiebeltoSF(){
        	
        	caseId = srObj().context.environment.record.Id;
		var caseUri = srObj().context.links.sobjectUrl + "Case/"+caseId;
		var siebelRMANum = document.getElementById("RMA_Siebel_Num");
		var body = {"siebelRMANum__c":"99999999"};
		Sfdc.canvas.client.ajax(caseUri,{
		        	     	client : srObj().client,
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
        	return srObj().client.instanceUrl;
        }

   </script>

 <h1>Zebra Siebel Canvas App</h1>
  
   <button id="CopyCasefromSF">FROM SF</button><br>
   <label><b>SF Case Number from SF on Siebel Page</b></label>
   <textarea id="case_number_VF" rows="1" value="test" cols="10"></textarea><br><br><br>
   <button id="CopyRMAToSF"> TO SF</button><br>
   <label><b>Siebel RMA# from Siebel on Siebel Page</b></label>
   <textarea id="RMA_Siebel_Num" value="99999999" rows="1" cols="10"></textarea>
  
  </body>
</html>