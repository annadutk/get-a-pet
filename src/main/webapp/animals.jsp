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
<%
	// get database connection
	Connection connection = GetAPet.getDataSource().getConnection();

	Animals animals = new Animals(connection);

	if (request.getMethod().equals("POST"))
	{
		String param_aid = request.getParameter("aid");
		int aid = Integer.valueOf(param_aid);

		Animal animal = new Animal(
			aid,
			"bob", "cat", "dunno", 'm', 10, true, true, true
		);

		animals.insert(animal);
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>Reading Checkbox Data</title>
	</head>

	<body>
		<h1>New Animal</h1>

		<form method="post">
			<div>
				aid: <input type="text" name="aid" />
				<input type="submit" value="submit" />
			</div>
		</form>

		<h1>Existing Animals</h1>

		<table>
			<tr>
				<th>aid</th>
			</tr>

			<%
				Collection<Animal> allAnimals = animals.getAllAnimals();
				for (Animal animal : allAnimals)
				{
			%>
			<tr>
				<td>
					<% request.setAttribute("tmp", animal.aid); %>
					<c:out value="${tmp}"/>
				</td>
			</tr>
			<%
				}
			%>

		</table>

	</body>
</html>
