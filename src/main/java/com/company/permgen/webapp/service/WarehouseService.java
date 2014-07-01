package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.Warehouse;
import com.company.permgen.webapp.repository.WarehouseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 802140 on 01.07.2014.
 */
@Service
public class WarehouseService {
    @Autowired
    protected WarehouseRepository repository;

    public List<Warehouse> getWarehouse() {
        return repository.getWarehouse();
    }
    public void createWarehouse(Warehouse item) {
        repository.createWarehouse(item);
    }
    public void updateWarehouse(Warehouse item) {
        repository.updateWarehouse(item);
    }
    public void changeCount(int newCount,int goodId){repository.changeCount(newCount,goodId);};
}
