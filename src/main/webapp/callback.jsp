<!doctype html>
<html>
<head>
<title>Callback Refresh Window</title>
<script type="text/javascript">
    //notify parent window we're authorized
    try {
      if(window.opener.cnv) {
        window.opener.cnv.refresh();
      }
      else {
        //cnv should be there, but use the standard canvas function as a fallback
        window.opener.Sfdc.canvas.oauth.childWindowUnloadNotification(self.location.hash);
      }
    } catch (ignore) {}
    self.close();
</script>
</head>
<body>
</body>
</html>