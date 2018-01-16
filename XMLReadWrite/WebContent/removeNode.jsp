<%@ page
	import="java.util.*,javax.xml.parsers.*,javax.xml.xpath.*,java.io.File,org.w3c.dom.*,com.xmlRead.XMLReader"%>

<% if (request.getParameter("submit") != null) {
	String name = request.getParameter("name");
	
	XMLReader.remove(name);
	  
    response.setStatus(response.SC_MOVED_TEMPORARILY);
    response.setHeader("Location", "index.jsp"); 
}

%>

<%
String nodeName = "";
NodeList nodeList = null;
	
%>
<%
	if (nodeName.equals("")) {
		nodeName = request.getParameter("node");
		
		XPath xPath = XPathFactory.newInstance().newXPath();

		String expression = nodeName + "/child::*";

		nodeList = (NodeList) xPath.compile(expression).evaluate(
				XMLReader.doc, XPathConstants.NODESET);
		%>
		Child nodes of <%= nodeName%><br>
	
		<%
		if (nodeList.getLength() != 0) {
		
			for (int i = 0; i < nodeList.getLength(); i++) {
				%>
					<%=nodeList.item(i).getNodeName() %><br>
				
				<%
				
				
			}
			
		}else{
			%>
			
			Child Not found <br>
			Value of this node : 
			<%
			
			if(nodeName!=null){

			NodeList nodes = (NodeList) xPath.compile(nodeName).evaluate(XMLReader.doc,
					XPathConstants.NODESET);
				if(nodes.getLength()>0){
			%>
			<%=nodes.item(0).getChildNodes().item(0)
			.getTextContent()
			
			%>
		
			<%
				}
			}
		}
		
		
	}

%>
<script>
function ConfirmDelete()
{
  var x = confirm("Are you sure you want to delete? \nWhen a node is removed, all its child nodes are also removed.");
  if (x)
      return true;
  else
    return false;
}

</script>


<form onsubmit="return ConfirmDelete();" action="removeNode.jsp" method="post" >
<input type="hidden" name="name" value="<%= nodeName %>">
<input type="submit" name="submit" value ="Delete <%= nodeName %> Node ">
</form>


<%-- 
	<a href="remove.jsp?name=<%= nodeName %>" Onclick="return ConfirmDelete();" >Delete <%= nodeName %> Node </a>


 --%>