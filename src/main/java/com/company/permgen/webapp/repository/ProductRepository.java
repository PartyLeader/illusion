package com.company.permgen.webapp.repository;

import com.company.permgen.webapp.model.Good;
import com.company.permgen.webapp.model.Product;
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
public class ProductRepository {

    @Autowired
    protected SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<Product> getProduct() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Product")
                .list();
    }

    public void createProduct(Product item) {
        sessionFactory.getCurrentSession().save(item);
    }
    public void updateProduct(Product item) {
        sessionFactory.getCurrentSession().update(item) ;
    }
}