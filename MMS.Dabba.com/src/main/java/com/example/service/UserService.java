package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.example.model.MealPlan;
import com.example.model.MyPurchasedPlan;
import com.example.model.User;
import com.example.repository.MealPlanRepository;
import com.example.repository.MyPurchasedPlanRepository;
import com.example.repository.UserRepository;

import jakarta.servlet.http.HttpSession;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;


@Service
public class UserService {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    @Autowired
    private HttpSession httpSession; // Injecting HttpSession
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private MealPlanRepository mealPlanRepository;
    
    @Autowired
    private MyPurchasedPlanRepository myPurchasedPlanRepository;
    public boolean validateUserLogin(String username, String password) {
    	try {
            boolean isEmail = username.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
            String query = isEmail 
                ? "SELECT id, name, mobile FROM users WHERE email = ? AND password = ?" 
                : "SELECT id, name, mobile FROM users WHERE mobile = ? AND password = ?";

            Map<String, Object> result = jdbcTemplate.queryForMap(query, username, password);

            if (result != null && !result.isEmpty()) {
                // Retrieve user details
                Integer userId = (Integer) result.get("id");
                String name = (String) result.get("name");
                long mobile = (Long) result.get("mobile");
                // Store in session attributes
                httpSession.setAttribute("userId", userId);
                httpSession.setAttribute("userName", name);
                httpSession.setAttribute("mobileNo", mobile);

                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean registerUser(User users) {
        try {
            userRepository.save(users);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public User findUserByUsername(String username) {
    	String query;
        User currentUser;

        if (username.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            query = "SELECT * FROM users WHERE email = ?";
            currentUser = jdbcTemplate.queryForObject(query, new Object[]{username}, this::mapUserFromResultSet);
        } else {
            query = "SELECT * FROM users WHERE mobile = ?";
            currentUser = jdbcTemplate.queryForObject(query, new Object[]{username}, this::mapUserFromResultSet);
        }

        // Store user details in session
        if (currentUser != null) {
        }
        System.out.println("Checking.."+currentUser.getName());
        return currentUser;
    }
    private User mapUserFromResultSet(ResultSet rs, int rowNum) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setName(rs.getString("name"));
        user.setMobile(rs.getLong("mobile"));
        return user;
    }
    
    public MealPlan getMealPlanById(Long planId) {
        return mealPlanRepository.findById(planId).orElse(null);
    }

    public void purchaseMealPlan(String username, Long mealPlanId) {
        User user = findUserByUsername(username);
        MealPlan mealPlan = getMealPlanById(mealPlanId);

        if (user != null && mealPlan != null) {
            MyPurchasedPlan purchasedPlan = new MyPurchasedPlan();
            purchasedPlan.setUsername(user.getName());
            purchasedPlan.setPlanname(mealPlan.getPlanname());
            purchasedPlan.setPrice(mealPlan.getPrice());
            purchasedPlan.setDays(mealPlan.getDays());
            purchasedPlan.setMobile(user.getMobile());

            // Save to mypurchasedplan table
            myPurchasedPlanRepository.save(purchasedPlan);

            // Log the data in the console
            System.out.println("User: " + user.getName() + ", Mobile: " + user.getMobile());
            System.out.println("Purchased Plan: " + mealPlan.getPlanname() + ", Days: " + mealPlan.getDays() + ", Price: " + mealPlan.getPrice());
        }
    }
    public boolean resetPassword(String username, String newPassword) {
        String query = username.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")
                ? "UPDATE users SET password = ? WHERE email = ?"
                : "UPDATE users SET password = ? WHERE mobile = ?";

        int rowsAffected = jdbcTemplate.update(query, newPassword, username);
        return rowsAffected > 0;
    }
    
    public void deleteUserById(int userId) {
        try {
            userRepository.deleteById(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public User getUserById(int userId) {
        return userRepository.findById(userId).orElse(null);
    }
    
    public User findById(int id) {
        return userRepository.findById(id).orElse(null);
    }

    public void updateUser(User user) {
        userRepository.save(user);  // Save the updated user back to the database
    }
    
    public void save(User user) {
        userRepository.save(user); // Save user to the database
    }
}
