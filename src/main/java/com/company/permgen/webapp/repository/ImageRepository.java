package com.company.permgen.webapp.repository;

import com.company.permgen.webapp.model.Image;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 6/26/14
 * Time: 12:42 AM
 * To change this template use File | Settings | File Templates.
 */
@Repository
@Transactional
public class ImageRepository {
    @Autowired
    protected SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<Image> getImage() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Image")
                .list();
    }

    public void createImage(Image item) {
        sessionFactory.getCurrentSession().save(item);
    }
    public void updateImage(Image item) {
        sessionFactory.getCurrentSession().update(item) ;
    }
}
