package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.Request;
import com.company.permgen.webapp.repository.RequestRepository;
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
public class RequestService {

    @Autowired
    protected RequestRepository repository;

    public List<Request> getRequests() {
        return repository.getRequests();
    }

    public void createRequest(Request request) {
        repository.createRequest(request);
    }

    public List<Request> getRequests(String ugrency) {
        return repository.getRequests(ugrency);
    }
    public List<Request> getRequests(int id) {
        return repository.getRequests(id);
    }

    public void removeRequest(int id)
    {
        repository.removeRequest(id);
    }
    public List<String> getUrgency(){
        return repository.getUrgency();
    }

}
