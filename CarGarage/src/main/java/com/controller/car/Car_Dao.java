package com.controller.car;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class Car_Dao {
    
    JdbcTemplate temp2=null;
	public Car_Dao(JdbcTemplate temp)
	{
		this.temp2=temp;
	}
	
	
	  public List<Car_Category_Data> car_data(String product_category) { 
		  
		  String get_car_dat="Select * from product_add where product_category=?";
	      List<Car_Category_Data> result=temp2.query(get_car_dat, new Car_Data_RowMapper(),product_category); 
		  
		 return result; 
		 }
	  
			
			 
			 
	
	
	
	
}
