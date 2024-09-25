<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<li class="nav-item active"><a class="nav-link" href="BankHomePage.jsp">Welcome,&nbsp;<%= (String)session.getAttribute("bemail")%></a></li>
    <li class="nav-item active"><a class="nav-link" href="userview.jsp">View</a></li>
    <li class="nav-item active"><a class="nav-link" href="Bank_userview.jsp">View Loan</a></li>
	<li class="nav-item active"><a class="nav-link" href="doLogin">LogOut</a></li>
</body>
</html>