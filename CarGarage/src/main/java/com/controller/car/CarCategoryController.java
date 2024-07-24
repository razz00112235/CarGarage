package com.controller.car;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarCategoryController {

	
	@Autowired
	JdbcTemplate temp;
	
	@RequestMapping("/CarCategory/{product_category}")
	public String viewCategory(@PathVariable  String product_category,Model model,HttpSession session)
	{
		
		  Car_Dao cd=new Car_Dao(temp);
		  List<Car_Category_Data> output=cd.car_data(product_category);
		  model.addAttribute("result_car", output);
		 
		 
		return "Car_Category";
	}
}
