package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.model.User;
import com.example.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    // Fetch user data by ID for editing
    @GetMapping("/edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model) {
        User user = userService.findById(id); // Find the user by ID
        if (user != null) {
            model.addAttribute("user", user); // Add user to the model
            return "EditUser"; // Return EditUser.jsp page
        }
        model.addAttribute("message", "User not found");
        return "UserDetails"; // Redirect to UserDetails.jsp if user not found
    }
    @GetMapping("/Delete-user")
    public String deleteUser(@RequestParam("id") int id, RedirectAttributes redirectAttributes) {
        try {
            userService.deleteUserById(id);
            redirectAttributes.addFlashAttribute("message", "User deleted successfully.");
            redirectAttributes.addFlashAttribute("messageType", "success");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Error deleting user.");
            redirectAttributes.addFlashAttribute("messageType", "error");
        }
        return "ADashboard"; // Return ADashboard.jsp page
    }
    // Save updated user data
    @PostMapping("/update")
    public String updateUser(@ModelAttribute("user") User user, Model model) {
        try {
            userService.save(user); // Save the updated user
            model.addAttribute("successMessage", "User details updated successfully");
            System.out.println(user);
            return "EditUser"; // Stay on EditUser.jsp page after successful update
        } catch (Exception e) {
        	e.printStackTrace();
            model.addAttribute("errorMessage", "Error updating user details");
            return "EditUser"; // Stay on EditUser.jsp if error occurs
        }
    }
}
