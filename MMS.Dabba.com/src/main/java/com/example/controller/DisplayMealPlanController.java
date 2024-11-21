package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class DisplayMealPlanController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/display-meal-plans")
    public String displayMealPlans(Model model) {
        String query = "SELECT * FROM mealplan";

        // Fetch data from the database
        List<Map<String, Object>> mealPlans = jdbcTemplate.queryForList(query);

        // Add mealPlans data to the model to be accessible in the JSP
        model.addAttribute("mealPlans", mealPlans);
        return "DisplayMealPlans"; // Points to DisplayMealPlans.jsp
    }
    
    @GetMapping("/buy-meal-plans")
    public String buyMealPlans(Model model) {
        String query = "SELECT * FROM mealplan";

        // Fetch data from the database
        List<Map<String, Object>> mealPlans = jdbcTemplate.queryForList(query);

        // Add mealPlans data to the model to be accessible in the JSP
        model.addAttribute("mealPlans", mealPlans);
        return "BuyMealPlan"; // Points to BuyMealPlan.jsp
    }
}
