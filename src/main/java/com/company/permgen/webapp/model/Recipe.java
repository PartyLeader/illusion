package com.company.permgen.webapp.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Ski3fter on 01.05.14.
 */
@Entity
@Table(name = "RECIPE")
public class Recipe {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "RECIPE_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "RECIPE_NAME", nullable = false, length = 255)
    private String name;

    @Column(name = "RECIPE_SPECIFICATION", nullable = false, length = 255)
    private String specification;

    @Column(name = "RECIPE_GOOD_VA", nullable = false)
    private int goodsVah;

    @Column(name = "RECIPE_COUNT_VA", nullable = false)
    private int countVah;

    @Column(name = "RECIPE_GOOD_HANDLER", nullable = false)
    private int goodsHan;

    @Column(name = "RECIPE_COUNT_HANDLER", nullable = false)
    private int countHan;

    @Column(name = "RECIPE_GOOD_TAILOR", nullable = false)
    private int goodsTai;

    @Column(name = "RECIPE_COUNT_TAILOR", nullable = false)
    private int countTai;

    public Recipe() {
    }

    public Recipe(String name, String specification) {
        this.name = name;
        this.specification = specification;
    }

    public Recipe(String name, String specification, int goodsVah, int countVah, int goodsHan, int countHan, int goodsTai, int countTai) {
        this.name = name;
        this.specification = specification;
        this.goodsVah = goodsVah;
        this.countVah = countVah;
        this.goodsHan = goodsHan;
        this.countHan = countHan;
        this.goodsTai = goodsTai;
        this.countTai = countTai;
    }

    public int getCountVah() {
        return countVah;
    }

    public void setCountVah(int countVah) {
        this.countVah = countVah;
    }

    public int getCountHan() {
        return countHan;
    }

    public void setCountHan(int countHan) {
        this.countHan = countHan;
    }

    public int getCountTai() {
        return countTai;
    }

    public void setCountTai(int countTai) {
        this.countTai = countTai;
    }

    public int getCount() {
        return countVah;
    }

    public void setCount(int countVah) {
        this.countVah = countVah;
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

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public int getGoodsVah() {
        return goodsVah;
    }

    public void setGoodsVah(int goodsVah) {
        this.goodsVah = goodsVah;
    }

    public int getGoodsHan() {
        return goodsHan;
    }

    public void setGoodsHan(int goodsHan) {
        this.goodsHan = goodsHan;
    }

    public int getGoodsTai() {
        return goodsTai;
    }

    public void setGoodsTai(int goodsTai) {
        this.goodsTai = goodsTai;
    }
}
