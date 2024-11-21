package com.example.repository;

import com.example.model.MealPlan;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MealPlanRepository extends JpaRepository<MealPlan, Integer> {

	Optional<MealPlan> findById(long mealPlanId);
    // You can add custom queries if needed
}
