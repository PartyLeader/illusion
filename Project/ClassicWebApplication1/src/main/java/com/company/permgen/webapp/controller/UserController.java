package com.company.permgen.webapp.controller;

import com.company.permgen.webapp.model.User;
import com.company.permgen.webapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.List;
import java.util.Map;


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

    @RequestMapping("/index")
    public String listContacts(Model model) {
        model.addAttribute("role",SecurityContextHolder.getContext().getAuthentication().getName());
        return "index";
    }

    @RequestMapping("/")
    public String home() {
        return "redirect:/index";
    }

    @RequestMapping(value = "/users")
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
        return "redirect:/users";
    }

    @RequestMapping(value = "userfilters")
    public String createUserGetFilters(Model model) {
        User user =new User();
        model.addAttribute("user", user);
        model.addAttribute("listUrgency",service.getUrgency());
        System.out.println(service.getUrgency());
        return "userfilters";
    }

    @RequestMapping(value ="userfilters", method = RequestMethod.POST)
    public String getUsersFilter(@ModelAttribute("user") User user,Model model) {
        List<User> users = service.getUsers(user.getUrgency());
        model.addAttribute("users", users);
        return "users";
    }
    @RequestMapping("/delete-user/{userId}")
    public String deleteUser(@PathVariable("userId") int userId) {
        service.removeUser(userId);
        return "redirect:/users";
    }
    @RequestMapping("/order/{userId}")
    public String getOrder(@PathVariable("userId") int userId,Model model){
        List<User> users = service.getUsers((int)userId);
        //model.addAttribute("users",users);
        return "users";
    }

}
