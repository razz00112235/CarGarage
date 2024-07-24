package com.homepage;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Car_Category_Menu {

	private String product_category;

	public String getCar_category_name() {
		return product_category;
	}

	public void setCar_category_name(String product_category) {
		this.product_category = product_category;
	}

	
}
