package com.company.permgen.webapp.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 5/8/14
 * Time: 1:21 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "OUTPUT")
public class Output {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "PRODUCT_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "PRODUCT_NAME",nullable = false, length = 255)
    private String name;

    public Output() {
    }

    public Output(int id, String name, Date date) {
        this.id = id;
        this.name = name;
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    private Date date;
}
