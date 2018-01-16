package com.xmlRead;

import java.io.File;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;

public class XMLReader {

	public static int depthOfXML = 1;
	public static ArrayList<String> list = null;
	public static ArrayList<String> attrList = null;
	public static Document doc;
	public static String xmlFile;
	public static boolean isEmpty=false;
	public static XPath xPath = XPathFactory.newInstance().newXPath();
	public static String root="";

	public  XMLReader() {
		
		System.out.println("Working Directory = " +
                System.getProperty("user.dir"));
		
		
		try {
			list=new ArrayList<String>();
			
			xmlFile = "C:\\Users\\51542294\\Documents\\xml_file.xml";

			File file = new File(xmlFile);
			if (file.exists()) {
				// Create a factory
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				// Use the factory to create a builder
				DocumentBuilder builder = factory.newDocumentBuilder();
				doc = builder.parse(xmlFile);
				doc.getDocumentElement().normalize();

				Element elements = doc.getDocumentElement();
				root="/";
				//Add Root Element
				list.add(elements.getNodeName());

			} else {
				System.out.print("File not found!");
			}
		} catch (Exception e) {
			isEmpty=true;
			System.out.println(e);
			//System.exit(1);
		}
	}


	public static void add(String node, String name, String value,String add_type)
			throws TransformerException, XPathExpressionException {

		NodeList nodes = (NodeList) xPath.compile("//"+node).evaluate(doc,
				XPathConstants.NODESET);

		Element p = doc.createElement(name);
		Text a = doc.createTextNode(value);
		p.appendChild(a);
		if(add_type.equals("before")){
			nodes.item(0).getParentNode().insertBefore(p, nodes.item(0));
		}else{       
			nodes.item(0).appendChild(p);
		}

		// write the content into xml file
		TransformerFactory tf = TransformerFactory.newInstance();
		Transformer t = tf.newTransformer();
		DOMSource source = new DOMSource(doc);
		StreamResult result = new StreamResult(new File(xmlFile));
		t.transform(source, result);

	}

	public static void remove(String name) throws XPathExpressionException,
			TransformerException {

		Node b13Node = (Node) xPath.compile("//"+name).evaluate(doc,
				XPathConstants.NODE);
		b13Node.getParentNode().removeChild(b13Node);

		// write the content into xml file
		TransformerFactory tf = TransformerFactory.newInstance();
		Transformer t = tf.newTransformer();
		t.transform(new DOMSource(doc), new StreamResult(new File(xmlFile)));
	}
	

	public static boolean checkAttr(String node)
			throws XPathExpressionException {
		boolean flag = false;
		attrList = new ArrayList<>();
		
		String expression = "//" + node + "/attribute::*";
		
		NodeList nodeList = (NodeList) xPath.compile(expression).evaluate(doc,
				XPathConstants.NODESET);
		for (int i = 0; i < nodeList.getLength(); i++) {
			flag = true;
			attrList.add("Attribute Name : "+nodeList.item(i).getNodeName() + ",  Attribute Value : "
					+ nodeList.item(i).getFirstChild().getNodeValue());
			// System.out.println(nodeList.item(i).getNodeName()+"  "+nodeList.item(i).getFirstChild().getNodeValue());
		}
		return flag;
	}

}
