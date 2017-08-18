package com.javatpoint.bean;

import java.util.List;

import com.javatpoint.dao.UserDao;

public class User
{
	private int id;
	private String name, password, email, sex, country;

	public User() {}
	public User(int id, String name, String password, String email, String sex, String country)
	{
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.sex = sex;
		this.country = country;
	}
	
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{			
		this.name = name;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getSex()
	{
		return sex;
	}

	public void setSex(String sex)
	{
		this.sex = sex;
	}

	public String getCountry()
	{
		return country;
	}

	public void setCountry(String country)
	{
		this.country = country;
	}

	public boolean isValid()
	{
		List<User> list = UserDao.getAllRecords();

		for (User e : list)
		{
			if (name != null && password != null)
			{
				if (name.equals(e.getName()) && password.equals(e.getPassword()))
				{
					return true;
				}
			}
		}
		return false;

	}
	
	public boolean isAdmin(){
		List<User> list = UserDao.getAllRecords();

		for (User e : list)
		{
			if (name != null && password != null)
			{
				if (name.equals(e.getName()) && password.equals(e.getPassword()))
				{
					if(50==e.getId()){
						
						return true;
					}
					
				}
			}
		}
		return false;
		
		
	}

}
