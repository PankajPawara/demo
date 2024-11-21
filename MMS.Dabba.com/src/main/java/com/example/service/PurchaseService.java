package com.example.service;

import com.example.model.MealPlan;
import com.example.model.PurchasedPlan;
import com.example.model.User;
import com.example.repository.MealPlanRepository;
import com.example.repository.PurchasedPlanRepository;
import com.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Optional;

@Service
public class PurchaseService {

    @Autowired
    private MealPlanRepository mealPlanRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PurchasedPlanRepository purchasedPlanRepository;

    public String purchaseMealPlan(int mealPlanId, int userId) {
        Optional<MealPlan> mealPlanOpt = mealPlanRepository.findById(mealPlanId);
        Optional<User> userOpt = userRepository.findById(userId);

        if (mealPlanOpt.isPresent() && userOpt.isPresent()) {
            MealPlan mealPlan = mealPlanOpt.get();
            User user = userOpt.get();

            PurchasedPlan purchasedPlan = new PurchasedPlan();
            purchasedPlan.setPlanname(mealPlan.getPlanname());
            purchasedPlan.setPrice(mealPlan.getPrice());
            purchasedPlan.setDays(mealPlan.getDays());
            purchasedPlan.setUsername(user.getName());
            purchasedPlan.setMobile(user.getMobile());
            purchasedPlan.setPurchaseDate(new Timestamp(System.currentTimeMillis()));

            purchasedPlanRepository.save(purchasedPlan);
            return "Meal plan purchased successfully.";
        }
        return "Meal plan or user not found.";
    }
}
