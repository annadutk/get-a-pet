package edu.cwru.spring2021.csds341.group7.data;

import java.math.BigDecimal;
import java.sql.SQLException;

public class Foster
{
	public Integer fid;
	public String firstName;
	public String lastName;
	public String username;
	public String password;
	public String phoneNumber;
	public BigDecimal fund;

	public Foster()
	{

	}

	public Foster(
		Integer fid,
		String firstName,
		String lastName,
		String username,
		String password,
		String phoneNumber,
		BigDecimal fund)
	{
		this.fid = fid;
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.fund = fund;
	}
}
