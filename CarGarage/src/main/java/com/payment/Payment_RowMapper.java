package com.payment;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class Payment_RowMapper implements RowMapper<User_Purchase_Bean> {

	@Override
	public User_Purchase_Bean mapRow(ResultSet rs, int rowNum) throws SQLException {

		User_Purchase_Bean user_purchase=new User_Purchase_Bean();
		
		user_purchase.setOrder_id(rs.getInt("order_id"));
		
		
		return user_purchase;
	}

}
