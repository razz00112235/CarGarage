package Ecommerce;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/UpdateCart")
public class UpdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter write=response.getWriter();
		response.setContentType("text/html");
		String id = request.getParameter("id");
		String map_key = request.getParameter("key");
		String map_value = request.getParameter("value");
		String product_price=request.getParameter("product_price");
		
		id = id.trim();
		HttpSession session=request.getSession();
        Map<String, HashMap<String, String>> cart2 = (Map<String, HashMap<String, String>>) session.getAttribute("cart");
        for (Map.Entry<String, HashMap<String, String>> entry : cart2.entrySet()) {
            String productId = entry.getKey();
            HashMap<String, String> productDetails = entry.getValue();
            
            if(Integer.parseInt(map_value)==0)
            {
            	
            	cart2.remove(id);
            	
            }
            if(productId.equals(id))
            {
            	productDetails.put(map_key, map_value);
            	productDetails.put("product_price", product_price);
            }
            
            
        }
        session.setAttribute("cart", cart2);
        
        for (Map.Entry<String, HashMap<String, String>> entry : cart2.entrySet()) {
            String productId = entry.getKey();
            HashMap<String, String> productDetails = entry.getValue();
            
        }
    }

}
