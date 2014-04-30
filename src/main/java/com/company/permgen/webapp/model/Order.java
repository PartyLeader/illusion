package com.company.permgen.webapp.model;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 1/19/14
 * Time: 2:18 AM
 * To change this template use File | Settings | File Templates.
 */

import javax.persistence.*;


@Entity
@Table(name = "ORDER2")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(nullable = false)
    private int requestId;

    @Column(nullable = false, length = 255)
    private String worker;

    @Column(nullable = false, length = 255)
    private String good;

    @Column(nullable = false)
    private int countGood;

    @Column(nullable = false, length = 255)
    private String status;

    @Column(nullable = false, length = 255)
    private int user_id;

    @Column(nullable = true, length = 255)
    private String message;

    @Column(nullable = false, length = 255)
    private String priority;

    @Column(nullable = true, length = 255)
    private String createdate;

    @Column(nullable = true, length = 255)
    private String enddate;

    public Order() {
    }

    public Order(int requestId, String worker, String good, int countGood, String status, int user_id, String message, String priority, String createdate, String enddate) {
        this.requestId = requestId;
        this.worker = worker;
        this.good = good;
        this.countGood = countGood;
        this.status = status;
        this.user_id = user_id;
        this.message = message;
        this.priority = priority;
        this.createdate = createdate;
        this.enddate = enddate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public String getWorker() {
        return worker;
    }

    public void setWorker(String worker) {
        this.worker = worker;
    }

    public String getGood() {
        return good;
    }

    public void setGood(String good) {
        this.good = good;
    }

    public int getCountGood() {
        return countGood;
    }

    public void setCountGood(int countGood) {
        this.countGood = countGood;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }
}
