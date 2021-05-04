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
		String param_name = request.getParameter("name");
		String param_species = request.getParameter("species");
		String param_breed = request.getParameter("breed");
		String param_sex = request.getParameter("sex");
		String param_age = request.getParameter("age");
		String param_neutered = request.getParameter("neutered");
		String param_fosterable = request.getParameter("fosterable");
		String param_adoptable = request.getParameter("adoptable");

		// TODO: error check input
		Character sex = param_sex == null || param_sex.isEmpty() ? null : param_sex.charAt(0);
		int age = Integer.valueOf(param_age);
		Boolean neutered = param_neutered == null || param_neutered.isEmpty() ? false : param_neutered.equals("on");
		Boolean fosterable = param_fosterable == null || param_fosterable.isEmpty() ? false : param_fosterable.equals("on");
		Boolean adoptable = param_adoptable == null || param_adoptable.isEmpty() ? false : param_adoptable.equals("on");

		Animal animal = new Animal(
			null,
			param_name,
			param_species,
			param_breed,
			sex,
			age,
			neutered,
			fosterable,
			adoptable
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
				<table>
					<tr><td>name:</td><td><input type="text" name="name" /></td></tr>
					<tr><td>species:</td><td><input type="text" name="species" /></td></tr>
					<tr><td>breed:</td><td><input type="text" name="breed" /></td></tr>
					<tr><td>sex:</td><td><input type="text" name="sex" /></td></tr>
					<tr><td>age:</td><td><input type="text" name="age" /></td></tr>
					<tr><td>neutered:</td><td><input type="checkbox" name="neutered" /></td></tr>
					<tr><td>fosterable:</td><td><input type="checkbox" name="fosterable" /></td></tr>
					<tr><td>adoptable:</td><td><input type="checkbox" name="adoptable" /></td></tr>
				</table>
				<div>
					<input type="submit" value="submit" />
				</div>
			</div>
		</form>

		<h1>Existing Animals</h1>

		<table>
			<tr>
				<th>aid</th>
				<th>name</th>
				<th>species</th>
				<th>breed</th>
				<th>sex</th>
				<th>age</th>
				<th>neutered</th>
				<th>fosterable</th>
				<th>adoptable</th>
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
				<td>
					<% request.setAttribute("tmp", animal.name); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", animal.species); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", animal.breed); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", animal.sex); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", animal.age); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", animal.neutered); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", animal.fosterable); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", animal.adoptable); %>
					<c:out value="${tmp}"/>
				</td>
			</tr>
			<%
				}
			%>

		</table>

	</body>
</html>
