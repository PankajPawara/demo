package com.example.controller;

import com.example.model.WeeklyPlan;
import com.example.repository.WeeklyPlanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/weeklyplans")
public class WeeklyPlanController {

	@Autowired
    private WeeklyPlanRepository weeklyPlanRepository;
 

    // Display edit form with data for a specific plan
    @GetMapping("/editWeeklyPlan/{id}")
    public String editWeeklyPlan(@PathVariable int id, Model model) {
        Optional<WeeklyPlan> plan = weeklyPlanRepository.findById(id);
        if (plan.isPresent()) {
            model.addAttribute("mealplan", plan.get());
            return "EditWeeklyPlans"; // Refers to EditWeeklyPlan.jsp
        } else {
            model.addAttribute("errorMessage", "Weekly plan not found.");
            return "redirect:/weeklyplans";
        }
    }

    // Handle form submission to update a plan
    @PostMapping("/UpdateWeeklyPlans")
    public String updateWeeklyPlan(@ModelAttribute WeeklyPlan weeklyPlan, Model model) {
        try {
            weeklyPlanRepository.save(weeklyPlan);
            model.addAttribute("successMessage", "Weekly plan updated successfully.");
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Error updating the weekly plan.");
        }
        return "EditWeeklyPlans"; // Stay on the edit page with messages
    }

}
