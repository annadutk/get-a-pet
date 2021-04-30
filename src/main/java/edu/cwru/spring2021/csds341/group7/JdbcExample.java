package edu.cwru.spring2021.csds341.group7;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcExample
{
	// connection parameters for main()
	public static final String JDBC_CONNECTION_STRING = "jdbc:mysql://localhost/coffee";
	public static final String JDBC_USER_NAME = "user";
	public static final String JDBC_USER_PASSWORD = "password";

	// example JDBC logic given an existing connection
	public static String example(Connection connection) throws SQLException
	{
		// setup PrintStream buffer for out.println()
		ByteArrayOutputStream buf = new ByteArrayOutputStream();
		PrintStream out = new PrintStream(buf);

		// re-usable query statement
		PreparedStatement select_user_coffee = connection.prepareStatement("SELECT coffee FROM coffee WHERE name = ?");

		// populate parameters for prepared statement
		select_user_coffee.setString(1, "john");

		// run the SQL query
		ResultSet user_coffee_results = select_user_coffee.executeQuery();

		// show the results
		while (user_coffee_results.next())
		{
			Integer coffee = user_coffee_results.getInt("coffee");
			if (user_coffee_results.wasNull()) coffee = null;

			out.println(String.format("coffee = %s", coffee));
		}

		// return buffered string
		out.close();
		return new String(buf.toByteArray());
	}

	// manually make connection and show JDBC example
	public static void main(String[] args)
	{
		try
		{
			Connection connection = DriverManager.getConnection(JDBC_CONNECTION_STRING, JDBC_USER_NAME, JDBC_USER_PASSWORD);

			System.out.print(example(connection));
		}
		catch (SQLException e)
		{
			throw new RuntimeException(e);
		}

	}
}
