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

import edu.cwru.spring2021.csds341.group7.data.Animal;

public class Animals
{
	private static final Logger log = Logger.getLogger(Animals.class.getCanonicalName());

	protected Connection connection;
	protected PreparedStatement insertAnimal;
	protected PreparedStatement selectAllAnimals;

	public Animals(Connection connection) throws SQLException
	{
		this.connection = connection;
		this.insertAnimal = this.connection.prepareStatement(
			"insert into animal (name, species, breed, sex, age, neutered, fosterable, adoptable) values (?, ?, ?, ?, ?, ?, ?, ?);"
		);
		this.selectAllAnimals = this.connection.prepareStatement(
			"select aid, name, species, breed, sex, age, neutered, fosterable, adoptable from animal"
		);
	}

	public int insert(Animal animal) throws SQLException
	{
		int parameterIndex = 1;
		insertAnimal.setString(parameterIndex++, animal.name);
		insertAnimal.setString(parameterIndex++, animal.species);
		insertAnimal.setString(parameterIndex++, animal.breed);
		insertAnimal.setString(parameterIndex++, animal.sex == null ? null : animal.sex.toString());
		insertAnimal.setInt(parameterIndex++, animal.age);
		insertAnimal.setString(parameterIndex++, animal.neutered == null ? null : (animal.neutered ? "y" : "n"));
		insertAnimal.setString(parameterIndex++, animal.fosterable == null ? null : (animal.fosterable ? "y" : "n"));
		insertAnimal.setString(parameterIndex++, animal.adoptable == null ? null : (animal.adoptable ? "y" : "n"));
		int row = insertAnimal.executeUpdate();
		log.log(Level.INFO, "row: {0}", row);
		return row;
	}

	public Collection<Animal> getAllAnimals() throws SQLException
	{
		List<Animal> animals = new ArrayList<>();

		ResultSet results = selectAllAnimals.executeQuery();

		while (results.next())
		{
			Integer aid = results.getInt("aid");
			String name = results.getString("name");
			String species = results.getString("species");
			String breed = results.getString("breed");
			String sex_str = results.getString("sex");
			assert sex_str.length() <= 1;
			Character sex = sex_str == null ? null : sex_str.charAt(0);
			Integer age = results.getInt("age");
			String neutered_str = results.getString("neutered");
			assert neutered_str == null || neutered_str.equals("y") || neutered_str.equals("n");
			Boolean neutered = neutered_str == null ? null : neutered_str.equals("y");
			String fosterable_str = results.getString("fosterable");
			assert fosterable_str == null || fosterable_str.equals("y") || fosterable_str.equals("n");
			Boolean fosterable = fosterable_str == null ? null : fosterable_str.equals("y");
			String adoptable_str = results.getString("adoptable");
			assert adoptable_str == null || adoptable_str.equals("y") || adoptable_str.equals("n");
			Boolean adoptable = adoptable_str == null ? null : adoptable_str.equals("y");

			Animal animal = new Animal(
				aid,
				name,
				species,
				breed,
				sex,
				age,
				neutered,
				fosterable,
				adoptable
			);

			animals.add(animal);
		}

		return animals;
	}
}
