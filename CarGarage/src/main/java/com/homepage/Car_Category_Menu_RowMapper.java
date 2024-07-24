package com.homepage;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Car_Category_Menu_RowMapper implements RowMapper<Car_Category_Menu>{

	@Override
	public Car_Category_Menu mapRow(ResultSet rs, int rowNum) throws SQLException {

		Car_Category_Menu cm=new Car_Category_Menu();
	
		cm.setCar_category_name(rs.getString("product_category"));
		return cm;
	}
 
}
