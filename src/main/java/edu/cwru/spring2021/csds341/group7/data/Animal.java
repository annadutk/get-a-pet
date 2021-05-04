package edu.cwru.spring2021.csds341.group7.data;

import java.sql.SQLException;

public class Animal
{
	public Integer aid;
	public String name;
	public String species;
	public String breed;
	public Character sex;
	public Integer age;
	public Boolean neutered;
	public Boolean fosterable;
	public Boolean adoptable;

	public Animal()
	{

	}

	public Animal(
		Integer aid,
		String name,
		String species,
		String breed,
		Character sex,
		Integer age,
		Boolean neutered,
		Boolean fosterable,
		Boolean adoptable)
	{
		this.aid = aid;
		this.name = name;
		this.species = species;
		this.breed = breed;
		this.sex = sex;
		this.age = age;
		this.neutered = neutered;
		this.fosterable = fosterable;
		this.adoptable = adoptable;
	}
}
