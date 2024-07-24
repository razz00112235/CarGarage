package com.homepage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class HomeController {

    @Autowired
    private JdbcTemplate temp;

    @RequestMapping(value = {"/", "/home"})
    public String viewHomeMenu(Model model) {
        String getCarCategory = "SELECT DISTINCT product_category FROM product_add";
        List<Car_Category_Menu> result = temp.query(getCarCategory, new Car_Category_Menu_RowMapper());
        model.addAttribute("product_category", result);
        
        String select_car_data="select * from product_add order by RAND(id) desc limit 20 ";
        List<CarData> result2 = temp.query(select_car_data, new CarDataRowMapper());
        model.addAttribute("carDetails", result2);
        
        return "index2";
    }
    
    @RequestMapping("/search")
    public String searchItem(HttpServletRequest request,Model model)
    {
    	String item_search=request.getParameter("search_item");
    	String sql_query = "SELECT product_name, product_id FROM product_add WHERE product_name LIKE ?";
    	List<Search_category> search=temp.query(sql_query, new Search_row_mapper(),item_search+"%");
    	model.addAttribute("search_data", search);
    	
    	return "search";
    }
    
    
  
}
