package com.servlet;

import java.io.IOException;
import com.DB.DBConnect;
import com.dao.UserDAO;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            HttpSession session = req.getSession();
            
            // Admin login check
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                // Setting the admin user in the session
                User adminUser = new User();
                adminUser.setRole("admin");
                session.setAttribute("userobj", adminUser);
                // Redirect to admin page
                res.sendRedirect("admin.jsp");

            } else {
                UserDAO dao = new UserDAO(DBConnect.getConn());
                User user = dao.login(email, password);
                
                if (user != null) {
                    session.setAttribute("userobj", user);
                    res.sendRedirect("home.jsp");
                } else {
                    // Use request attribute for error message
                    req.setAttribute("succMsg", "Invalid email or password.");
                    req.getRequestDispatcher("login.jsp").forward(req, res); // Forward back to the login page
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Set an error message in case of exceptions
            req.setAttribute("succMsg", "An error occurred during login.");
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }
}
