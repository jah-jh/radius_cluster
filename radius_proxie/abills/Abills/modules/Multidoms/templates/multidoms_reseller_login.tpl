<script type=\"text/javascript\">
	function selectLanguage() {
		sLanguage	= '';
		
		try {
			frm = document.forms[0];
			if(frm.language)
				sLanguage = frm.language.options[frm.language.selectedIndex].value;
			sLocation = '$SELF_URL?language='+sLanguage;
			location.replace(sLocation);
		} catch(err) {
			alert('Your brownser do not support JS');
		}
	}
</script>
<br>
<br>
<form action='$SELF_URL' METHOD='post'>
<TABLE width='400'  cellspacing='0' cellpadding='0' border='0'><TR><TD bgcolor='_{COLORS}_[4]'>
<TABLE width='100%' cellspacing='1' cellpadding='0' border='0'><TR><TD bgcolor='_{COLORS}_[1]'>
<TABLE width='100%' cellspacing='0' cellpadding='0' border='0'>
<TR bgcolor=_{COLORS}_[2]><TH colspan=2><a href='$SELF_URL?registration=1'>_{REGISTRATION}_</a> ::
<a href='$SELF_URL?FORGOT_PASSWD=1'>_{PASSWORD_RECOVERY}_</a></TH></TR>
<TR><TH colspan=2>&nbsp;</TH></TR>

<TR><TD>_{LANGUAGE}_:</TD><TD>%SEL_LANGUAGE%</TD></TR>
<TR><TD>_{LOGIN}_:</TD><TD><input type='text' name='user'></TD></TR>
<TR><TD>_{PASSWD}_:</TD><TD><input type='password' name='passwd'></TD></TR>
<TR><TD>_{TIME}_:</TD><TD><input type='text' name='web_session_timeout' value='%web_session_timeout%' size=5> _{MINUTES}_</TD></TR>
<tr><th colspan='2'>
<input type='submit' name='logined' value='_{ENTER}_'>
</th></TR>

</TABLE>
</TD></TR></TABLE>
</TD></TR></TABLE>
</form>
<br>
<br>
