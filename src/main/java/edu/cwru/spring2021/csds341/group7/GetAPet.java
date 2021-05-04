package edu.cwru.spring2021.csds341.group7;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GetAPet
{
	public static final String JNDI_GET_A_PET = "java:/comp/env/jdbc/get_a_pet";

	public static DataSource getDataSource() throws NamingException
	{
		return (DataSource)(new InitialContext().lookup(JNDI_GET_A_PET));
	}
}
