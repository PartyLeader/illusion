package com.company.permgen.webapp.repository;

import com.company.permgen.webapp.model.Fashion;
import com.company.permgen.webapp.model.GoodType;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 6/19/14
 * Time: 12:17 AM
 * To change this template use File | Settings | File Templates.
 */

@Repository
@Transactional
public class FashionRepository {

    @Autowired
    protected SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<Fashion> getFashion() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Fashion")
                .list();
    }

    public void createFashion(Fashion item) {
        sessionFactory.getCurrentSession().save(item);
    }
    public void updateFashion(Fashion item) {
        sessionFactory.getCurrentSession().update(item) ;
    }
}
