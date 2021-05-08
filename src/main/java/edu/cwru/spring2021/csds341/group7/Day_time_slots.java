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

import edu.cwru.spring2021.csds341.group7.data.Day_time_slot;

public class Day_time_slots
{
	private static final Logger log = Logger.getLogger(Day_time_slots.class.getCanonicalName());

	protected Connection connection;
	protected PreparedStatement insertDay_time_slot;
	protected PreparedStatement selectAllDay_time_slots;

	public Day_time_slots(Connection connection) throws SQLException
	{
		this.connection = connection;
		this.insertDay_time_slot = this.connection.prepareStatement(
			"insert into day_time_slot (timeSlotID, startTime, endTime, weekdaysOffered) values (?, ?, ?, ?);"
		);
		this.selectAllDay_time_slots = this.connection.prepareStatement(
			"select timeSlotID, startTime, endTime, weekdaysOffered from day_time_slot"
		);
	}

	public int insert(Day_time_slot day_time_slot) throws SQLException
	{
		int parameterIndex = 1;
		insertDay_time_slot.setInt(parameterIndex++, day_time_slot.timeSlotID);
		insertDay_time_slot.setInt(parameterIndex++, day_time_slot.startTime);
		insertDay_time_slot.setInt(parameterIndex++, day_time_slot.endTime);
		insertDay_time_slot.setString(parameterIndex++, day_time_slot.weekdaysOffered);
		int row = insertDay_time_slot.executeUpdate();
		log.log(Level.INFO, "row: {0}", row);
		return row;
	}

	public Collection<Day_time_slot> getAllDay_time_slots() throws SQLException
	{
		List<Day_time_slot> day_time_slots = new ArrayList<>();

		ResultSet results = selectAllDay_time_slots.executeQuery();

		while (results.next())
		{
			Integer timeSlotID = results.getInt("timeSlotID");
			Integer startTime = results.getInt("startTime");
			Integer endTime = results.getInt("endTime");
			String weekdaysOffered = results.getString("weekdaysOffered");

			Day_time_slot day_time_slot = new Day_time_slot(
				timeSlotID,
				startTime,
				endTime,
				weekdaysOffered
			);

			day_time_slots.add(day_time_slot);
		}

		return day_time_slots;
	}
}
