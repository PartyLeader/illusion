package com.company.permgen.webapp.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 5/3/14
 * Time: 11:22 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "WAREHOUSE")
public class Warehouse {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "WAREHOUSE_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "WAREHOUSE_NAME",nullable = false, length = 255)
    private String name;

    @Column(name = "WAREHOUSE_GOOD", nullable = false)
    private int good;

    @Column(name = "WAREHOUSE_COUNT",nullable = false)
    private int count;

    public Warehouse() {
    }

    public Warehouse(String name) {
        this.name = name;
    }

    public Warehouse(int id, String name, int good, int count) {
        this.id = id;
        this.name = name;
        this.good = good;
        this.count = count;
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

    public int getGood() {
        return good;
    }

    public void setGood(int good) {
        this.good = good;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
