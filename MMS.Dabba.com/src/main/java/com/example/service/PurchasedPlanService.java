package com.example.service;

import com.example.model.PurchasedPlan;
import com.example.repository.PurchasedPlanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PurchasedPlanService {

    @Autowired
    private PurchasedPlanRepository purchasedPlanRepository;
    
    // Get all purchased plans
    public List<PurchasedPlan> getAllPurchasedPlans() {
        return purchasedPlanRepository.findAll();
    }
    
    public PurchasedPlan savePurchasedPlan(PurchasedPlan purchasedPlan) {
        return purchasedPlanRepository.save(purchasedPlan);
    }
    // Delete a purchased plan
    public void deletePurchasedPlan(int id) {
        purchasedPlanRepository.deleteById(id);
    }

}
