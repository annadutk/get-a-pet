package edu.cwru.spring2021.csds341.group7;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import edu.cwru.spring2021.csds341.group7.data.Foster;

public class Fosters
{
	private static final Logger log = Logger.getLogger(Fosters.class.getCanonicalName());

	protected Connection connection;
	protected PreparedStatement insertFoster;
	protected PreparedStatement selectAllFosters;

	public Fosters(Connection connection) throws SQLException
	{
		this.connection = connection;
		this.insertFoster = this.connection.prepareStatement(
			"insert into foster (firstName, lastName, username, password, phoneNumber, fund) values (?, ?, ?, ?, ?, ?);"
		);
		this.selectAllFosters = this.connection.prepareStatement(
			"select fid, firstName, lastName, username, password, phoneNumber, fund from foster"
		);
	}

	public int insert(Foster foster) throws SQLException
	{
		int parameterIndex = 1;
		insertFoster.setString(parameterIndex++, foster.firstName);
		insertFoster.setString(parameterIndex++, foster.lastName);
		insertFoster.setString(parameterIndex++, foster.username);
		insertFoster.setString(parameterIndex++, foster.password);
		insertFoster.setString(parameterIndex++, foster.phoneNumber);
		insertFoster.setBigDecimal(parameterIndex++, foster.fund);
		int row = insertFoster.executeUpdate();
		log.log(Level.INFO, "row: {0}", row);
		return row;
	}

	public Collection<Foster> getAllFosters() throws SQLException
	{
		List<Foster> fosters = new ArrayList<>();

		ResultSet results = selectAllFosters.executeQuery();

		while (results.next())
		{
			Integer fid = results.getInt("fid");
			String firstName = results.getString("firstName");
			String lastName = results.getString("lastName");
			String username = results.getString("username");
			String password = results.getString("password");
			String phoneNumber = results.getString("phoneNumber");
			BigDecimal fund = results.getBigDecimal("fund");

			Foster foster = new Foster(
				fid,
				firstName,
				lastName,
				username,
				password,
				phoneNumber,
				fund
			);

			fosters.add(foster);
		}

		return fosters;
	}
}
