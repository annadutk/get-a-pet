<%@ page
	language="java"
	contentType="application/xhtml+xml; charset=UTF-8"
	pageEncoding="UTF-8"

	import="
		edu.cwru.spring2021.csds341.group7.Fosters,
		edu.cwru.spring2021.csds341.group7.GetAPet,
		edu.cwru.spring2021.csds341.group7.data.Foster,
		java.math.BigDecimal,

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

	Fosters fosters = new Fosters(connection);

	if (request.getMethod().equals("POST"))
	{
		String param_firstName = request.getParameter("firstName");
		String param_lastName = request.getParameter("lastName");
		String param_username = request.getParameter("username");
		String param_password = request.getParameter("password");
		String param_phoneNumber = request.getParameter("phoneNumber");
		String param_fund = request.getParameter("fund");

		// TODO: error check input
		BigDecimal fund = new BigDecimal(param_fund);

		Foster foster = new Foster(
			null,
			param_firstName,
			param_lastName,
			param_username,
			param_password,
			param_phoneNumber,
			fund
		);

		fosters.insert(foster);
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>Reading Checkbox Data</title>
	</head>

	<body>
		<h1>New Foster</h1>

		<form method="post">
			<div>
				<table>
					<tr><td>firstName:</td><td><input type="text" name="firstName" /></td></tr>
					<tr><td>lastName</td><td><input type="text" name="lastName" /></td></tr>
					<tr><td>username:</td><td><input type="text" name="username" /></td></tr>
					<tr><td>password:</td><td><input type="text" name="password" /></td></tr>
					<tr><td>phoneNumber:</td><td><input type="text" name="phoneNumber" /></td></tr>
					<tr><td>fund:</td><td><input type="text" name="fund" /></td></tr>
				</table>
				<div>
					<input type="submit" value="submit" />
				</div>
			</div>
		</form>

		<h1>Existing Fosters</h1>

		<table>
			<tr>
				<th>fid</th>
				<th>firstName</th>
				<th>lastName</th>
				<th>username</th>
				<th>password</th>
				<th>phoneNumber</th>
				<th>fund</th>
			</tr>

			<%
				Collection<Foster> allFosters = fosters.getAllFosters();
				for (Foster foster : allFosters)
				{
			%>
			<tr>
				<td>
					<% request.setAttribute("tmp", foster.fid); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", foster.firstName); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", foster.lastName); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", foster.username); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", foster.password); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", foster.phoneNumber); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", foster.fund); %>
					<c:out value="${tmp}"/>
				</td>
			</tr>
			<%
				}
			%>

		</table>

	</body>
</html>
