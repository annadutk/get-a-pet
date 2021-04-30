package edu.cwru.spring2021.csds341.group7;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Example
{
	private static final Logger log = Logger.getLogger(Example.class.getCanonicalName());

	protected String title;

	public static void trySomething()
	{
		log.log(Level.INFO, "something happened!");
	}

	public static String getName()
	{
		try
		{
			return InetAddress.getLocalHost().getHostName();
		}
		catch (UnknownHostException e)
		{
			// not expected to occur
			throw new RuntimeException(e);
		}
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getTitle()
	{
		return title;
	}
}
