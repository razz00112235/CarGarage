package com.homepage;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class Search_row_mapper implements RowMapper<Search_category>{

	@Override
	public Search_category mapRow(ResultSet rs, int rowNum) throws SQLException {

		Search_category sc=new Search_category();
		sc.setProduct_id(rs.getInt("product_id"));
		sc.setProduct_name(rs.getString("product_name"));
		
		return sc;
	}

}
