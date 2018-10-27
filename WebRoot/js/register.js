	 
	function checkForm(){ 
	  var nametip = checkUserName(); 
	  var passtip = checkPassword();  
	  var conpasstip = ConfirmPassword(); 
	  var phonetip = checkPhone(); 
	  return nametip && passtip && conpasstip && phonetip; 
	  } 
	  //验证用户名   
	  function checkUserName(){ 
	  var username = document.getElementById('username'); 
	  var errname = document.getElementById('nameErr'); 
	  var pattern = /^[a-zA-Z0-9_-]{3,16}$/;  //3到16位（字母，数字，下划线，减号） 
	  if(username.value.length == 0){ 
	    errname.innerHTML="用户名不能为空";
	    errname.style.color="red";
	    errname.className="error";
	    return false; 
	    } 
	  if(!pattern.test(username.value)){ 
	    errname.innerHTML="用户名不合规范";;
	    errname.style.color="red";
	    errname.className="error";
	    return false; 
	    } 
	   else{ 
	     errname.innerHTML="OK";
	     errname.style.color="green";
	     errname.className="success"; 
	     return true; 
	     } 
	  } 
	  //验证密码   
	function checkPassword(){ 
	  var userpasswd = document.getElementById('password'); 
	  var errPasswd = document.getElementById('passwordErr'); 
	  var pattern = /^\w{6,12}$/; //密码要在6-12位 
	  if(!pattern.test(userpasswd.value)){ 
	    errPasswd.innerHTML="密码不合规范";
	    errPasswd.style.color="red";
	    errPasswd.className="error"
	    return false; 
	    } 
	   else{ 
	     errPasswd.innerHTML="OK"
	     errPasswd.style.color="green";
	     errPasswd.className="success"; 
	     return true; 
	     } 
	  }
	//确认密码 
	function ConfirmPassword(){ 
	var userpasswd = document.getElementById('password'); 
	var userConPassword = document.getElementById('confirmpwd'); 
	var errConPasswd = document.getElementById('conPasswordErr'); 
	if((userpasswd.value)!=(userConPassword.value) || userConPassword.value.length == 0){ 
	  errConPasswd.innerHTML="上下密码不一致";
	   errConPasswd.style.color="red";
	  errConPasswd.className="error";
	  return false; 
	  } 
	 else{ 
	   errConPasswd.innerHTML="OK";
	   errConPasswd.style.color="green";
	   errConPasswd.className="success"; 
	   return true; 
	   }    
	}
	//验证姓名
	function checkName(){ 
	var name = document.getElementById('usercaption'); 
	var nameErr = document.getElementById('RnameErr'); 
	if(name.value.length==0){ 
		nameErr.innerHTML="姓名不能为空";
		nameErr.style.color="red";
		nameErr.className="error";
		return false; 
	  } 
	 else{ 
		 nameErr.innerHTML="OK";
		 nameErr.style.color="green";
		 nameErr.className="success"; 
		 return true; 
	   } 
	}
	//验证手机号 
	function checkEmail(){ 
	var email= document.getElementById('inputEmail'); 
	var emailErr = document.getElementById('ErrEmail'); 
	var pattern = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; //验证邮箱正则表达式 
	if(!pattern.test(email.value)){ 
		emailErr.innerHTML="邮箱格式不合规范";
		emailErr.style.color="red";
		emailErr.className="error";
		return false; 
	  } 
	 else{ 
		 emailErr.innerHTML="OK";
		 emailErr.style.color="green";
		 emailErr.className="success"; 
		 return true; 
	   } 
	} 
	//验证手机号 
	function checkPhone(){ 
	var userphone = document.getElementById('inputTelephone'); 
	var phonrErr = document.getElementById('phoneErr'); 
	var pattern = /^1[34578]\d{9}$/; //验证手机号正则表达式 
	if(!pattern.test(userphone.value)){ 
	  phonrErr.innerHTML="手机号码不合规范";
	  phonrErr.style.color="red";
	  phonrErr.className="error";
	  return false; 
	  } 
	 else{ 
	   phonrErr.innerHTML="OK";
	   phonrErr.style.color="green";
	   phonrErr.className="success"; 
	   return true; 
	   } 
	} 
