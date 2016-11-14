<!doctype html>
<html>
<head>

		<!--build-css-start-->
	  <link rel="stylesheet" href="<c:url value="/resources/canvas-starter-styles.css" />" type="text/css">
	 <link rel="stylesheet" href="<c:url value="/resources/salesforce-lightning-design-system.css" />" type="text/css">
		<!--build-css-end-->
				
	<script type="text/javascript" src="<c:url value="/resources/canvas-all.js" /> "> </script>
	<script type="text/javascript" src="<c:url value="/resources/canvas-starter.js" /> "></script>
       

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