package edu.cwru.spring2021.csds341.group7.data;

import java.sql.SQLException;

public class Grooming_timeSlot
{
	public Integer aid;
	public Integer timeSlotID;

	public Grooming_timeSlot()
	{

	}

	public Grooming_timeSlot(
		Integer aid,
		Integer timeSlotID)
	{
		this.aid = aid;
		this.timeSlotID = timeSlotID;
	}
}
