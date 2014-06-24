package com.company.permgen.webapp.service;

import com.company.permgen.webapp.model.State;
import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.model.UserAuthorization;
import com.company.permgen.webapp.repository.StateRepository;
import com.company.permgen.webapp.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Ski3fter on 23.06.14.
 */
@Service
public class UsersService {
    @Autowired
    protected UsersRepository repository;

    public List<User> getUsers() {
        return repository.getUsers();
    }
    public void createUsers(User item) {
        repository.createUser(item);
        UserAuthorization userAuthorization = new UserAuthorization(item.getId(),item.getRole());
        repository.createUserAuth(userAuthorization);
    }
    public void updateUsers(User item) {
        repository.updateUser(item);
    }

}
