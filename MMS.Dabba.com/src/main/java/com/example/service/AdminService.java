package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class AdminService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public boolean validateAdminLogin(String username, String password) {
        
    	// Determine if input is email or mobile based on regex
        boolean isEmail = username.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
       
        if(isEmail) {
        	// Query to check admin by email
	        String queryByEmail = "SELECT name FROM admin WHERE email = ? AND password = ?";
	        
	        try {
	            // Check for email login
	            String result = jdbcTemplate.queryForObject(queryByEmail, new Object[]{username, password}, String.class);
	            return result != null;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
        }
        else {

        	long mobile=Long.parseLong(username);
	    	// Query to check admin by mobile
	        String queryByMobile = "SELECT name FROM admin WHERE mobile = ? AND password = ?";
	        
	        try {
	            // Check for mobile login
	            String result = jdbcTemplate.queryForObject(queryByMobile, new Object[]{mobile, password}, String.class);
	            if (result != null) {
	                return true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
        }
        return false; // Invalid login
    }
}