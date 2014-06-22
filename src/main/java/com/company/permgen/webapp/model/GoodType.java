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

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "type")
    private Set<Good> good = new HashSet<Good>(0);

    public GoodType() {
    }

    public GoodType(String name, int id) {
        this.name = name;
        this.id = id;
    }

    public GoodType(int id, String name, Set<Good> good) {
        this.id = id;
        this.name = name;
        this.good = good;
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

    public Set<Good> getGood() {
        return good;
    }

    public void setGood(Set<Good> good) {
        this.good = good;
    }
}
