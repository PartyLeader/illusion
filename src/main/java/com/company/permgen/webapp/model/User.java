package com.company.permgen.webapp.model;

import javax.persistence.*;
import javax.persistence.criteria.Predicate;
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
@Table(name = "USER_AUTHENTICATION")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "USER_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "USERNAME", nullable = false, length = 255)
    private String name;

    @Column(name = "PASSWORD", nullable = false, length = 255)
    private String password;

    @Column(name = "EMAIL", nullable = false, length = 255)
    private String email;

    @Column(name = "ROLE_ID", nullable = false)
    private int role;


    //  ENABLED BOOLEAN
  @Column(name = "ENABLED")
   private Boolean enabled;


    public User() {
    }

    public User(int id, String name, String password, String email, String role) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.enabled = enabled;
    }

    public User(String name, String password, String email, int role, Boolean enabled) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.role = role;
        this.enabled = enabled;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
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


    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
}
