package com.company.permgen.webapp.model;

import javax.persistence.*;

/**
 * Created by Ski3fter on 24.06.14.
 */
@Entity
@Table(name = "USER_AUTHORIZATION")
public class UserAuthorization {

    public UserAuthorization(int userId, String role) {
        this.userId = userId;
        this.role = role;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "USER_ROLE_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "USER_ID", nullable = false)
    private int userId;

    @Column(name = "ROLE", nullable = false, length = 255)
    private String role;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
