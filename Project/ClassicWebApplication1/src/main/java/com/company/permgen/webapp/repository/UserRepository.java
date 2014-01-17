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
import java.util.Random;

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
    public List<User> getUsers(String urgency) {

        Query query = sessionFactory.getCurrentSession().createSQLQuery("select * from User where urgency like :urgency").addEntity(User.class);
        return  query.setString("urgency", ""+urgency+"%").list();

    }
    @SuppressWarnings("unchecked")
    public List<User> getUsers(int id) {
        Query query = sessionFactory.getCurrentSession().createSQLQuery("select * from User where id = :id").addEntity(User.class);
        return  query.setString("id", id+"").list();
    }

    public void createUser(User user) {
        Random ran = new Random();
        int x = ran.nextInt(3);
        switch (x)
        {
            case 0:{user.setUrgency("Низкий");
                break;
            }
            case 1:{user.setUrgency("Средний");
                break;
            }
            case 2:{user.setUrgency("Высокий");
                break;
            }
        }

        sessionFactory.getCurrentSession().save(user);
    }

    public void removeUser(int id){
        User user = (User) sessionFactory.getCurrentSession().load(User.class, id);
        if(user != null)
        {
            sessionFactory.getCurrentSession().delete(user);
        }
    }
    public List<String> getUrgency()
    {
        List<String> list = sessionFactory.getCurrentSession().createSQLQuery("select urgency from User").list();
        return list;
    }
}
