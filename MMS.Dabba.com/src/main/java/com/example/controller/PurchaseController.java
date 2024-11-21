package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class PurchaseController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/view-purchases")
    public String viewPurchases(Model model, HttpSession session) {
        // Check if user is logged in
        if (session.getAttribute("username") == null) {
            return "/ULogin";  // Redirect to login page if not logged in
        }

        long mobile = (Long) session.getAttribute("mobileNo");

        // Query to fetch purchased meal plans for the logged-in user
        String query = "SELECT * FROM my_purchased_plan WHERE mobile = ?";
        List<Map<String, Object>> purchases = jdbcTemplate.queryForList(query, new Object[]{mobile});

        // Add purchase data to the model to be accessible in the JSP
        model.addAttribute("purchases", purchases);
        
        return "PurchasedPlans";  // Refers to PurchasedPlans.jsp
    }
    
    @GetMapping("/view-all-purchases")
    public String viewAllPurchases(Model model)
    {
    	String query = "SELECT * FROM my_purchased_plan";
        List<Map<String, Object>> purchases = jdbcTemplate.queryForList(query);

        // Add purchase data to the model to be accessible in the JSP
        model.addAttribute("purchases", purchases);
    	return "PurchasedPlans"; // Refers to PurchasedPlans.jsp
    }
}
