package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.Good;
import com.company.permgen.webapp.repository.GoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 802140 on 01.07.2014.
 */
@Service
public class GoodService {

    @Autowired
    protected GoodRepository repository;

    public List<Good> getGood() {
        return repository.getGood();
    }

    public void createGood(Good goodType) {
        repository.createGood(goodType);
    }
    public void updateGoodType(Good goodType) {
        repository.updateGood(goodType);
    }


}