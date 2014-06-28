package com.company.permgen.webapp.repository;

/**
 * Created with IntelliJ IDEA.
 * Request: Ski3fter
 * Date: 22.12.13
 * Time: 23:21
 * To change this template use File | Settings | File Templates.
 */
import com.company.permgen.webapp.model.Order;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Random;

@Repository
@Transactional
public class OrderRepository {

    @Autowired
    protected SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<Order> getOrder() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Order b")
                .list();
    }

    @SuppressWarnings("unchecked")
    public List<Order> getOrder(int id) {
        Query query = sessionFactory.getCurrentSession().createSQLQuery("select * from Order where id = :id").addEntity(Order.class);
        return  query.setString("id", id+"").list();
    }

    public void createOrder(Order order) {
        try{
        sessionFactory.getCurrentSession().save(order);
        sessionFactory.getCurrentSession().flush();
        }
        catch (Exception ex){


        }
    }
    public void updateOrder(Order order) {
        sessionFactory.getCurrentSession().update(order) ;
    }

    public void removeOrder(int id){
        Order order = (Order) sessionFactory.getCurrentSession().load(Order.class, id);
        if(order != null)
        {
            sessionFactory.getCurrentSession().delete(order);
        }
    }

    //change flag "block" unblock/block order
    public void blockOrder(int id){
        Order order = (Order) sessionFactory.getCurrentSession().load(Order.class, id);
        order.setBlock(order.getBlock() == 0 ? 1 : 0);
        updateOrder(order);

    }

    //change state to first state of the "In Progress": "Collecting nettles (VAHNTANG STATE)"
    public void startOrder(int id){
        Order order = (Order) sessionFactory.getCurrentSession().load(Order.class, id);
        order.setState(2);
        updateOrder(order);
    }

    //change state to "handle order"
    public void stayHandler(int id){
        Order order = (Order) sessionFactory.getCurrentSession().load(Order.class, id);
        order.setState(order.getState() == 0 ? 1 : 1);
        updateOrder(order);
    }

    public List<Order> getOrders(int requestId) {
        Query query = sessionFactory.getCurrentSession().createQuery("FROM Order b WHERE id = :requestId");
       // Query query = sessionFactory.getCurrentSession().createSQLQuery("select * from Order where id = :requestId").addEntity(Order.class);
        return  query.setString("requestId", requestId+"").list();
    }

    public List<Order> getOrders() {
        return sessionFactory.getCurrentSession()
        .createQuery("FROM Order b")
        .list();
    }
}
