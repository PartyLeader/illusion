package com.company.permgen.webapp.controller;

import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.List;


/**
 * Created with IntelliJ IDEA.
 * User: Ski3fter
 * Date: 22.12.13
 * Time: 23:18
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class UserController {
    @Autowired
    protected UserService service;

    @RequestMapping(value = {"/*", "/users"})
    public String getUsers(Model model) {
        List<User> users = service.getUsers();
        model.addAttribute("users", users);
        return "users";
    }

    @RequestMapping(value = "create-user")
    public String createUserGet(Model model) {
        model.addAttribute("user", new User());
        return "create-user";
    }

    @RequestMapping(value = "create-user", method = RequestMethod.POST)
    public String createUserPost(@ModelAttribute("user") User user) {
        service.createUser(user);
        return "redirect:users";
    }

    @RequestMapping(value = "userfilters")
    public String createUserGetFilters(Model model) {
        model.addAttribute("user", new User());
        return "userfilters";
    }

    @RequestMapping(value ="userfilters", method = RequestMethod.POST)
    public String getUsersFilter(@ModelAttribute("user") User user,Model model) {
        List<User> users = service.getUsers(user.getName());
        model.addAttribute("users", users);
        return "users";
    }
}
