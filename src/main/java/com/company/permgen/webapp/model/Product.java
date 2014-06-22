package com.company.permgen.webapp.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 5/8/14
 * Time: 12:42 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "PRODUCT")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "PRODUCT_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "PRODUCT_SPECIFICATION",nullable = false, length = 255)
    private String specification;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MAGIC_ID", nullable = false)
    private Magic magic;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PRODUCT_FASHION", nullable = false)
    private Fashion fashion;

    @Column(name = "PRODUCT_PERIODUSE",nullable = false)
    private Date periodUse;

    @Column(name = "PRODUCT_FINISHDATE",nullable = false)
    private Date finishDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PRODUCT_ORDER", nullable = false)
    private Order order;

    public Product() {
    }

    public Product(int id, String specification, Magic magic, Fashion fashion, Date periodUse, Date finishDate, Order order) {
        this.id = id;
        this.specification = specification;
        this.magic = magic;
        this.fashion = fashion;
        this.periodUse = periodUse;
        this.finishDate = finishDate;
        this.order = order;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public Magic getMagic() {
        return magic;
    }

    public void setMagic(Magic magic) {
        this.magic = magic;
    }

    public Fashion getFashion() {
        return fashion;
    }

    public void setFashion(Fashion fashion) {
        this.fashion = fashion;
    }

    public Date getPeriodUse() {
        return periodUse;
    }

    public void setPeriodUse(Date periodUse) {
        this.periodUse = periodUse;
    }

    public Date getFinishDate() {
        return finishDate;
    }

    public void setFinishDate(Date finishDate) {
        this.finishDate = finishDate;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
