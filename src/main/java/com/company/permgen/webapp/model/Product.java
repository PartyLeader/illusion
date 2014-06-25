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

    @Column(name = "MAGIC_ID", nullable = false)
    private int magic;

    @Column(name = "PRODUCT_FASHION", nullable = false)
    private int fashion;

    @Column(name = "PRODUCT_PERIODUSE",nullable = false)
    private Date periodUse;

    @Column(name = "PRODUCT_FINISHDATE",nullable = false)
    private Date finishDate;

    @Column(name = "PRODUCT_ORDER", nullable = false)
    private int order;

    public Product() {
    }

    public Product(int id, String specification, int magic, int fashion, Date periodUse, Date finishDate, int order) {
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

    public int getMagic() {
        return magic;
    }

    public void setMagic(int magic) {
        this.magic = magic;
    }

    public int getFashion() {
        return fashion;
    }

    public void setFashion(int fashion) {
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

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }
}
