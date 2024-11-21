package com.example.repository;

import com.example.model.PurchasedPlan;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PurchasedPlanRepository extends JpaRepository<PurchasedPlan, Integer> {
}
