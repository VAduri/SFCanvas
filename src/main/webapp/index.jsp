<html>
  <head>
  <script type="text/javascript"
    src="https://na16.salesforce.com/canvas/sdk/js/28.0/canvas-all.js">
  </script>
  </head>
  <body>
    <script>
function profileHandler(e) {
  var profileUrl = Sfdc.canvas.oauth.instance() +
    "/services/data/v28.0/chatter/users/me";
  Sfdc.canvas.client.ajax(profileUrl, {
    client: Sfdc.canvas.oauth.client(),
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
    });
  }
  return false;
}
Sfdc.canvas(function() {
  var login = Sfdc.canvas.byId("login");
  var loggedIn = Sfdc.canvas.oauth.loggedin();
  if (loggedIn) {
    Sfdc.canvas.byId("oauth").innerHTML = Sfdc.canvas.oauth.token();
    var profile = Sfdc.canvas.byId("profile");
    profile.onclick = profileHandler;
  }
  login.onclick = loginHandler;
});
</script>
    <h1>Venkata Aduri OAuth2.0 Play ground Example</h1>
    <div>access_token</div>
    <textarea id="oauth" rows="2" cols="80" disabled="true"></textarea>
    <div>
      <a id="login" href="#">Login</a><br/>
      <a id="profile" href="#">My Chatter Profile</a><br />
    </div>
    <textarea id="chatter_profile" rows="20" cols="80"></textarea>
  </body>
</html>