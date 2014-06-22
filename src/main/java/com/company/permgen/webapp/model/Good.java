package com.company.permgen.webapp.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 5/3/14
 * Time: 11:11 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "GOOD")
public class Good {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "GOOD_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "GOOD_NAME", nullable = false, length = 255)
    private String name;

    @Column(name = "GOOD_QUALITY", nullable = false)
    private boolean quality;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "GOOD_GOODTYPE", nullable = false)
    private GoodType type;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "good")
    private Set<Warehouse> warehouse = new HashSet<Warehouse>(0);

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "RECIPE_GOOD", joinColumns = {
            @JoinColumn(name = "GOOD_ID", nullable = false, updatable = false) },
            inverseJoinColumns = { @JoinColumn(name = "RECIPE_ID",
                    nullable = false, updatable = false) })
    private Set<Recipe> recipes = new HashSet<Recipe>(0);

    public Good() {
    }

    public Good(int id, String name, boolean quality, GoodType type, Set<Recipe> recipes) {
        this.id = id;
        this.name = name;
        this.quality = quality;
        this.type = type;
        this.recipes = recipes;
    }

    public Set<Warehouse> getWarehouse() {
        return warehouse;
    }

    public void setWarehouse(Set<Warehouse> warehouse) {
        this.warehouse = warehouse;
    }

    public Set<Recipe> getRecipes() {
        return recipes;
    }

    public void setRecipes(Set<Recipe> recipes) {
        this.recipes = recipes;
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

    public boolean getQuality() {
        return quality;
    }

    public void setQuality(boolean quality) {
        this.quality = quality;
    }

    public GoodType getType() {
        return this.type;
    }

    public void setType(GoodType type) {
        this.type = type;
    }
}
