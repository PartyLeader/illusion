package com.company.permgen.webapp.repository;

/**
 * Created with IntelliJ IDEA.
 * Request: Ski3fter
 * Date: 22.12.13
 * Time: 23:21
 * To change this template use File | Settings | File Templates.
 */
import com.company.permgen.webapp.model.Request;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Random;

@Repository
@Transactional
public class RequestRepository {

    @Autowired
    protected SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<Request> getRequests() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Request b")
                .list();
    }

    @SuppressWarnings("unchecked")
    public List<Request> getRequests(String urgency) {

        Query query = sessionFactory.getCurrentSession().createSQLQuery("select * from Request where urgency like :urgency").addEntity(Request.class);
        return  query.setString("urgency", ""+urgency+"%").list();

    }
    @SuppressWarnings("unchecked")
    public List<Request> getRequests(int id) {
        Query query = sessionFactory.getCurrentSession().createSQLQuery("select * from Request where id = :id").addEntity(Request.class);
        return  query.setString("id", id+"").list();
    }

    public void createRequest(Request request) {
        Random ran = new Random();
        int x = ran.nextInt(3);
        switch (x)
        {
            case 0:{
                request.setUrgency("Низкий");
                break;
            }
            case 1:{
                request.setUrgency("Средний");
                break;
            }
            case 2:{
                request.setUrgency("Высокий");
                break;
            }
        }

        sessionFactory.getCurrentSession().save(request);
    }

    public void removeRequest(int id){
        Request request = (Request) sessionFactory.getCurrentSession().load(Request.class, id);
        if(request != null)
        {
            sessionFactory.getCurrentSession().delete(request);
        }
    }
    public List<String> getUrgency()
    {
        List<String> list = sessionFactory.getCurrentSession().createSQLQuery("select DISTINCT urgency from Request").list();
        return list;
    }
}
