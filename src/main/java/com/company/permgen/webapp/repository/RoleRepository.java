package com.company.permgen.webapp.repository;

import com.company.permgen.webapp.model.Role;
import com.company.permgen.webapp.model.Size;
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
public class RoleRepository {

    @Autowired
    protected SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<Role> getRole() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Role")
                .list();
    }

    public void createRole(Role role) {
        sessionFactory.getCurrentSession().save(role);
    }
    public void updateRole(Role role) {
        sessionFactory.getCurrentSession().update(role) ;
    }
}
