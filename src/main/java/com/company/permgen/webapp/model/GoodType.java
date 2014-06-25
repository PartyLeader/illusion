package com.company.permgen.webapp.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 5/2/14
 * Time: 11:56 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "GOODTYPE")
public class GoodType {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "GOODTYPE_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "GOODTYPE_NAME", nullable = false, length = 255)
    private String name;


    public GoodType() {
    }

    public GoodType(String name, int id) {
        this.name = name;
        this.id = id;
    }

    public GoodType(String name) {
        this.name = name;
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
}
