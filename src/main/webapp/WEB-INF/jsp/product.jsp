<%@ page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>JK3B03</title>

</head>

<%
ArrayList<String[]> makers = (ArrayList<String[]>) request.getAttribute("makers");

ArrayList<String[]> products = (ArrayList<String[]>) request.getAttribute("products");
%>

<body>

	<h2>メーカー一覧</h2>

	<form method="GET" action="./item">

		<select name="MAKER_CODE">

			<%
			for (String[] maker : makers) {
			%>

			<option value="<%=maker[0]%>"><%=maker[1]%></option>

			<%
			}
			%>

		</select> <input type="submit" value="絞り込む" />

	</form>

	<h2>商品一覧</h2>

	<%
	if (products != null && !products.isEmpty()) {
	%>

	<table border="1">

		<%
		for (String[] product : products) {
		%>

		<tr>

			<td><%=product[0]%></td>

			<td><%=product[1]%></td>

			<td><%=product[2]%></td>

		</tr>

		<%
		}
		%>

	</table>

	<%
	} else {
	%>

	<p>そのメーカーはありません</p>

	<%
	}
	%>

</body>

</html>
