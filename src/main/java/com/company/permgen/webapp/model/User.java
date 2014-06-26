package com.company.permgen.webapp.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 1/19/14
 * Time: 11:17 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "USER")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "USER_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "USER_NAME", nullable = false, length = 255)
    private String name;

    @Column(name = "USER_PASSWORD", nullable = false, length = 255)
    private String password;

    @Column(name = "USER_EMAIL", nullable = false, length = 255)
    private String email;

    @Column(name = "USER_ROLE", nullable = false, length = 255)
    private String role;

     public User() {
    }

    public User(int id, String name, String password, String email, String role) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.role = role;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
