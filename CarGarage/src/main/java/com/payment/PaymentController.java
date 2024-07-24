package com.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.controller.car.Car_Category_Data;
import com.controller.car.Car_Data_RowMapper;
import com.homepage.Car_Category_Menu;
import com.homepage.Car_Category_Menu_RowMapper;

import java.util.Map;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
@Controller
public class PaymentController {

	@Autowired
	JdbcTemplate temp;
	
	
	@RequestMapping("/payment_final")
	public String paymentDone(HttpServletRequest request,Model model,HttpSession session)
	{ 
		
		 String select_order="select order_id from user_order";
		 List<User_Purchase_Bean> result = temp.query(select_order, new Payment_RowMapper());
		 int last_order_id=0;
		 for (User_Purchase_Bean ub : result) {
			
			last_order_id=ub.getOrder_id();
		}
		 last_order_id+=1;
		 model.addAttribute("payment", result);
		
		 String order_name,order_email,order_address,payment_type;
			order_name=request.getParameter("order_user");
			order_email=request.getParameter("order_email");
			order_address=request.getParameter("order_place");
			payment_type=request.getParameter("payment_type");
			
			LocalDateTime currentDateTime = LocalDateTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	        String purchase_date_time = currentDateTime.format(formatter);
	        
		 long final_price=0;
		 Map<String, HashMap<String, String>> cart2 = (Map<String, HashMap<String, String>>) session.getAttribute("cart");
	     if (cart2 != null) {
	         for (Map.Entry<String, HashMap<String, String>> entry : cart2.entrySet()) {
	        	 
	        	 int productId =Integer.parseInt(entry.getKey());
	             HashMap<String, String> productDetails = entry.getValue();
	             // Now you can work with productDetails HashMap
	             // For example, if you want to retrieve quantity from productDetails:
	             String Product_name = productDetails.get("product_name");
	             String Product_act_price = productDetails.get("product_act_price");
	             int Product_quantity =Integer.parseInt(productDetails.get("product_quantity"));
	             String Product_price = productDetails.get("product_price");
	             String product_category = productDetails.get("product_category");
	             double doubleValue = Double.parseDouble(Product_price);
	              
	               final_price=final_price+(long)doubleValue;
	              System.out.println(last_order_id+" "+order_name+" "+productId+" "+Product_name+" "+Product_act_price+" "+Product_quantity+" "+Product_price+" "+product_category+" "+doubleValue);
	               
	               
	                String select_item_list="select * from product_add where product_id=?";
		           	List<Car_Category_Data> product_result = temp.query(select_item_list,new Car_Data_RowMapper(),productId);
		           	int total_product=0;
		           	for (Car_Category_Data product : product_result) {
		           		total_product=product.getProduct_count();
					}
		           
		           	total_product-=Product_quantity;	
		           	
		           	
		           	
		           		 
		           		String insert_product="insert into user_order (user_name,user_mail,product_id,product_name,product_quantity,product_price,order_address,order_id,product_category,payment_mode,purchase_date)values(?,?,?,?,?,?,?,?,?,?,?)";
			            int insert_cart_result=temp.update(insert_product,order_name,order_email,productId,Product_name,Product_quantity,Product_price,order_address,last_order_id,product_category,payment_type,purchase_date_time);
			           	
			            if(insert_cart_result>0)
			           	{
			           		String update_product="update product_add set product_count=? where product_id=?";
			           		int update_result=temp.update(update_product, total_product,productId);
			           		
			           		 if(update_result>0)
			           		 {
			           			session.removeAttribute("cart");
			           			
			           			
			           		 }else{
			           			 return "failed";
			           		 }
			           		
			           	}
					
		           	
		           	
		           	
	         }
		
	        
	     }
	     return "Payment";
	}
	
	
	@RequestMapping("/MyOrder2")
	public String viewOrder(HttpSession session,Model model)
	{
		 String user_email=null;
         if(session.getAttribute("user_mail")!=null)
         {
      	   user_email=(String)session.getAttribute("user_mail");
            
         }
		//String fetch_order="select * from user_order where user_mail=? order by id desc";
        String fetch_order="SELECT * FROM user_order uo WHERE uo.id IN (SELECT MAX(id) FROM user_order WHERE user_mail = ? GROUP BY order_id) ORDER BY uo.id DESC";
		List<ProductPurchaseOrder> orderData=temp.query(fetch_order, new MyOrderRowMapper(),user_email);
        model.addAttribute("orderData", orderData);
        
        String getCarCategory = "SELECT DISTINCT product_category FROM product_add";
        List<Car_Category_Menu> result = temp.query(getCarCategory, new Car_Category_Menu_RowMapper());
        model.addAttribute("product_category", result);
        
		return "MyOrder";
	}
	
	
	@RequestMapping("/PrintReceipt/{id}")
	public String viewRecipet(@PathVariable int id,HttpSession session,Model model)
	{
		     
		String fetch_receipt_data="select * from user_order where order_id=?";
		List<ProductPurchaseOrder> result_data=temp.query(fetch_receipt_data, new MyOrderRowMapper(),id);
        model.addAttribute("fetch_receipt_data", result_data);
		return "PrintReceipt";
	}
	
}
