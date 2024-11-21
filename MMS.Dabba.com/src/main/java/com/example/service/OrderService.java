package com.example.service;

import com.example.model.Order;
import com.example.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    // Get all orders
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    // Get order by ID
    public Optional<Order> getOrderById(int id) {
        return orderRepository.findById(id);
    }

    // Save or update an order
    public Order saveOrder(Order order) {
        return orderRepository.save(order);
    }

    // Delete an order
    public void deleteOrder(int id) {
        orderRepository.deleteById(id);
    }
}
