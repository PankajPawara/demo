package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class TotalPurchasesController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/total-purchases")
    public String showTotalPurchases(Model model) {
        String query = "SELECT * FROM my_purchased_plan";
        
        // Fetch data from the database
        List<Map<String, Object>> purchases = jdbcTemplate.queryForList(query);

        // Add purchases data to the model to be accessible in the JSP
        model.addAttribute("purchases", purchases);
        return "TotalPurchases.jsp"; // Points to TotalPurchases.jsp
    }
}
