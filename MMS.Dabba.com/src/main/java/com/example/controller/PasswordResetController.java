package com.example.controller;

import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PasswordResetController {

    @Autowired
    private UserService userService;

    @PostMapping("/ResetPassword")
    public String resetPassword(@RequestParam("username") String username,
                                @RequestParam("newpassword") String newPassword,
                                @RequestParam("confirmpassword") String confirmPassword,
                                Model model) {

        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match. Please try again.");
            return "/ForgetPass"; // Return to the reset page with an error message
        }

        boolean isPasswordReset = userService.resetPassword(username, newPassword);

        if (isPasswordReset) {
            model.addAttribute("success", "Password reset successfully! You can now log in.");
            return "/ForgetPass"; // Return to the reset page with an success message
        } else {
            model.addAttribute("error", "User not found. Please try again.");
            return "/ForgetPass"; // Return to the reset page with an error message
        }
    }
}
