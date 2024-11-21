package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.example.service.AdminService;

@Controller
public class ALoginController {

    @Autowired
    private AdminService adminService;

    @PostMapping("/Alogin")
    public String loginAdmin(@RequestParam("username") String username,
                                   @RequestParam("password") String password,
                                   Model model) {
        boolean isValid = adminService.validateAdminLogin(username, password);
        
        if (isValid) {
            // Redirect to ADashboard page if login is successful
            return "ADashboard"; 
        } else {
            // Set error message to show on the login page
            model.addAttribute("error", "Login failed. Please try again.");
            return "ALogin";
        }
    }
}
