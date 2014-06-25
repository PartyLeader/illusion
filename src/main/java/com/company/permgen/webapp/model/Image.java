package com.company.permgen.webapp.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 6/26/14
 * Time: 12:31 AM
 * To change this template use File | Settings | File Templates.
 */

@Entity
@Table(name = "IMAGE")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "IMAGE_ID", unique = true, nullable = false)
    private int id;

    @Column(name = "IMAGE_CAPTION",nullable = false, length = 255)
    private String caption;

    @Column(name = "IMAGE_LINK",nullable = false, length = 255)
    private String link;

    @Column(name = "IMAGE_SLIDER",nullable = false, length = 255)
    private String slider;

    public Image() {
    }

    public Image(String caption, String link, String slider) {
        this.caption = caption;
        this.link = link;
        this.slider = slider;
    }

    public Image(int id, String caption, String link, String slider) {
        this.id = id;
        this.caption = caption;
        this.link = link;
        this.slider = slider;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getSlider() {
        return slider;
    }

    public void setSlider(String slider) {
        this.slider = slider;
    }
}