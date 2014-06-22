package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.State;
import com.company.permgen.webapp.repository.StateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: PartyLeader
 * Date: 6/19/14
 * Time: 10:26 AM
 * To change this template use File | Settings | File Templates.
 */
@Service
public class StateService {
    @Autowired
    protected StateRepository repository;
    public List<State> getSize() {
        return repository.getState();
    }
    public void createSize(State item) {
        repository.createState(item);
    }
    public void updateOrder(State item) {
        repository.updateState(item);
    }
}
