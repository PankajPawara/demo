package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class UserListController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/user-list")
    public String showUserList(Model model) {
        String query = "SELECT * FROM users";
        
        // Fetch user data from the database
        List<Map<String, Object>> users = jdbcTemplate.queryForList(query);

        // Add users to the model to be accessible in the JSP
        model.addAttribute("users", users);
        return "/UserList"; // Points to UserList.jsp
    }
}
