package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class DisplayWeeklyPlanController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/display-weekly-plans")
    public String displayWeeklyPlans(Model model) {
        String query = "SELECT * FROM weeklyplan";

        // Fetch data from the database
        List<Map<String, Object>> weeklyPlans = jdbcTemplate.queryForList(query);

        // Add weeklyPlans data to the model to be accessible in the JSP
        model.addAttribute("weeklyPlans", weeklyPlans);
        return "DisplayWeeklyPlans"; // Points to DisplayWeeklyPlans.jsp
    }
    
    @GetMapping("/display-weekly-plans-only")
    public String displayWeeklyPlansonly(Model model) {
        String query = "SELECT * FROM weeklyplan";

        // Fetch data from the database
        List<Map<String, Object>> weeklyPlans = jdbcTemplate.queryForList(query);

        // Add weeklyPlans data to the model to be accessible in the JSP
        model.addAttribute("weeklyPlans", weeklyPlans);
        return "ViewMyWeeklyPlan"; // Points to ViewMyWeeklyPlan.jsp
    }
}
