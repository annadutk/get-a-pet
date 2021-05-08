<%@page import="java.util.ArrayList"%>
<%@page import="java.util.AbstractList"%>
<%@ page
	language="java"
	contentType="application/xhtml+xml; charset=UTF-8"
	pageEncoding="UTF-8"

	import="
		edu.cwru.spring2021.csds341.group7.Animals,
		edu.cwru.spring2021.csds341.group7.GetAPet,
		edu.cwru.spring2021.csds341.group7.data.Animal,

		java.sql.Connection,
		java.util.Collection,
		java.util.ArrayList,

		javax.naming.InitialContext,
		javax.sql.DataSource,
		java.sql.ResultSet,
		java.sql.Statement
	"
%><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%

	//get database connection
	Connection connection = GetAPet.getDataSource().getConnection();
		
	Animals animals = new Animals(connection);
	
	// Declare variables
	String param_search = "";
	Boolean cat;
	Boolean dog;
	Boolean m;
	Boolean f;
	Boolean neutered;
	Boolean fosterable;
	Boolean adoptable;

	if (request.getMethod().equals("POST"))
	{
		// Get search input
		param_search = request.getParameter("search");
		
		// Get filters
		String param_cat = request.getParameter("cat");
		String param_dog = request.getParameter("dog");
		String param_m = request.getParameter("m");
		String param_f = request.getParameter("f");
		String param_neutered = request.getParameter("ns");
		String param_fosterable = request.getParameter("foster");
		String param_adoptable = request.getParameter("adopt");
		
		// Set booleans
		cat = param_cat == null || param_cat.isEmpty() ? false : param_cat.equals("on");
		dog = param_dog == null || param_dog.isEmpty() ? false : param_dog.equals("on");
		m = param_m == null || param_m.isEmpty() ? false : param_m.equals("on");
		f = param_f == null || param_f.isEmpty() ? false : param_f.equals("on");
		neutered = param_neutered == null || param_neutered.isEmpty() ? false : param_neutered.equals("on");
		fosterable = param_fosterable == null || param_fosterable.isEmpty() ? false : param_fosterable.equals("on");
		adoptable = param_adoptable == null || param_adoptable.isEmpty() ? false : param_adoptable.equals("on");
	}
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>

	<meta charset="utf-8"/>
	<meta name="description" content="UI-1"/>
	<link rel="stylesheet" href="./animalSearch.css"/>

	<title>Animal Search</title>
	
</head>

<body>
	
	<div class="container">
		<h1>Animal Search and Browse</h1>
		
		<!-- Search bar and filters -->
		<form method="post">
			<input type="text" id="search" name="search">
			<button type="submit">Search</button>
		
			<p>Only show...</p>
		
			<input type="checkbox" id="cat" name="cat">
			<label for="cat">Cat</label>
			<input type="checkbox" id="dog" name="dog">
			<label for="dog">Dog</label>
			<br>
		
			<input type="checkbox" id="m" name="m">
			<label for="m">Male</label>
			<input type="checkbox" id="f" name="f">
			<label for="f">Female</label>
			<br>
		
			<input type="checkbox" id="adopt" name="adopt">
			<label for="adopt">Adoptable</label>
			<br>
		
			<input type="checkbox" id="foster" name="foster">
			<label for="foster">Foster</label>
			<br>
		
			<input type="checkbox" id="ns" name="ns">
			<label for="ns">Neutered/Spayed</label>
		</form>
		
		<!-- Return results -->
		<div class="display">
			<% 
			Collection<Animal> allAnimals = animals.getAllAnimals(); // List of all animals
			Collection<Animal> searchedAnimals = new ArrayList<Animal>(); // List of animals that apply to the search term
			Collection<Animal> filteredAnimals = new ArrayList<Animal>(); // List of searched animals with the filters applied
			
			// Transfer applicable animals from allAnimals to searchedAnimals;
			try {
				for (Animal animal : allAnimals) {
					if (Integer.valueOf(param_search).equals(animal.aid)) {
						searchedAnimals.add(animal);
					}
				}
			}
			catch (NumberFormatException e) {}
			%>
		</div>
	</div>
	
</body>