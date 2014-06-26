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
@Table(name = "ORDER4")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ORDER_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "ORDER_FASHION", nullable = true)
    private int fashion;

    @Column(name = "ORDER_SIZE", nullable = true)
    private int size;

    @Column(name = "ORDER_USER", nullable = true)
    private int user;

    @Column(name = "ORDER_STATE", nullable = true)
    private int state;

    @Column(name = "ORDER_RECIPE", nullable = true)
    private int recipe;

    @Column(name = "ORDER_GEN",nullable = true, length = 255)
    private String gen;

    @Column(name = "ORDER_CREATEDATE",nullable = true, length = 255)
    private String createdate;

    @Column(name = "ORDER_ENDDATE",nullable = true, length = 255)
    private String enddate;

    public Order() {
    }

    public Order(int id, int fashion, int size, int user, int state, int recipe, String gen, String createdate, String enddate) {
        this.id = id;
        this.fashion = fashion;
        this.size = size;
        this.user = user;
        this.state = state;
        this.recipe = recipe;
        this.gen = gen;
        this.createdate = createdate;
        this.enddate = enddate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFashion() {
        return fashion;
    }

    public void setFashion(int fashion) {
        this.fashion = fashion;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getRecipe() {
        return recipe;
    }

    public void setRecipe(int recipe) {
        this.recipe = recipe;
    }

    public String getGen() {
        return gen;
    }

    public void setGen(String gen) {
        this.gen = gen;
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
}
