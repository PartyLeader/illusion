package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.Order;
import com.company.permgen.webapp.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Request: Ski3fter
 * Date: 22.12.13
 * Time: 23:20
 * To change this template use File | Settings | File Templates.
 */
@Service
public class OrderService {

    @Autowired
    protected OrderRepository repository;

    public List<Order> getOrder() {
        return repository.getOrder();
    }

    public void createOrder(Order order) {
        repository.createOrder(order);
    }
    public void updateOrder(Order order) {
        repository.updateOrder(order);
    }

    public List<Order> getOrder(int id) {
        return repository.getOrder(id);
    }

    public void removeOrder(int id)
    {
        repository.removeOrder(id);
    }

    public List<Order> getOrders(int requestId) {
        return repository.getOrders(requestId);
    }
    public List<Order> getOrders()
    {
        return repository.getOrders();
    }
}
