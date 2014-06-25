package com.company.permgen.webapp.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Ski3fter on 01.05.14.
 */
@Entity
@Table(name = "RECIPE")
public class Recipe {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "RECIPE_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "RECIPE_NAME", nullable = false, length = 255)
    private String name;

    @Column(name = "RECIPE_SPECIFICATION", nullable = false, length = 255)
    private String specification;


    @Column(name = "RECIPE_GOOD", nullable = false)
    private int goods;

    public Recipe() {
    }

    public Recipe(String name, String specification) {
        this.name = name;
        this.specification = specification;
    }

    public Recipe(int id, String name, String specification, int goods) {
        this.id = id;
        this.name = name;
        this.specification = specification;
        this.goods = goods;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public int getGoods() {
        return goods;
    }

    public void setGoods(int goods) {
        this.goods = goods;
    }
}
