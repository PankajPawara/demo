package com.example.controller;

import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.servlet.http.HttpSession;

@Controller
public class ULoginController {

    @Autowired
    private UserService userService;

    @PostMapping("/User/ULogin")
    public String loginUser(@RequestParam("username") String username,
                            @RequestParam("password") String password,
                            Model model,
                            HttpSession session) {
        
        // Validate login credentials
        boolean isValid = userService.validateUserLogin(username, password);
        
        if (isValid) {
            // Store username in session
            session.setAttribute("username", username);
            // Redirect to the UserDetails page after successful login
            return "/UDashboard";
        } else {
            // Add error message to model
            model.addAttribute("error", "Login failed. Please try again.");
            return "/ULogin"; // Return to the login page with an error message
        }
    }
}
