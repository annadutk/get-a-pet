package edu.cwru.spring2021.csds341.group7.data;

import java.sql.SQLException;

public class Employee
{
	public Integer eid;
	public String firstName;
	public String lastName;
	public String username;
	public String password;
	public String phoneNumber;

	public Employee()
	{

	}

	public Employee(
		Integer eid,
		String firstName,
		String lastName,
		String username,
		String password,
		String phoneNumber)
	{
		this.eid = eid;
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		this.phoneNumber = phoneNumber;
	}
}
