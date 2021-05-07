<%@ page
	language="java"
	contentType="application/xhtml+xml; charset=UTF-8"
	pageEncoding="UTF-8"

	import="
		edu.cwru.spring2021.csds341.group7.Employees,
		edu.cwru.spring2021.csds341.group7.GetAPet,
		edu.cwru.spring2021.csds341.group7.data.Employee,

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

	Employees employees = new Employees(connection);

	if (request.getMethod().equals("POST"))
	{
		String param_firstName = request.getParameter("firstName");
		String param_lastName = request.getParameter("lastName");
		String param_username = request.getParameter("username");
		String param_password = request.getParameter("password");
		String param_phoneNumber = request.getParameter("phoneNumber");

		// TODO: error check input

		Employee employee = new Employee(
			null,
			param_firstName,
			param_lastName,
			param_username,
			param_password,
			param_phoneNumber
		);

		employees.insert(employee);
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>Reading Checkbox Data</title>
	</head>

	<body>
		<h1>New Employee</h1>

		<form method="post">
			<div>
				<table>
					<tr><td>firstName:</td><td><input type="text" name="firstName" /></td></tr>
					<tr><td>lastName</td><td><input type="text" name="lastName" /></td></tr>
					<tr><td>username:</td><td><input type="text" name="username" /></td></tr>
					<tr><td>password:</td><td><input type="text" name="password" /></td></tr>
					<tr><td>phoneNumber:</td><td><input type="text" name="phoneNumber" /></td></tr>
				</table>
				<div>
					<input type="submit" value="submit" />
				</div>
			</div>
		</form>

		<h1>Existing Employees</h1>

		<table>
			<tr>
				<th>eid</th>
				<th>firstName</th>
				<th>lastName</th>
				<th>username</th>
				<th>password</th>
				<th>phoneNumber</th>
			</tr>

			<%
				Collection<Employee> allEmployees = employees.getAllEmployees();
				for (Employee employee : allEmployees)
				{
			%>
			<tr>
				<td>
					<% request.setAttribute("tmp", employee.eid); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", employee.firstName); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", employee.lastName); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", employee.username); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", employee.password); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", employee.phoneNumber); %>
					<c:out value="${tmp}"/>
				</td>
			</tr>
			<%
				}
			%>

		</table>

	</body>
</html>
