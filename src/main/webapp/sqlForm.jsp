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
		javax.sql.DataSource
	"
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

	<form action="connector.jsp" method="get">
		<div>
		<textarea name="queryForm" rows="30" cols="100"></textarea>
		<br/><br/>
		<input type="submit" id="submitButton" name="submitButton"/>
		</div>
	</form>
	</div>
</body>
</html>
