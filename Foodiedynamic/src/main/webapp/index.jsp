<%@page import="com.FoodieServers.productobj"%>
<%@page import="com.FoodieServers.productdao"%>
<%@page import="com.FoodieServers.DbCon"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.FoodieModels.Cart"%>
<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("Login.jsp");
}
productdao pd = new productdao(DbCon.getConnection());
String top8 = "Select * from `food_items` limit 8";
List<productobj> products = pd.getAllProducts(top8);
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<html>
<head>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/64e1bb2e91.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container" style="margin-top: 30px">
		<div class="row" style="width: 100%; height: 100%">
			<div class="col-md-6 my-6 "
				style="display: flex; flex-direction: column; justify-content: center">
				<p class="h1">Hungry?!</p>
				<br>
				<p class="h3">Good. We are here to serve you.</p>
				<br>
				<button type="button" class="btn btn-lg btn-danger">Start
					ordering now</button>
			</div>
			<div class="col-md-6 my-6">
				<img class="card-img-top" style="border-radius: 25px"
					src="product-image/vegfood.jpeg" alt="Card image cap">
			</div>
		</div>
		<div class="top">
			<h4>Food Items</h4>
			<div class="view-all">
				<a href="AllFoodItems.jsp">View All</a>
			</div>
		</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (productobj p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100" style="width: 25rem;">
					<img class="card-img-top" src="<%=p.getImage()%>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName()%></h5>
						<h6 class="price">
							Price: $
							<%=p.getPrice()%></h6>
						<h6 class="category">
							Category:
							<%=p.getCategory()%></h6>
						<div class="mt-3 d-flex justify-content-between ">
							<a href="AddToCart?id=<%=p.getId()%>"
								class="btn btn-danger btn-sm">Add to Cart</a> <a href="#"
								class="btn btn-danger btn-sm">Order Now </a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
		</div>

		<%@include file="footer.jsp"%>
</body>
</html>
