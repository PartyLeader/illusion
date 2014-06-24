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

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "fashion")
    private Set<Order> order = new HashSet<Order>(0);

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "fashion")
    private Set<Product> product = new HashSet<Product>(0);

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

    public Set<Order> getOrder() {
        return order;
    }

    public void setOrder(Set<Order> order) {
        this.order = order;
    }

    public Set<Product> getProduct() {
        return product;
    }

    public void setProduct(Set<Product> product) {
        this.product = product;
    }

    public Fashion(String name) {
        this.name = name;
    }

    public Fashion() {
    }
}
