package com.example.controller;

import com.example.model.MealPlan;
import com.example.model.MyPurchasedPlan;
import com.example.model.User;
import com.example.service.MealPlanService;
import com.example.service.MyPurchasedPlanService;
import com.example.service.PurchaseService;
import com.example.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class MealPlanController {

    @Autowired
    private MealPlanService mealPlanService;

    @Autowired
    private UserService userService;
    
    // Display all meal plans
    @GetMapping
    public String displayMealPlans(Model model) {
        List<MealPlan> mealPlans = mealPlanService.getAllMealPlans();
        model.addAttribute("mealPlans", mealPlans);
        return "DisplayMealPlans"; // Corresponds to DisplayMealPlans.jsp
    }
    
    @GetMapping("/BuyMealPlans")
    public String buyMealPlan(@RequestParam("id") Long mealPlanId, @SessionAttribute(name="username") String username) {
        userService.purchaseMealPlan(username, mealPlanId);
        return "redirect:/UDashboard.jsp"; // Corresponds to UDashboard.jsp
    }

    
 // Show meal plans list
    @GetMapping("/mealplans")
    public String listMealPlans(Model model) {
        model.addAttribute("mealPlans", mealPlanService.getAllMealPlans());
        return "EditMealPlan"; // Corresponds to ADashboard.jsp
    }

    // Show add meal plan form
    @GetMapping("/add")
    public String showAddMealPlanForm(Model model) {
        model.addAttribute("mealPlan", new MealPlan());
        return "AddMealPlan"; // Corresponds to AddMealPlan.jsp
    }

    // Handle adding meal plan
    @PostMapping("/add")
    public String addMealPlan(@ModelAttribute MealPlan mealPlan, RedirectAttributes redirectAttributes) {
        try {
            mealPlanService.saveMealPlan(mealPlan);
            redirectAttributes.addFlashAttribute("success", "Meal plan added successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error adding meal plan.");
        }
        return "redirect:/add";
    }
    
    // Show edit form
    @GetMapping("/edit-mealplan/{id}")
    public String showEditForm(@PathVariable int id, Model model, RedirectAttributes redirectAttributes) {
        try {
            MealPlan mealPlan = mealPlanService.getMealPlanById(id);
            model.addAttribute("mealplan", mealPlan);
            return "EditMealPlan"; // Corresponds to EditMealPlan.jsp
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Meal plan not found.");
            return "redirect:/mealplans";
        }
    }

    // Handle update
    @PostMapping("/update-mealplan")
    public String updateMealPlan(@ModelAttribute MealPlan mealPlan, RedirectAttributes redirectAttributes) {
        try {
            mealPlanService.updateMealPlan(mealPlan);
            redirectAttributes.addFlashAttribute("success", "Meal plan updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error updating meal plan.");
        }
        return "redirect:/mealplans";
    }

    // Delete meal plan
    @GetMapping("/delete-mealplan/{id}")
    public String deleteMealPlan(@PathVariable int id, RedirectAttributes redirectAttributes) {
        try {
            mealPlanService.deleteMealPlanById(id);
            redirectAttributes.addAttribute("success", "Meal plan deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addAttribute("error", "Error deleting meal plan.");
        }
        return "/ADashboard";
    }
}

    

