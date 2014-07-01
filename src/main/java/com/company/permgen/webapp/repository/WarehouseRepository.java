package com.company.permgen.webapp.repository;

import com.company.permgen.webapp.model.Warehouse;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by 802140 on 01.07.2014.
 */
@Repository
@Transactional
public class WarehouseRepository {
    @Autowired
    protected SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<Warehouse> getWarehouse() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Warehouse")
                .list();
    }
    public void changeCount(int newCount,int goodId){
        Query query = sessionFactory.getCurrentSession().createQuery("FROM Warehouse b WHERE good = :goodId");
        List<Warehouse> house =  query.setString("goodId", goodId+"").list();
        Warehouse newValue = house.get(0);
        newValue.setCount(newCount);
        updateWarehouse(newValue);
    };
    public void createWarehouse(Warehouse item) {
        sessionFactory.getCurrentSession().save(item);
    }
    public void updateWarehouse(Warehouse item) {
        sessionFactory.getCurrentSession().update(item) ;
    }
}
