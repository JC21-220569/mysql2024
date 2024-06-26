<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jk3b03</title>
</head>

<%
ArrayList<String[]> result = (ArrayList<String[]>) request.getAttribute("result");
%>

<body>
	<TABLE>

		<%
		for (String[] ss : result) {
		%>
		<TR>
			<TD><%=ss[0]%></TD>
			<th><%=ss[1]%></th>
			<TD><%=ss[2]%></TD>
		</TR>
		<%
		}
		%>


		
	</TABLE>

</body>
</html>
