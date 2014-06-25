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

    @Column(name = "GOOD_GOODTYPE", nullable = false)
    private int type;

    public Good() {
    }

    public Good(int id, String name, boolean quality, int type) {
        this.id = id;
        this.name = name;
        this.quality = quality;
        this.type = type;
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

    public boolean isQuality() {
        return quality;
    }

    public void setQuality(boolean quality) {
        this.quality = quality;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
