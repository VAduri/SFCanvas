<html>
  <head>
   <script type="text/javascript"
      src="https://na16.salesforce.com/canvas/sdk/js/38.0/canvas-all.js">
    </script>
    <script type="text/javascript"
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js">
  </script>
     
  </head>
  <body>
    <script>
    
   
function profileHandler(e) {
  var profileUrl = Sfdc.canvas.oauth.instance() +
    "/services/data/v38.0/chatter/users/me";
  Sfdc.canvas.client.ajax(profileUrl, {
    client: {oauthToken :Sfdc.canvas.oauth.client().oauthToken,instanceId :"_:Venkata_Heroku_OAuth:j_id0:j_id1:canvasapp",targetOrigin :"https://na16.salesforce.com"},
    failure: function(data) {
      alert(data);
    },
    success: function(data) {
    if (data.status === 200) {
      Sfdc.canvas.byId("chatter_profile").innerHTML =
        JSON.stringify(data.payload);
     }
    }
  });
}
    
   
    
    function callback(msg) {
       if (msg.status !== 200) {
          alert("Error: " + msg.status);
          return;
       }
       document.getElementById("case_number_VF").innerHTML  = msg.payload.environment.record.CaseNumber;
       console.log(Sfdc.canvas.oauth.client());
       console.log(JSON.stringify(Sfdc.canvas.oauth.client()));
     // alert(JSON.stringify(Sfdc.canvas.oauth.client()));
    	
    }
      
 function contextHandler()
    {
    	Sfdc.canvas.client.ctx(callback, Sfdc.canvas.oauth.client());
    }
    
function loginHandler(e) {
  var uri;
  if (!Sfdc.canvas.oauth.loggedin()) {
    uri = Sfdc.canvas.oauth.loginUrl();
    Sfdc.canvas.oauth.login({
      uri: uri,
      params: {
        response_type : "token",
        client_id : "3MVG9fMtCkV6eLhewNBSKP0dVejMNrlQsYj_PdSNpcHDgREfyID_pBQZwlobe.Em_HERDw1Stb0IW7bEI75RT",
        redirect_uri : encodeURIComponent("https://lit-cliffs-39463.herokuapp.com/callback.jsp")
      }
    }
    );
 }
  return false;
}

function oauthshandler()
    {
    	 Sfdc.canvas.byId("oauth").innerHTML = Sfdc.canvas.oauth.token();
    }

Sfdc.canvas(function() {
  
  var login = Sfdc.canvas.byId("login");
  var loggedIn = Sfdc.canvas.oauth.loggedin();
  if (loggedIn) {
    Sfdc.canvas.client.ctx(callback, Sfdc.canvas.oauth.client());
  }
 var profile = Sfdc.canvas.byId("profile");
 var oauths = Sfdc.canvas.byId("access_token");
 profile.onclick = profileHandler;
  login.onload = loginHandler;
  oauths.onclick=oauthshandler;
  ctxlink.onclick=contextHandler;
  CopyRMAToSF.onclick=updateHandler;
});


function callbacker(msg) {
       if (msg.status !== 200) {
          alert("Error: " + msg.status);
          return;
       }
      
       var siebelRMANum = document.getElementById("RMA_Siebel_Num").innerHTML;
       var body = {"siebelRMANum__c":siebelRMANum};
       		Sfdc.canvas.client.ajax(msg.payload.links.sobjectUrl + "Case/"+msg.payload.environment.record.Id,{
       		        	     	client : {oauthToken :Sfdc.canvas.oauth.client().oauthToken,instanceId :"_:Venkata_Heroku_OAuth:j_id0:j_id1:canvasapp",targetOrigin :"https://na16.salesforce.com"},
       			             	method: "PATCH",
       		                     	contentType: "application/json",
       			             	data:JSON.stringify(body),
       			             	success : function() {
       				     	   //alert("SFDC Case:"+JSON.stringify(msg.payload.environment.record.CaseNumber)+"Updated with Siebel RMA Number:"+siebelRMANum);                         
       			             	} ,
       				     	error: function() {
       				     	    //alert("Error Occured updating Siebel RMA# to SFDC");
       				     	}
                  			});
    }


	function updateHandler(){
        	Sfdc.canvas.client.ctx(callbacker, Sfdc.canvas.oauth.client());
        }
        
        

</script>
    <h1>Venkata Aduri OAuth2.0 SF to Siebel - Login, Chatter, SF to Siebel, Siebel to SF Updates</h1>
    <div>
          <a id="access_token" href="#">User Agent based OAuth2.0 Access Token</a><br/>
          
    </div>
    <textarea id="oauth" rows="2" cols="80" disabled="true"></textarea>
    <div>
      <a id="login" href="#">Login</a><br/>
      <a id="profile" href="#">My Chatter Profile</a><br/>
    </div>
    <textarea id="chatter_profile" rows="20" cols="80"></textarea><br />
    <div>
     <label><b>SF to Siebel: Case Number</b></label><br/>
      <textarea id="case_number_VF" rows="1" value="test" cols="10"></textarea><br/>
   </div>
<div>
       <button id="CopyRMAToSF"> Update SF Case</button><br/>
       <label><b>Siebel to SF: RMA#</b></label> <br/>
      <textarea id="RMA_Siebel_Num" value="87878778" rows="1" cols="10">1111111</textarea><br/>
</div>
<div>
 <a id="ctxlink" href="#">Get Context</a><br/>
 </div>
  </body>
</html>

