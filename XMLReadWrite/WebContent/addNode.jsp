<%@ page
	import="com.xmlRead.XMLReader"%>
<% if (request.getParameter("submit") != null) {
	    String name = request.getParameter("name");
	    String value = request.getParameter("value");
	    String node = request.getParameter("hidden");
	    String add_type = request.getParameter("add_type");
	    
	  	    
	    XMLReader.add(node, name, value,add_type);
	    
	    
	    response.setStatus(response.SC_MOVED_TEMPORARILY);
	    response.setHeader("Location", "index.jsp"); 
}

%>



<%
String nodeName = "";
	
%>
<%
	if (nodeName.equals("")) {
		nodeName = request.getParameter("node");
	}

%>


<form action="addNode.jsp" method="post">

<h4>Add a Node before node -> <span style="color:red"><%=nodeName %></span></h4>
	<table id="form1" >
			<tr>
				<td>Node Name :</td>
				<td><input id="name" name="name"></td>
			</tr>
			<tr>
				<td>Node Value :</td>
				<td><input id="value" name="value"></td>
			</tr>
			<tr>
				<td>ADD Node : </td>
				<td>
					<select name="add_type">
					<option value="before">Before this node</option>
					<option value="child">As a child of this node</option>
					</select>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
				<input type="hidden" id="hidden" value="<%=nodeName %>" name="hidden">
				<input type="submit" name="submit"  value="Add Node"></td>
			</tr>

		</table>

</form>
