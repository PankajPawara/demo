package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.example.model.User;
import com.example.service.UserService;

import java.util.Map;

@Controller
public class UserDetailsController {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private UserService userService;

    @GetMapping("/user-details")
    public String getUserDetails(@SessionAttribute(name = "username", required = false) String username, Model model) {
        if (username == null) {
            model.addAttribute("message", "User not logged in.");
            return "error"; // Redirect to an error page if not logged in
        }

        // Query to fetch user details
        String query = "SELECT id, name, mobile, email, CONCAT(city, ', ', district, ', ', state, ', ', pincode) AS address FROM users WHERE email = ? OR mobile = ?";
        try {
            Map<String, Object> userDetails = jdbcTemplate.queryForMap(query, username, username);
            model.addAttribute("userDetails", userDetails);
        } catch (Exception e) {
            model.addAttribute("message", "User data not found.");
        }

        return "UserDetails"; // This refers to UserDetails.jsp
    }

    @GetMapping("/details/{id}")
    public String getUserDetails(@PathVariable("id") int id, Model model) {
        User user = userService.findById(id);
        if (user != null) {
            model.addAttribute("userDetails", user);
        } else {
            model.addAttribute("message", "User not found.");
        }
        return "UserDetails";  // Return the UserDetails.jsp page
    }

    @GetMapping("/edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model) {
        User user = userService.findById(id);
        if (user != null) {
            model.addAttribute("userDetails", user);
        } else {
            model.addAttribute("message", "User not found.");
        }
        return "EditUser";  // Return the edit form JSP
    }

    @PostMapping("/update")
    public String updateUser(@ModelAttribute User user, Model model) {
        try {
            userService.updateUser(user);  // Update the user in the database
            model.addAttribute("message", "User updated successfully.");
        } catch (Exception e) {
            model.addAttribute("message", "Error updating user.");
        }
        return "redirect:/user/details/" + user.getId();  // Redirect back to the user details page
    }
}
