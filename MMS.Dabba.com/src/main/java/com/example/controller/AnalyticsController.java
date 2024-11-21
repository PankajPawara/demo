package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AnalyticsController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/Analysis")
    public String showDashboard(Model model) {
        try {
            // Fetch user count
            int userCount = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM users", Integer.class);

            // Fetch meal plan count
            int mealPlanCount = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM mealplan", Integer.class);

            // Fetch purchased plans count
            int purchasedPlanCount = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM my_purchased_plan", Integer.class);

            // Fetch weekly plans count
            int weeklyPlanCount = jdbcTemplate.queryForObject("SELECT COUNT(*) FROM weeklyplan", Integer.class);

            // Add data to the model
            model.addAttribute("userCount", userCount);
            model.addAttribute("mealPlanCount", mealPlanCount);
            model.addAttribute("purchasedPlanCount", purchasedPlanCount);
            model.addAttribute("weeklyPlanCount", weeklyPlanCount);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Error retrieving data from the database.");
        }
        return "Analytics"; // Points to the Analytics.jsp file
    }
}
