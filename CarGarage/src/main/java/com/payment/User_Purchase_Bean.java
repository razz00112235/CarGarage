package com.payment;

import org.springframework.stereotype.Component;

@Component
public class User_Purchase_Bean {

	
	private int order_id;

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	@Override
	public String toString() {
		return "User_Purchase_Bean [order_id=" + order_id + "]";
	}
	
	
}
