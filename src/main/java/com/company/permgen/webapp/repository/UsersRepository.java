package com.company.permgen.webapp.repository;

import com.company.permgen.webapp.model.Role;
import com.company.permgen.webapp.model.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Ski3fter on 23.06.14.
 */
@Repository
@Transactional
public class UsersRepository {
    @Autowired
    protected SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<User> getUsers() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM User")
                .list();
    }

    public List<User> getUsersCustomers() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM User where role='3'")
                .list();
    }

    public  List<User> getUser(String userName)
    {
        Query query = sessionFactory.getCurrentSession().createSQLQuery("select * from USER_AUTHENTICATION where email LIKE :userName").addEntity(User.class);
        return  query.setString("userName", userName + "").list();
    }

    public void createUser(User item) {
        sessionFactory.getCurrentSession().save(item);
    }

    public void createUserAuth(Role item) {
        sessionFactory.getCurrentSession().save(item);
    }

    public void updateUser(User item) {
        sessionFactory.getCurrentSession().update(item) ;
    }

}
