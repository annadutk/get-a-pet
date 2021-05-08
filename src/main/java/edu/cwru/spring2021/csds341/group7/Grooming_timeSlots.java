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

import edu.cwru.spring2021.csds341.group7.data.Grooming_timeSlot;

public class Grooming_timeSlots
{
	private static final Logger log = Logger.getLogger(Grooming_timeSlots.class.getCanonicalName());

	protected Connection connection;
	protected PreparedStatement insertGrooming_timeSlot;
	protected PreparedStatement selectAllGrooming_timeSlots;

	public Grooming_timeSlots(Connection connection) throws SQLException
	{
		this.connection = connection;
		this.insertGrooming_timeSlot = this.connection.prepareStatement(
			"insert into grooming_timeslot (aid, timeSlotID) values (?, ?);"
		);
		this.selectAllGrooming_timeSlots = this.connection.prepareStatement(
			"select aid, timeSlotID from grooming_timeslot;"
		);
	}

	public int insert(Grooming_timeSlot grooming_timeSlot) throws SQLException
	{
		int parameterIndex = 1;
		insertGrooming_timeSlot.setInt(parameterIndex++, grooming_timeSlot.aid);
		insertGrooming_timeSlot.setInt(parameterIndex++, grooming_timeSlot.timeSlotID);
		int row = insertGrooming_timeSlot.executeUpdate();
		log.log(Level.INFO, "row: {0}", row);
		return row;
	}

	public Collection<Grooming_timeSlot> getAllGrooming_timeSlots() throws SQLException
	{
		List<Grooming_timeSlot> grooming_timeSlots = new ArrayList<>();

		ResultSet results = selectAllGrooming_timeSlots.executeQuery();

		while (results.next())
		{
			Integer aid = results.getInt("aid");
			Integer timeSlotID = results.getInt("timeSlotID");

			Grooming_timeSlot grooming_timeSlot = new Grooming_timeSlot(
				aid,
				timeSlotID
			);

			grooming_timeSlots.add(grooming_timeSlot);
		}

		return grooming_timeSlots;
	}
}
