package com.servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.JobDAO;
import com.dao.UserDAO;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			String name=  req.getParameter("name");
			String qua=  req.getParameter("qua");		
			String con=req.getParameter("con");
			String email=  req.getParameter("email");
			String ps=  req.getParameter("ps");
			
			UserDAO dao = new UserDAO(DBConnect.getConn());
			
			User u = new User(name,qua,con,email,ps,"user");
			boolean f=dao.addUser(u);

			HttpSession session= req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Registtration Sucessfull");
				resp.sendRedirect("signup.jsp");
			}
			else {
				session.setAttribute("succMsg", "Something went wrong");
				resp.sendRedirect("signup.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
}
}
