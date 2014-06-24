package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.Order;
import com.company.permgen.webapp.model.Size;
import com.company.permgen.webapp.repository.OrderRepository;
import com.company.permgen.webapp.repository.SizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 6/19/14
 * Time: 12:20 AM
 * To change this template use File | Settings | File Templates.
 */
@Service
public class SizeService {
    @Autowired
    protected SizeRepository repository;

    public List<Size> getSize() {
        return repository.getSize();
    }
    public void createSize(Size size) {
        repository.createSize(size);
    }
    public void updateSize(Size size) {
        repository.updateSize(size);
    }
}
