package com.company.permgen.webapp.repository;

/**
 * Created with IntelliJ IDEA.
 * User: Ski3fter
 * Date: 22.12.13
 * Time: 23:21
 * To change this template use File | Settings | File Templates.
 */
import com.company.permgen.webapp.model.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class UserRepository {

    @Autowired
    protected SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<User> getUsers() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM User b")
                .list();
    }

    @SuppressWarnings("unchecked")
    public List<User> getUsers(String name) {

        Query query = sessionFactory.getCurrentSession().createSQLQuery("select * from User where name like :name").addEntity(User.class);
        return  query.setString("name", ""+name+"%").list();

    }

    public void createUser(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

}
