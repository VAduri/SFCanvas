<!doctype html>
<html>
<head>

		<!--build-css-start-->
	  <link rel="stylesheet" href="src/main/webapp/salesforce-lightning-design-system.css" />
		<link rel="stylesheet" href="src/main/webapp/canvas-starter-styles.css" />
		<!--build-css-end-->

		<script src="src/main/webapp/canvas-all.js"></script>
		<script src="src/main/webapp/canvas-starter.js"></script>

</head>

<body>
<script>
  Sfdc.canvas(function(){
	  var loggedIn = Sfdc.canvas.oauth.loggedin();
    if (loggedIn) {
      Sfdc.canvas.client.repost({refresh : true});
    }
		login.addEventListener("click" , cnv.login);
  });
</script>

<div id="oauth">
      <h2 class="sub-title">User Authentication Required</h2>
</div>
<br>
<div class="button-wrapper oauth">
  <button id="login">authorize app</button>
</div>

</body>

</html>