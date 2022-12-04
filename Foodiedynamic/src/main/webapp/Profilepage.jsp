<%@page import="com.FoodieServers.userobj" %>
<%@page import="com.FoodieServers.userdao" %>
<%@page import="com.FoodieServers.DbCon" %>

<%@page import="java.util.List" %>
<%
	if(session.getAttribute("name")==null){
		response.sendRedirect("Login.jsp");
	}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
	}

userdao pd = new userdao(DbCon.getConnection());
String top8 = "Select * from `customer` where uname ='"+(String)session.getAttribute("name")+"'";
userobj users = pd.getAllusers(top8);
%>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/64e1bb2e91.js" crossorigin="anonymous"></script>
</head>
<body>

<%@include file="header.jsp" %>
<div>
<h1> My Account</h1>
<h2>Hi, <%
		if(!users.equals("")){%>
			<%=users.getAddress() %> <br>
			Contact no.
			 <%= users.getContact() %>

		<%}
		%>		
</h2>
</div>

<%@include file="footer.jsp" %>
</body>
</html>