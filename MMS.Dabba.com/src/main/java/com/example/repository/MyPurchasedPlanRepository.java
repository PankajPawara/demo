package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.MyPurchasedPlan;

@Repository
public interface MyPurchasedPlanRepository extends JpaRepository<MyPurchasedPlan, Integer> {
}
