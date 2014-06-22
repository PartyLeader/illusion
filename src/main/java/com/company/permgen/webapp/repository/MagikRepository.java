package com.company.permgen.webapp.repository;

import com.company.permgen.webapp.model.Magic;
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
public class MagikRepository {

    @Autowired
    protected SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<Magic> getMagic() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Magic")
                .list();
    }

    public void createMagic(Magic item) {
        sessionFactory.getCurrentSession().save(item);
    }
    public void updateMagic(Magic item) {
        sessionFactory.getCurrentSession().update(item) ;
    }
}
