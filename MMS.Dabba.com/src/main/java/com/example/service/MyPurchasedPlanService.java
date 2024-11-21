package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.MyPurchasedPlan;
import com.example.repository.MyPurchasedPlanRepository;

@Service
public class MyPurchasedPlanService {

    @Autowired
    private MyPurchasedPlanRepository myPurchasedPlanRepository;

    public void savePurchasedPlan(MyPurchasedPlan purchase) {
        myPurchasedPlanRepository.save(purchase);
    }
}