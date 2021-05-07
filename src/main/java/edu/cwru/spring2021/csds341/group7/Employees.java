package edu.cwru.spring2021.csds341.group7;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import edu.cwru.spring2021.csds341.group7.data.Employee;

public class Employees
{
	private static final Logger log = Logger.getLogger(Employees.class.getCanonicalName());

	protected Connection connection;
	protected PreparedStatement insertEmployee;
	protected PreparedStatement selectAllEmployees;

	public Employees(Connection connection) throws SQLException
	{
		this.connection = connection;
		this.insertEmployee = this.connection.prepareStatement(
			"insert into employee (firstName, lastName, username, password, phoneNumber) values (?, ?, ?, ?, ?);"
		);
		this.selectAllEmployees = this.connection.prepareStatement(
			"select eid, firstName, lastName, username, password, phoneNumber from employee"
		);
	}

	public int insert(Employee employee) throws SQLException
	{
		int parameterIndex = 1;
		insertEmployee.setString(parameterIndex++, employee.firstName);
		insertEmployee.setString(parameterIndex++, employee.lastName);
		insertEmployee.setString(parameterIndex++, employee.username);
		insertEmployee.setString(parameterIndex++, employee.password);
		insertEmployee.setString(parameterIndex++, employee.phoneNumber);
		int row = insertEmployee.executeUpdate();
		log.log(Level.INFO, "row: {0}", row);
		return row;
	}

	public Collection<Employee> getAllEmployees() throws SQLException
	{
		List<Employee> employees = new ArrayList<>();

		ResultSet results = selectAllEmployees.executeQuery();

		while (results.next())
		{
			Integer eid = results.getInt("eid");
			String firstName = results.getString("firstName");
			String lastName = results.getString("lastName");
			String username = results.getString("username");
			String password = results.getString("password");
			String phoneNumber = results.getString("phoneNumber");

			Employee employee = new Employee(
				eid,
				firstName,
				lastName,
				username,
				password,
				phoneNumber
			);

			employees.add(employee);
		}

		return employees;
	}
}
