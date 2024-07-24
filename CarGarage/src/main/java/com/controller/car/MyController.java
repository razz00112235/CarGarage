package com.controller.car;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class MyController
{
	@Autowired
	JdbcTemplate temp;	
		
	/*@RequestMapping(value={"/","/home"})
	public String viewHome(JdbcTemplate temp,Model model)
	{  
		
		return "index";
	}*/
	
	
	@RequestMapping("/SearchProductPage")
	public String productData( HttpServletRequest request,Model model2)
	{
		int id=Integer.parseInt(request.getParameter("product_id"));
		String select_item_list="select * from product_add where product_id=?";
		List<Car_Category_Data> carData=temp.query(select_item_list,new Car_Data_RowMapper(),id);
		model2.addAttribute("carDetails", carData);
		model2.addAttribute("main_controller", request.getContextPath());
		return "product";
	}
	
	
	@RequestMapping("/productPage/{id}")
	public String productData(@PathVariable int id, HttpServletRequest request,Model model2)
	{
		String select_item_list="select * from product_add where product_id=?";
		List<Car_Category_Data> carData=temp.query(select_item_list,new Car_Data_RowMapper(),id);
		model2.addAttribute("carDetails", carData);
		model2.addAttribute("main_controller", request.getContextPath());
		return "product";
	}
	
	@RequestMapping("/addToCart")
	public String addCart()
	{
		return "addToCart";
	}
	
	@RequestMapping(value="/AddProduct")
	public String addProduct(Model model)
	{
		String select_item_list="select * from product_add order by id desc limit 10";
		List<Car_Category_Data> carData=temp.query(select_item_list,new Car_Data_RowMapper());
		model.addAttribute("carData", carData);
		return "AddProduct";
	}
	
	@RequestMapping("/SignUp")
	public String signUp(HttpServletRequest request,Model model,HttpServletResponse response)
	{
		SignUpData signup=new SignUpData();
		String user_name,user_mail,user_pass; 
	    user_name=request.getParameter("user");
	    user_mail=request.getParameter("mail");
	    user_pass=request.getParameter("pass");
	    
	    String insert_user="insert into user_data(user_name,user_mail,user_pass) values(?,?,?)";	    
	    int result=temp.update(insert_user,user_name,user_mail,user_pass);
	    
		return "signup";
	}
	
	@RequestMapping(value={"/Login"})
	public String login(HttpServletRequest request,Model model,HttpServletResponse response)
	{
		UserData user=new UserData();
		String user_mail,user_pass; 
	    user_mail=request.getParameter("email");
	    user_pass=request.getParameter("pass");
	    if(user_mail.equals("admin@gmail.com")&&user_pass.equals("admin"))
	    {
	    	return "AddProduct";
	    }else {
	    	String check_user="select * from user_data where user_mail=? && user_pass=?";
	    	List<UserData> list=temp.query(check_user, new Object[] {user_mail,user_pass}, new RowMapperData());
			
			int count=0;
			while(list.size()>0)
			{
				HttpSession session=request.getSession();
				session.setAttribute("user_mail", user_mail);
				count++;
				return "redirect:/";
				
				
			}
			if(count==0)
			{
				return "failed";
				
			}
	    }
	   
		return "redirect:/";
	}
	
	@RequestMapping("/forgot_password")
	public String forgotPass()
	{
		return "forgot_password";
	}
	

	@RequestMapping("/send_reset_link")
	public String resetPass(HttpServletRequest request,Model model,PrintWriter out) throws AddressException, MessagingException
	{
		String main_url=request.getContextPath();
		request.setAttribute("main_url", main_url);
		String email = request.getParameter("email");
		String get_pass="select user_pass from user_data WHERE user_mail = ?";
		List<Map<String, Object>> password=temp.queryForList(get_pass, email);
		model.addAttribute("get_pass", password);
		model.addAttribute("get_email", email);		
		
		
		    String host = "smtp.gmail.com";
		    String user = "meghrajyadav.yadav20";
		    String pass = "rycmbjjjcqsjklmj";
		    String to = email;
		    String from = "meghrajyadav.yadav20@gmail.com";
		    String subject = "CarGarage User Password Reset Request";
		    String messageText = "your Password is:-"+password.get(0).get("user_pass")+"";
		    boolean sessionDebug = false;
		    
		    Properties props = System.getProperties();
		    props.put("mail.smtp.starttls.enable", "true");
		    props.put("mail.smtp.host", host);
		    props.put("mail.smtp.port", "587");
		    props.put("mail.smtp.auth", "true");
		    props.put("mail.smtp.starttls.required", "true");
		    
		    Session mailSession = Session.getDefaultInstance(props, null);
		    mailSession.setDebug(sessionDebug);
		    Message msg = new MimeMessage(mailSession);
		    msg.setFrom(new InternetAddress(from));
		    InternetAddress[] address = { new InternetAddress(to) };
		    msg.setRecipients(Message.RecipientType.TO, address);
		    msg.setSubject(subject);
		    msg.setSentDate(new java.util.Date());
		    msg.setText(messageText);

		    Transport transport = mailSession.getTransport("smtp");
		    transport.connect(host, user, pass);
		    
		    try {
		        transport.sendMessage(msg, msg.getAllRecipients());
		        model.addAttribute("result_pass", 1);
		        
		    } catch (MessagingException e) {
		        out.println("Error sending email: " + e.getMessage());
		    } finally {
		        transport.close();
		    }
		    
		return "send_reset_pass";
	}
	
	
	@RequestMapping("/Logout")
	public String logout()
	{
		return "logout";
	}
	
	
	@RequestMapping("/MyOrder")
	public String myorder()
	{
		return "MyOrder";
	}
	
	

	@RequestMapping("/Delete_Product/{id}")
	public String deleteProduct(@PathVariable int id, HttpServletRequest request)
	{
		request.setAttribute("product_id", id);
		
		return "deleteProduct";
	}
	
	
	@RequestMapping("/Update_Product/{id}")
	public String updateProduct(@PathVariable int id, HttpServletRequest request,Model model)
	{
		request.setAttribute("product_id", id);
		String select_product="select * from product_add where product_id=?";
		Car_Category_Data data=temp.queryForObject(select_product,new Car_Data_RowMapper(),id);
		model.addAttribute("carData", data);
	    
		
		return "updateProduct";
	}
	
	@RequestMapping("/Update_Product_data")
	public String Update_Product_data(HttpServletRequest request)
	{
		
		String update_data="update product_add set product_price=?,product_count=? where product_id=?";
		temp.update(update_data, request.getParameter("product_price"),request.getParameter("product_count"),request.getParameter("product_id"));	    
		
		return "redirect:/AddProduct";
	}
	
	
	@RequestMapping("/cart")
	public String cartProduct()
	{
		
		return "cart";
	}
	
	
	@RequestMapping("/Final_CheckOut")
	public String checkoutPage(HttpSession session,Model model)
	{
		model.addAttribute("user_mail", session.getAttribute("user_mail"));
		return "Final_CheckOut";
	}
	
	
	/*@RequestMapping("/Payment")
	public String paymentPage()
	{
		
		return "Payment";
	}*/
	
	@RequestMapping(value="/Product_Add",method=RequestMethod.POST)
	public String productAdd(@RequestParam("product_image") CommonsMultipartFile file,@RequestParam String product_id,@RequestParam String product_category,@RequestParam String product_name,@RequestParam String product_value,@RequestParam String product_description,@RequestParam String product_count, HttpServletResponse response,HttpServletRequest request)
	{
		String main_path=request.getRealPath("/WEB-INF/view/product_image");
		
		String product_image=file.getOriginalFilename();
		if(product_id !=null && product_name!=null && product_value!=null &&  product_count!=null && product_image!=null) {
			   
		    try {	      
		    	
		   	String add_query="insert into product_add(product_id,product_name,product_price,product_image,product_count,product_category,product_description) values(?,?,?,?,?,?,?)";
		   	int result=temp.update(add_query,product_id,product_name,product_value,product_image,product_count,product_category,product_description);   
		   	
		   	String upload_file_path=main_path+"/"+product_image;
			FileOutputStream fout=new FileOutputStream(upload_file_path);
			InputStream is=file.getInputStream();
		   	byte []data=new byte[is.available()];
		   	is.read(data);
		   	fout.write(data);
		   	fout.flush();
		   	fout.close();
		   	
		      
		   } catch(Exception e) {
		       e.printStackTrace();
		   }
		}
		return "redirect:/AddProduct";
		
	}
}
	
