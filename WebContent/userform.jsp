<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

function check()
{
	var name = document.getElementById("name");
	var msex = document.getElementById("msex").checked;
	var fsex = document.getElementById("fsex").checked;
	var pwd1 = document.getElementById("pwd1");
	var pwd2 = document.getElementById("pwd2");
	
	if(pwd1.value != pwd2.value)
		{
			alert("密碼錯誤。");
			return false;
		}
	
	var obj = document.getElementById("name").value;  
    if(/.*[\u4e00-\u9fa5]+.*$/.test(obj))  
    {  
    alert("帳號不可為中文。");  
    return false;  
    }  
	
	if(name.value == "" || (msex == false && fsex == false))
	{
		if(name.value == "")
		{	
			alert("請填寫帳號。");
			return false;
		}
		else if(msex == false && fsex == false)
   		{
    		alert("未選擇性別。");
    		return false;
   		}
		
		
	}
	return true;
}

	window.onload = function() {
		var nameElement = document.getElementById("name");
		nameElement.onblur = function() {
			var val = this.value;
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						var msg = document.getElementById("msg");
						if (val == "") {
							msg.innerHTML = "<font color='red'>帳號不可空白</font>";
						} else if (xhr.responseText == "true") {
							msg.innerHTML = "<font color='red'>帳號已存在</font>";
						} else {
							msg.innerHTML = "可以使用";
						}
					}
				}
			}
			xhr.open("get", "${pageContext.request.contextPath }/servlet/ckNameServlet?name=" + val);
			xhr.send(null);
		}

}

</script>
<body>

<h1>新增會員</h1>
<form action="adduser.jsp" method="post" onsubmit="return check();" name="userform">
<table>
<tr><td>帳號:</td><td><input type="text" name="name" id="name"/><span id="msg"></span></td></tr>
<tr><td>密碼:</td><td><input type="password" name="password" id="pwd1"/></td></tr>
<tr><td>確認密碼:</td><td><input type="password" name="password" id="pwd2"/></td></tr>
<tr><td>電子郵件:</td><td><input type="email" name="email"/></td></tr>
<tr><td>性別:</td><td><input type="radio" name="sex" id="msex" value="male"/>Male <input type="radio" name="sex" id="fsex" value="female"/>Female </td></tr>
<tr><td>城市:</td><td>
<select name="country" style="width:155px">
<option>India</option>
<option>Pakistan</option>
<option>Afghanistan</option>
<option>Berma</option>
<option>Other</option>
</select>
</td></tr>
<tr><td colspan="2"><input type="submit" value="新增" /></td></tr>
</table>
</form>

</body>
</html>