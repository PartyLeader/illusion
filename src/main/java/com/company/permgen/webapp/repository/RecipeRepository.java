package com.company.permgen.webapp.repository;

import com.company.permgen.webapp.model.Recipe;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 6/23/14
 * Time: 2:39 AM
 * To change this template use File | Settings | File Templates.
 */

@Repository
@Transactional
public class RecipeRepository {
    @Autowired
    protected SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public List<Recipe> getRecipe() {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Recipe")
                .list();
    }

    public void createRecipe(Recipe item) {
        sessionFactory.getCurrentSession().save(item);
    }
    public void updateRecipe(Recipe item) {
        sessionFactory.getCurrentSession().update(item) ;
    }
}
