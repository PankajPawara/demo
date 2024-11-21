package com.example.controller;

import com.example.model.User;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/User")
public class UserRegisterController {

    @Autowired
    private UserService userService;

    @PostMapping("/Register")
    public String registerUser(@RequestParam("fullname") String name,
                               @RequestParam("mobileno") long mobile,
                               @RequestParam("emailaddress") String email,
                               @RequestParam("pass") String password,
                               @RequestParam("cpass") String confirmPassword,
                               @RequestParam("city") String city,
                               @RequestParam("district") String district,
                               @RequestParam("state") String state,
                               @RequestParam("pincode") int pincode,
                               Model model) {

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match. Please try again.");
            return "/URegister";
        }

        // Create a new User object and save it
        User user = new User();
        user.setName(name);
        user.setMobile(mobile);
        user.setEmail(email);
        user.setPassword(password);
        user.setCity(city);
        user.setDistrict(district);
        user.setState(state);
        user.setPincode(pincode);

        boolean isRegistered = userService.registerUser(user);

        if (isRegistered) {
            model.addAttribute("success", "Registration successful! Please login.");
            return "/URegister"; // Stay on URegister page after successful registration
        } else {
            model.addAttribute("error", "Registration failed. Please try again.");
            return "/URegister";
        }
    }
}
