<%@page import="javax.jws.Oneway"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*,javax.xml.parsers.*,javax.xml.xpath.*,java.io.File,org.w3c.dom.*,com.xmlRead.XMLReader"%>
<%
	String nodeName = "";
	NodeList nodeList = null;
	List<String> list2 = new ArrayList<String>();
%>
<%
	if (nodeName.equals("")) {
		nodeName = request.getParameter("aa");
		
		XMLReader.root=XMLReader.root+"/"+nodeName;
				
		XPath xPath = XPathFactory.newInstance().newXPath();
		String expression = "//" + nodeName + "/child::*";
		nodeList = (NodeList) xPath.compile(expression).evaluate(
				XMLReader.doc, XPathConstants.NODESET);
		if (nodeList.getLength() != 0) {
			for (int i = 0; i < nodeList.getLength(); i++) {
				list2.add(nodeList.item(i).getNodeName());
			}
		}
	}
%>
<form action="">
	<table border=1>
		<tr>
			<%
				if (nodeList.getLength() != 0) {
					int i=1;
			%>
			<td>Child Tags of : <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=nodeName%></td>
			<td>
			
				<a href="addNode.jsp?node=<%=nodeName%>"> Add a node
					before/child of < <%=nodeName%> > node
			</a><br> <a href="removeNode.jsp?node=<%=nodeName%>"> Delete < <%=nodeName%>
					> node
			</a>
			<br>
			
							<%
					if (XMLReader.checkAttr(nodeName)) {
						for (String key : XMLReader.attrList) {
				%> <%=key%><br> <%
 	}

 	}
 %>
 
			
			<select onchange="selectOpt(1102)" id="selectOpt1102">
					<option>-SELECT-</option>
					<%
						for (String key : list2) {
					%>
					<option><%=key%></option>
					<%
					i++;
						}
					%>
			</select><br>
				</td>
			<%
				} else {
			%>
			<td>Value of <%=nodeName%> :</td>
			<td>
				<%
					NodeList nList = XMLReader.doc.getElementsByTagName(nodeName);
						String val2 = nList.item(0).getChildNodes().item(0)
								.getTextContent();
				%><%=val2%>
			</td>
			<%
				}
			%>
		</tr>

		<tr>
		</tr>
	</table>
</form>
