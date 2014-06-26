package com.company.permgen.webapp.model;

import javax.persistence.*;

/**
 * Created by Ski3fter on 24.06.14.
 */
@Entity
@Table(name = "ROLE")
public class Role {

    public Role( String role) {
        this.role = role;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ROLE_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "ROLE", nullable = false, length = 255)
    private String role;

    public Role() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
