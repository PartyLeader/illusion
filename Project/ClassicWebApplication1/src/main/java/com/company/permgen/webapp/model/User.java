package com.company.permgen.webapp.model;

import javax.persistence.*;

/**
 * Created with IntelliJ IDEA.
 * User: Ski3fter
 * Date: 22.12.13
 * Time: 23:19
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(nullable = false, length = 255)
    private String gen;

    @Column(nullable = false, length = 255)
    private String name;

    @Column(nullable = false, length = 255)
    private String razmer;

    @Column(nullable = false, length = 255)
    private String srok;

    @Column(nullable = false, length = 255)
    private String fason;

    @Column(nullable = false, length = 255)
    private String simptomi;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGen() {
        return gen;
    }

    public void setGen(String gen) {
        this.gen = gen;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRazmer() {
        return razmer;
    }

    public void setRazmer(String razmer) {
        this.razmer = razmer;
    }

    public String getSrok() {
        return srok;
    }

    public void setSrok(String srok) {
        this.srok = srok;
    }

    public String getFason() {
        return fason;
    }

    public void setFason(String fason) {
        this.fason = fason;
    }

    public String getSimptomi() {
        return simptomi;
    }

    public void setSimptomi(String simptomi) {
        this.simptomi = simptomi;
    }
}