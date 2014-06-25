package com.company.permgen.webapp.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 5/4/14
 * Time: 12:31 AM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "MAGIC")
public class Magic {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "MAGIC_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "MAGIC_NAME",nullable = false, length = 255)
    private String name;

    @Column(name = "MAGIC_SPECIFICATION",nullable = false, length = 255)
    private String specification;

    public Magic(String name, String specification) {
        this.name = name;
        this.specification = specification;
    }

    public Magic(int id, String name, String specification) {
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

    public Magic() {
    }


}
