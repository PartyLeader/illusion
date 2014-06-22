package com.company.permgen.webapp.repository;

import com.company.permgen.webapp.model.Size;
import com.company.permgen.webapp.model.State;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 6/19/14
 * Time: 10:28 AM
 * To change this template use File | Settings | File Templates.
 */
@Repository
@Transactional
public class StateRepository {
    @Autowired
    protected SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<State> getState() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM State")
                .list();
    }

    public void createState(State item) {
        sessionFactory.getCurrentSession().save(item);
    }
    public void updateState(State item) {
        sessionFactory.getCurrentSession().update(item) ;
    }
}
