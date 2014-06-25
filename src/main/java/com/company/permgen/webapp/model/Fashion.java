package com.company.permgen.webapp.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Ski3fter on 01.05.14.
 */
@Entity
@Table(name = "FASHION")
public class Fashion {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "FASHION_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "FASHION_NAME", nullable = false, length = 255)
    private String name;

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

    public Fashion(String name) {
        this.name = name;
    }

    public Fashion() {
    }
}
