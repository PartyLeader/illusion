package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Ski3fter
 * Date: 22.12.13
 * Time: 23:20
 * To change this template use File | Settings | File Templates.
 */
@Service
public class UserService {

    @Autowired
    protected UserRepository repository;

    public List<User> getUsers() {
        return repository.getUsers();
    }

    public void createUser(User user) {
        repository.createUser(user);
    }

    public List<User> getUsers(String ugrency) {
        return repository.getUsers(ugrency);
    }
    public List<User> getUsers(int id) {
        return repository.getUsers(id);
    }

    public void removeUser(int id)
    {
        repository.removeUser(id);
    }
    public List<String> getUrgency(){
        return repository.getUrgency();
    }

}
