package com.company.permgen.webapp.model;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 1/19/14
 * Time: 2:18 AM
 * To change this template use File | Settings | File Templates.
 */

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;


@Entity
@Table(name = "ORDER2")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ORDER_ID", unique = true, nullable = false)
    private int id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ORDER_FASHION", nullable = false)
    private Fashion fashion;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ORDER_SIZE", nullable = false)
    private Size size;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ORDER_USER", nullable = false)
    private Size user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ORDER_STATE", nullable = false)
    private State state;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ORDER_RECIPE", nullable = false)
    private Recipe recipe;

    @Column(name = "ORDER_GEN",nullable = false, length = 255)
    private String gen;

    @Column(name = "ORDER_CREATEDATE",nullable = true, length = 255)
    private String createdate;

    @Column(name = "ORDER_ENDDATE",nullable = true, length = 255)
    private String enddate;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "order")
    private Set<Product> product = new HashSet<Product>(0);

    public Order() {
    }

    public Order(int id, Fashion fashion, Size size, Size user, State state, Recipe recipe, String gen, String createdate, String enddate, Set<Product> product) {
        this.id = id;
        this.fashion = fashion;
        this.size = size;
        this.user = user;
        this.state = state;
        this.recipe = recipe;
        this.gen = gen;
        this.createdate = createdate;
        this.enddate = enddate;
        this.product = product;
    }

    public Size getUser() {
        return user;
    }

    public void setUser(Size user) {
        this.user = user;
    }

    public String getGen() {
        return gen;
    }

    public void setGen(String gen) {
        this.gen = gen;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Fashion getFashion() {
        return fashion;
    }

    public void setFashion(Fashion fashion) {
        this.fashion = fashion;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

    public Recipe getRecipe() {
        return recipe;
    }

    public void setRecipe(Recipe recipe) {
        this.recipe = recipe;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }

    public Set<Product> getProduct() {
        return product;
    }

    public void setProduct(Set<Product> product) {
        this.product = product;
    }
}
