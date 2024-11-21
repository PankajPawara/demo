package com.example.service;

import com.example.model.WeeklyPlan;
import com.example.repository.WeeklyPlanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class WeeklyPlanService {

    @Autowired
    private WeeklyPlanRepository weeklyPlanRepository;

 // Method to get the weekly plan by its ID
    public WeeklyPlan getWeeklyPlanById(int id) {
        return weeklyPlanRepository.findById(id).orElse(null);
    }

    // Method to update the weekly plan in the database
    public void updateWeeklyPlan(WeeklyPlan plan) {
        weeklyPlanRepository.save(plan);
    }
    // Get all weekly plans
    public List<WeeklyPlan> getAllWeeklyPlans() {
        return weeklyPlanRepository.findAll();
    }

    // Save a weekly plan
    public WeeklyPlan saveWeeklyPlan(WeeklyPlan weeklyPlan) {
        return weeklyPlanRepository.save(weeklyPlan);
    }

    // Delete a weekly plan
    public void deleteWeeklyPlan(int id) {
        weeklyPlanRepository.deleteById(id);
    }
}
