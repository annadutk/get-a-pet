<%@ page
	language="java"
	contentType="application/xhtml+xml; charset=UTF-8"
	pageEncoding="UTF-8"

	import="
		edu.cwru.spring2021.csds341.group7.Animals,
		edu.cwru.spring2021.csds341.group7.GetAPet,
		edu.cwru.spring2021.csds341.group7.data.Animal,

		java.sql.Connection,
		java.util.Collection,

		javax.naming.InitialContext,
		javax.sql.DataSource,
		java.sql.ResultSet,
		java.sql.Statement
	"
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	ResultSet results = null;

	if (request.getMethod().equals("POST"))
	{
		// get database connection
		Connection connection = GetAPet.getDataSource().getConnection();

		Statement statement = connection.createStatement();
		results = statement.executeQuery(request.getParameter("queryForm"));
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>

	<meta charset="utf-8"/>
	<meta name="description" content="UI-1"/>
	<link rel="stylesheet" href="./sqlForm.css"/>
 
	<title>Get A Pet</title>

</head>

<body>
	<div class="centerPanel">
	<h1 class="pageName">Get a Pet</h1>

	<p>Input your SQL query here:</p>

	<form method="post">
		<div>
		<textarea name="queryForm" rows="30" cols="100"></textarea>
		<br/><br/>
		<input type="submit" id="submitButton" name="submitButton"/>
		</div>
	</form>
	<%
		if (results != null)
		{
	%>
	<h1>Results</h1>
	<div>
	<%
		while (results.next())
		{

	%>
		<p>
		<%
		for (int i = 1; i <= results.getMetaData().getColumnCount(); i++)
		{
			String columnName = results.getMetaData().getColumnName(i);
			String columnValue = results.getString(i);
		%>
			<% request.setAttribute("tmp", columnName + " = " + columnValue + "; "); %>
			<c:out value="${tmp}"/>
		<%
			}
		%>
		</p>
	<%
		}
	%>
	</div>
	<%
		}
	%>
	</div>
</body>
</html>
