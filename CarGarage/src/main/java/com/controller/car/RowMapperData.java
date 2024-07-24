package com.controller.car;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class RowMapperData implements RowMapper<UserData>
{

	@Override
	public UserData mapRow(ResultSet rs, int rowNum) throws SQLException {

		UserData data=new UserData();
		data.setId(rs.getInt("id"));
		data.setUser_name(rs.getString("user_name"));
		data.setUser_mail(rs.getString("user_mail"));
		data.setUser_pass(rs.getString("user_mail"));
		return data;
	}

}
