<%@ page
	language="java"
	contentType="application/xhtml+xml; charset=UTF-8"
	pageEncoding="UTF-8"

	import="
		java.lang.Object,
		edu.cwru.spring2021.csds341.group7.Example
	"
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	Example.trySomething();

	Example example = new Example();
	example.setTitle("Example JSP page");
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title><%= Example.getName() %> - <%= example.getTitle() %></title>
	</head>
	<body>
		<%
			for (int i = 0; i < 3; i++)
			{
		%>
		<p><%= String.format("test %d", i) %></p>
		<%
			}
		%>
	</body>
</html>
