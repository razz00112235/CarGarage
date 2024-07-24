package com.payment;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

@Component
public class MyOrderRowMapper implements RowMapper<ProductPurchaseOrder> {

	@Override
	public ProductPurchaseOrder mapRow(ResultSet rs, int rowNum) throws SQLException {

		ProductPurchaseOrder po=new ProductPurchaseOrder();
		po.setId(rs.getInt("id"));
		po.setUser_name(rs.getString("user_name"));
		po.setUser_mail(rs.getString("user_mail"));
		po.setProduct_id(rs.getInt("product_id"));
		po.setProduct_name(rs.getString("product_name"));
		po.setProduct_quantity(rs.getInt("product_quantity"));
		po.setProduct_price(rs.getDouble("product_price"));
		po.setOrder_id(rs.getInt("order_id"));
		po.setOrder_address(rs.getString("order_address"));
		po.setProduct_category(rs.getString("product_category"));
		po.setPayment_mode(rs.getString("payment_mode"));
		po.setPurchase_date(rs.getString("purchase_date"));
		return po;
	}

}
