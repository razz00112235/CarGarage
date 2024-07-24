package com.controller.car;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class Car_Data_RowMapper implements RowMapper<Car_Category_Data>  {

	 @Override public Car_Category_Data mapRow(ResultSet rs, int rowNum) throws  SQLException {
		 
		 Car_Category_Data cd=new Car_Category_Data();
	     cd.setId(rs.getInt("id"));
	     cd.setProduct_id(rs.getInt("product_id"));
	     cd.setProduct_name(rs.getString("product_name"));
	     cd.setProduct_price(rs.getDouble("product_price"));
	     cd.setProduct_image(rs.getString("product_image"));
         cd.setProduct_count(rs.getInt("product_count"));
	     cd.setProduct_category(rs.getString("product_category"));
	     cd.setProduct_description(rs.getString("product_description")); 
	     
	     return cd;
	  }
	 

}
