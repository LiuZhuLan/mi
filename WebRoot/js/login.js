 
function checkForm(){ 
  var nametip = checkUserName(); 
  var passtip = checkPassword();  
  return nametip && passtip; 
  } 
  //验证用户名   
  function checkUserName(){ 
  var username = document.getElementById('username'); 
  var errname = document.getElementById('nameErr'); 
  if(username.value.length == 0){ 
    errname.innerHTML="用户名不能为空";
    errname.style.color="red";
    errname.className="error";
    return false; 
    } 
   else{
	 errPasswd.className="success"; 
     return true; 
     } 
  } 
  //验证密码   
function checkPassword(){ 
  var userpasswd = document.getElementById('password'); 
  var errPasswd = document.getElementById('passwordErr'); 
  if(userpasswd.value.length == 0){ 
	  errPasswd.innerHTML="密码不能为空";
	  errPasswd.style.color="red";
	  errPasswd.className="error";
    return false; 
    } 
   else{ 
	   errPasswd.className="success"; 
	   return true; 
     } 
  } 
