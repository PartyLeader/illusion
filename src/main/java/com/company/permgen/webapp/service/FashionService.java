package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.Fashion;
import com.company.permgen.webapp.model.GoodType;
import com.company.permgen.webapp.repository.FashionRepository;
import com.company.permgen.webapp.repository.GoodTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Request: Ski3fter
 * Date: 22.12.13
 * Time: 23:20
 * To change this template use File | Settings | File Templates.
 */
@Service
public class FashionService {

    @Autowired
    protected FashionRepository repository;

    public List<Fashion> getFashion() {
        return repository.getFashion();
    }

    public void createFashion(Fashion item) {
        repository.createFashion(item);
    }
    public void updateFashion(Fashion item) {
        repository.updateFashion(item);
    }


}
