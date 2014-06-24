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

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "recipe")
    private Set<Order> order = new HashSet<Order>(0);

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "RECIPE_GOOD", joinColumns = {
            @JoinColumn(name = "RECIPE_ID", nullable = false, updatable = false) },
            inverseJoinColumns = { @JoinColumn(name = "GOOD_ID",
                    nullable = false, updatable = false) })
    private Set<Good> goods = new HashSet<Good>(0);

    public Recipe() {
    }

    public Recipe(String name, String specification) {
        this.name = name;
        this.specification = specification;
    }

    public Recipe(int id, String name, String specification, Set<Order> order, Set<Good> goods) {
        this.id = id;
        this.name = name;
        this.specification = specification;
        this.order = order;
        this.goods = goods;
    }

    public Set<Good> getGoods() {
        return this.goods;
    }

    public Set<Order> getOrder() {
        return order;
    }

    public void setOrder(Set<Order> order) {
        this.order = order;
    }

    public void setGoods(Set<Good> goods) {
        this.goods = goods;
    }
    public Recipe(int id, String name, String specification) {
        this.id = id;
        this.name = name;
        this.specification = specification;
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
}
