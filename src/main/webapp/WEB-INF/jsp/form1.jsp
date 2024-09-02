<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form</title>
</head>

<%
ArrayList<String[]> result = (ArrayList<String[]>) request.getAttribute("result");
%>

<body>
	<form method="GET" action="./result1">
		<select name="ID">

			<%
			for (String[] ss : result) {
			%>
			<OPTION VALUE="<%=ss[1]%>">
				<%=ss[0]%>
			</OPTION>
			<%
			}
			%>

		</select> <input type="SUBMIT" value="絞り込む" />
	</form>
</body>
</html>