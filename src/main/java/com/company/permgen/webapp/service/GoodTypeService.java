package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.GoodType;
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
public class GoodTypeService {

    @Autowired
    protected GoodTypeRepository repository;

    public List<GoodType> getGoodType() {
        return repository.getGoodType();
    }

    public void createGoodType(GoodType goodType) {
        repository.createGoodType(goodType);
    }
    public void updateGoodType(GoodType goodType) {
        repository.updateGoodType(goodType);
    }


}
