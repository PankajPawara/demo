package com.example.service;

import com.example.model.MealPlan;
import com.example.repository.MealPlanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MealPlanService {

    @Autowired
    private MealPlanRepository mealPlanRepository;
    
    public MealPlan getMealPlanById(int id) {
        return mealPlanRepository.findById(id).orElse(null);
    }
    // Get all meal plans
    public List<MealPlan> getAllMealPlans() {
        return mealPlanRepository.findAll();
    }


    // Save or update a meal plan
    public MealPlan saveMealPlan(MealPlan mealPlan) {
        return mealPlanRepository.save(mealPlan);
    }

    // Delete a meal plan
    public void deleteMealPlan(int id) {
        mealPlanRepository.deleteById( id);
    }
    public void updateMealPlan(MealPlan mealPlan) {
        mealPlanRepository.save(mealPlan);
    }

    public void deleteMealPlanById(int id) {
        mealPlanRepository.deleteById(id);
    }
}
