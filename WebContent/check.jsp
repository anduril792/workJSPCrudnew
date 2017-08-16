<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javatpoint.dao.UserDao,com.javatpoint.bean.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="user" class="com.javatpoint.bean.User" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    
    request.setCharacterEncoding("UTF-8");
	request.getSession().setAttribute("user", user);
%>
<c:if test="${user.isValid()}">
<c:redirect url="loginSuccess.jsp"></c:redirect>
</c:if>
<c:if test="${not user.isValid()}">
<c:redirect url="fail.jsp"></c:redirect>
</c:if>


