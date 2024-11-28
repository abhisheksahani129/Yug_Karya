package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {
	
	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn=conn;
	}
	
public boolean addUser(User u) {
	    boolean f = false;
	    try {
	        String sql = "INSERT INTO user(name, qualification, contact, email, password, role) VALUES (?, ?, ?, ?, ?, ?)";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        
	        ps.setString(1, u.getName());
	        ps.setString(2, u.getQualification());
	        ps.setString(3, u.getContact());
	        ps.setString(4, u.getEmail());
	        ps.setString(5, u.getPassword());
	        ps.setString(6, u.getRole()); // Pass role dynamically
	        
	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f;
	}
	

	//for login after registration , validation 
	
	 // Method for login after registration, validation
public User login(String em, String psw) {
        User u = null;
        try {
            String sql = "SELECT * FROM user WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql); // Renamed to 'ps'
            ps.setString(1, em);
            ps.setString(2, psw);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setQualification(rs.getString(3));
                u.setContact(rs.getString(4));
                u.setEmail(rs.getString(5));
                u.setPassword(rs.getString(6));
                u.setRole(rs.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return u; // Return the user object if found, otherwise null
    }


// Method for updating the user information
public boolean updateUser(User u) {
    boolean f = false;
    try {
        String sql = "UPDATE user SET name=?, qualification=?, contact=?, email=?, password=? WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, u.getName());
        ps.setString(2, u.getQualification());
        ps.setString(3, u.getContact());
        ps.setString(4, u.getEmail());
        ps.setString(5, u.getPassword());
        ps.setInt(6, u.getId());

        int i = ps.executeUpdate();
        if (i == 1) {
            f = true;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return f;
}
}
    
