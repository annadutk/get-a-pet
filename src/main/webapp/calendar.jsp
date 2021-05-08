<%@ page
	language="java"
	contentType="application/xhtml+xml; charset=UTF-8"
	pageEncoding="UTF-8"

	import="
		edu.cwru.spring2021.csds341.group7.Day_time_slots,
		edu.cwru.spring2021.csds341.group7.Grooming_timeSlots,
		edu.cwru.spring2021.csds341.group7.GetAPet,
		edu.cwru.spring2021.csds341.group7.data.Day_time_slot,
		edu.cwru.spring2021.csds341.group7.data.Grooming_timeSlot,

		java.sql.Connection,
		java.util.Collection,

		javax.naming.InitialContext,
		javax.sql.DataSource
	"
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	// get database connection
	Connection connection = GetAPet.getDataSource().getConnection();

	Day_time_slots day_time_slots = new Day_time_slots(connection);
	Grooming_timeSlots grooming_timeSlots = new Grooming_timeSlots(connection);

	if (request.getMethod().equals("POST"))
	{
		String param_submit = request.getParameter("submit");

		if (param_submit.equals("newDay"))
		{
			String param_timeSlotID = request.getParameter("timeSlotID");
			String param_startTime = request.getParameter("startTime");
			String param_endTime = request.getParameter("endTime");
			String param_weekdaysOffered = request.getParameter("weekdaysOffered");

			// TODO: error check input
			int timeSlotID = Integer.valueOf(param_timeSlotID);
			int startTime = Integer.valueOf(param_startTime);
			int endTime = Integer.valueOf(param_endTime);

			Day_time_slot day_time_slot = new Day_time_slot(
				timeSlotID,
				startTime,
				endTime,
				param_weekdaysOffered
			);

			day_time_slots.insert(day_time_slot);
			}

		else if (param_submit.equals("newGrooming"))
		{
			String param_aid = request.getParameter("aid");
			String param_timeSlotID = request.getParameter("timeSlotID");

			// TODO: error check input
			int aid = Integer.valueOf(param_aid);
			int timeSlotID = Integer.valueOf(param_timeSlotID);

			Grooming_timeSlot grooming_timeSlot = new Grooming_timeSlot(
				aid,
				timeSlotID
			);

			grooming_timeSlots.insert(grooming_timeSlot);
		}

		else
		{
			throw new Exception("unknown submit?: " + param_submit);
		}
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<title>Reading Checkbox Data</title>
	</head>

	<body>
		<h1>New day time slot</h1>

		<form method="post">
			<div>
				<table>
					<tr><td>timeSlotID:</td><td><input type="text" name="timeSlotID" /></td></tr>
					<tr><td>startTime:</td><td><input type="text" name="startTime" /></td></tr>
					<tr><td>endTime:</td><td><input type="text" name="endTime" /></td></tr>
					<tr><td>Day of the week:</td></tr>
					<select name="weekdaysOffered">
						<option value="M">Monday</option>
						<option value="T">Tuesday</option>
						<option value="W">Wednesday</option>
						<option value="Th">Thursday</option>
						<option value="F">Friday</option>
						<option value="S">Saturday</option>
						<option value="Su">Sunday</option>
						</select>
				</table>
				<div>
					<input type="submit" name="submit" value="newDay" />
				</div>
			</div>
		</form>
		
		<h1>New grooming time slot</h1>

		<form method="post">
			<div>
				<table>
					<tr><td>aid:</td><td><input type="text" name="aid" /></td></tr>
					<tr><td>timeSlotID:</td><td><input type="text" name="timeSlotID" /></td></tr>
				</table>
				<div>
					<input type="submit" name="submit" value="newGrooming" />
				</div>
			</div>
		</form>

		<h1>Existing Day_time_slots</h1>

		<table>
			<tr>
				<th>timeSlotID</th>
				<th>startTime</th>
				<th>endTime</th>
				<th>param_weekdaysOffered</th>
			</tr>

			<%
				Collection<Day_time_slot> allDay_time_slots = day_time_slots.getAllDay_time_slots();
				for (Day_time_slot day_time_slot : allDay_time_slots)
				{
			%>
			<tr>
				<td>
					<% request.setAttribute("tmp", day_time_slot.timeSlotID); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", day_time_slot.startTime); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", day_time_slot.endTime); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", day_time_slot.weekdaysOffered); %>
					<c:out value="${tmp}"/>
				</td>
			</tr>
			<%
				}
			%>

		</table>

		<h1>Existing Grooming times</h1>

		<table>
			<tr>
				<th>aid</th>
				<th>timeSlotID</th>
			</tr>

			<%
				Collection<Grooming_timeSlot> allGrooming_timeSlots = grooming_timeSlots.getAllGrooming_timeSlots();
				for (Grooming_timeSlot grooming_timeSlot : allGrooming_timeSlots)
				{
			%>
			<tr>
				<td>
					<% request.setAttribute("tmp", grooming_timeSlot.aid); %>
					<c:out value="${tmp}"/>
				</td>
				<td>
					<% request.setAttribute("tmp", grooming_timeSlot.timeSlotID); %>
					<c:out value="${tmp}"/>
				</td>
			</tr>
			<%
				}
			%>

		</table>

	</body>
</html>
