package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.Image;
import com.company.permgen.webapp.repository.ImageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 6/26/14
 * Time: 12:40 AM
 * To change this template use File | Settings | File Templates.
 */
@Service
public class ImageService {
    @Autowired
    protected ImageRepository repository;

    public List<Image> getImage() {
        return repository.getImage();
    }
    public void createImage(Image item) {
        repository.createImage(item);
    }
    public void updateImage(Image item) {
        repository.updateImage(item);
    }
}
