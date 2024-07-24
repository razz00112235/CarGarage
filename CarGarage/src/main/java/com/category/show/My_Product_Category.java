package com.category.show;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.controller.car.Car_Category_Data;
import com.controller.car.Car_Data_RowMapper;
import com.homepage.Car_Category_Menu;
import com.homepage.Car_Category_Menu_RowMapper;

@Controller
public class My_Product_Category {

	@Autowired
	JdbcTemplate temp;
    @Autowired
    Car_Category_Data carData;
    @Autowired
    Car_Data_RowMapper carMapper;
    @Autowired
    Car_Category_Menu car_menu;
    
	@RequestMapping("/Product_Category_Page/{product_category}")
	public String showCategory(@PathVariable String product_category,Model model)
	{
		
		String getData="select * from product_add where product_category=?";
		List<Car_Category_Data> result=temp.query(getData, new Car_Data_RowMapper(),product_category);
		model.addAttribute("product_data", result);
		
		String getCarCategory = "SELECT DISTINCT product_category FROM product_add";
        List<Car_Category_Menu> result2 = temp.query(getCarCategory, new Car_Category_Menu_RowMapper());
        model.addAttribute("product_category", result2);
        
		return "Car_Category_Page";
	}
}
