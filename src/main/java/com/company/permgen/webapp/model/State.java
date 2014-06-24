package com.company.permgen.webapp.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 5/3/14
 * Time: 12:08 AM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "STATE")
public class State {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "STATE_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "STATE_NAME",nullable = false, length = 255)
    private String name;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "state")
    private Set<Order> order = new HashSet<Order>(0);

    public State() {
    }

    public State(String name) {
        this.name = name;
    }

    public State(String name, int id, Set<Order> order) {
        this.name = name;
        this.id = id;
        this.order = order;
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

    public Set<Order> getOrder() {
        return order;
    }

    public void setOrder(Set<Order> order) {
        this.order = order;
    }
}
