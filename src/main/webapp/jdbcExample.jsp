<%@ page
	language="java"
	contentType="application/xhtml+xml; charset=UTF-8"
	pageEncoding="UTF-8"

	import="
		edu.cwru.spring2021.csds341.group7.JdbcExample,

		java.sql.Connection,

		javax.naming.InitialContext,
		javax.sql.DataSource
	"
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	// get database connection from JNDI (configured in web application server)
	DataSource datasource = (DataSource)(new InitialContext().lookup("java:/comp/env/jdbc/coffee"));
	Connection connection = datasource.getConnection();
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>jdbcExample</title>
	</head>
	<body>
		<%
			// Access the database, and save string value to tmp, for escaping
			request.setAttribute("tmp", JdbcExample.example(connection));
		%>
		<%-- escape tmp --%>
		<c:out value="${tmp}"/>
	</body>
</html>
