package edu.cwru.spring2021.csds341.group7.data;

import java.sql.SQLException;

public class Day_time_slot
{
	public Integer timeSlotID;
	public Integer startTime;
	public Integer endTime;
	public String weekdaysOffered;

	public Day_time_slot()
	{

	}

	public Day_time_slot(
		Integer timeSlotID,
		Integer startTime,
		Integer endTime,
		String weekdaysOffered)
	{
		this.timeSlotID = timeSlotID;
		this.startTime = startTime;
		this.endTime = endTime;
		this.weekdaysOffered = weekdaysOffered;
	}
}
