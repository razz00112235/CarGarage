package com.homepage;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CarDataRowMapper implements RowMapper<CarData>{

	@Override
	public CarData mapRow(ResultSet rs, int rowNum) throws SQLException {

		 CarData car=new CarData();
		 car.setId(rs.getInt("id"));
	     car.setProduct_id(rs.getInt("product_id"));
	     car.setProduct_name(rs.getString("product_name"));
	     car.setProduct_price(rs.getLong("product_price"));
	     car.setProduct_image(rs.getString("product_image"));
	     car.setProduct_count(rs.getInt("product_count"));
	     car.setProduct_category(rs.getString("product_category"));
	     car.setProduct_description(rs.getString("product_description")); 
	     
	     return car;
	}

}
