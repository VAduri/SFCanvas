<!doctype html>
<html>
<head>
<title>Callback Refresh Window</title>
<script type="text/javascript">
    //notify parent window we're authorized
    try {
          window.opener.Sfdc.canvas.oauth.childWindowUnloadNotification(self.location.hash);
      	}
     catch (ignore) {}
    //self.close();
</script>
</head>
<body>
</body>
</html>