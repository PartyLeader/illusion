package com.company.permgen.webapp.repository;

import com.company.permgen.webapp.model.Good;
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
public class GoodRepository {

    @Autowired
    protected SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<Good> getGood() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Good")
                .list();
    }

    public void createGood(Good item) {
        sessionFactory.getCurrentSession().save(item);
    }
    public void updateGood(Good item) {
        sessionFactory.getCurrentSession().update(item) ;
    }
}