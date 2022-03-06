function auth(cred){
	var info = cred.username+':'+cred.password;
	var base64 = Java.type('java.util.Base64');
	var encodedstr= base64.getEncoder().encodeToString(info.bytes)
	return 'Basic '+encodedstr;
}