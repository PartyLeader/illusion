package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.Recipe;
import com.company.permgen.webapp.repository.RecipeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 6/23/14
 * Time: 2:37 AM
 * To change this template use File | Settings | File Templates.
 */
@Service
public class RecipeService {
    @Autowired
    protected RecipeRepository repository;

    public List<Recipe> getRecipe() {
        return repository.getRecipe();
    }
    public void createRecipe(Recipe item) {
        repository.createRecipe(item);
    }
    public void updateRecipe(Recipe item) {
        repository.updateRecipe(item);
    }
}
