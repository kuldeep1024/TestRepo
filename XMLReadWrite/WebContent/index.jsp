<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*,javax.xml.parsers.*,java.io.File,org.w3c.dom.*,com.xmlRead.XMLReader"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<%
		new XMLReader();
	%>
	<a href="index.jsp">Home Page</a>
	<br>
	<button onclick="myFunction()">Reload page</button>

	<%
		if (XMLReader.isEmpty) {
	%>
	<h4>Empty XML File!</h4>
	<%
		} else {
	%>

	<form action="">
		<table border=1 id="form1">
			<tr>
				<td>Root Element :</td>
				<td><select onchange="change1()" id="selectOpt01">
						<option>-SELECT-</option>
						<%
							for (String key : XMLReader.list) {
						%>
						<option><%=key%></option>
						<%
							}
						%>
				</select></td>
			</tr>
		</table>
	</form>

	<%
		}
	%>
	<div id="div-">
		<h4>Get data here</h4>
	</div>

</body>
</html>