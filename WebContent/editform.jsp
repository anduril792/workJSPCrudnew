<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Form</title>
</head>
<body>
<%@page import="com.javatpoint.dao.UserDao,com.javatpoint.bean.User"%>

<%
String id=request.getParameter("id");
User u=UserDao.getRecordById(Integer.parseInt(id));

String sex = u.getSex();
request.setAttribute("s", sex);

String country = u.getCountry();
request.setAttribute("c", country);
%>

<h1>會員修改</h1>
<form action="edituser.jsp" method="post">
<input type="hidden" name="id" value="<%=u.getId() %>"/>
<table>
<tr><td>姓名 :</td><td><input type="text" name="name" value="<%= u.getName()%>"/></td></tr>
<tr><td>密碼 :</td><td><input type="password" name="password" value="<%= u.getPassword()%>"/></td></tr>
<tr><td>電子郵件 :</td><td><input type="email" name="email" value="<%= u.getEmail()%>"/></td></tr>
<tr><td>性別 :</td><td><input type="radio" name="sex" value="male" ${s=="male"? "checked='checked'":"" } />Male <input type="radio" name="sex" value="female" ${s=="female"? "checked='checked'":"" }/>Female </td></tr>
<tr><td>城市 :</td><td>
<select name="country">
<option ${c=="India"? "selected":"" }>India</option>
			<option ${c=="Pakistan"? "selected":"" }>Pakistan</option>
			<option ${c=="Afghanistan"? "selected":"" }>Afghanistan</option>
			<option ${c=="Berma"? "selected":"" }>Berma</option>
			<option ${c=="Other"? "selected":"" }>Other</option>
</select>
</td></tr>
<tr><td colspan="2"><input type="submit" value="修改"/></td></tr>
</table>
</form>

</body>
</html>