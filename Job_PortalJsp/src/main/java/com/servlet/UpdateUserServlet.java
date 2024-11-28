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

@WebServlet("/update_profile")
public class UpdateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Parse ID as integer
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String qua = req.getParameter("qua");
            String email = req.getParameter("email");
            String ps = req.getParameter("ps");
            String contact = req.getParameter("con"); // Treat contact as String

            // Instantiate DAO and create User object
            UserDAO dao = new UserDAO(DBConnect.getConn());
            User u = new User();
            u.setId(id);
            u.setName(name);
            u.setQualification(qua);
            u.setEmail(email);
            u.setPassword(ps);
            u.setContact(contact); // Directly set contact as String

            // Attempt to update user
            boolean f = dao.updateUser(u);

            // Set session attribute for success or failure message
            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succMsg", "Profile Updated Successfully");
            } else {
                session.setAttribute("succMsg", "Something went wrong on server");
            }
            resp.sendRedirect("home.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
