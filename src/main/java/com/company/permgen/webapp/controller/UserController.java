package com.company.permgen.webapp.controller;

import com.company.permgen.webapp.model.*;
import com.company.permgen.webapp.repository.StateRepository;
import com.company.permgen.webapp.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;
import java.util.List;
import java.util.Random;


/**
 * Created with IntelliJ IDEA.
 * Request: Ski3fter
 * Date: 22.12.13
 * Time: 23:18
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class UserController {
    @Autowired
    protected OrderService orderService;
    @Autowired
    protected SizeService sizeService;
    @Autowired
    protected StateRepository stateService;
    @Autowired
    protected GoodTypeService goodTypeService;
    @Autowired
    protected FashionService fashionService;
    @Autowired
    protected MagicService magicService;
    @Autowired
    protected UsersService usersService;
    @Autowired
    protected RoleService roleService;

    @RequestMapping("/index")
    public String listContacts(Model model) {
        setModel(model);
        return "index";
    }

    @RequestMapping("/controlUsers")
    public String getControlUsers(Model model) {
        model.addAttribute("users", new User());
        model.addAttribute("userslist", usersService.getUsers());
        List<Role> roleList =  roleService.getRole();
        model.addAttribute("rolelist",roleList);

        setModel(model);

        return "controlUsers";
    }
    @RequestMapping(value = "/controlUsers", method = RequestMethod.POST)
    public String createUserPost(@ModelAttribute("users") User item) {
        // Size size = new Size(sizeName);
        item.setEnabled(true);
        usersService.createUsers(item);
        System.out.println(item.getId());
        return "redirect:/controlUsers";
    }

    @RequestMapping("/adminPage")
    public String getAdminPage(Model model) {
        model.addAttribute("good", new Good());

        model.addAttribute("recipe", new Recipe());

        model.addAttribute("magic", new Magic());
       // model.addAttribute("magicList", magicService.getMagic());
        model.addAttribute("fashion", new Fashion());
        model.addAttribute("fashionList", fashionService.getFashion());
        model.addAttribute("goodType", new GoodType());
        model.addAttribute("goodTypeList", goodTypeService.getGoodType());
        model.addAttribute("size", new Size());
        model.addAttribute("sizeList", sizeService.getSize());
        model.addAttribute("state", new State());
        model.addAttribute("stateList", stateService.getState());

        setModel(model);
        return "adminPage";
    }

    @RequestMapping("/first-load")
    public String getFirstLoadPage(Model model) {


        sizeService.createSize(new Size("L"));
        sizeService.createSize(new Size("X"));
        sizeService.createSize(new Size("XL"));
        sizeService.createSize(new Size("XXL"));
        List<Size> list = sizeService.getSize();

        model.addAttribute("sizeName", list.get(0).getName());
        model.addAttribute("sizeList", list);
        setModel(model);
 Role guestRole = new Role("ROLE_ANONYMOUS");
        Role adminRole = new Role("ROLE_ADMIN");
        roleService.createRole(guestRole);
        roleService.createRole(adminRole);
        roleService.createRole(new Role("ROLE_USER"));

        usersService.createUsers(new User("VASIYA","123","123@mail.ru",guestRole.getId(),true));
        usersService.createUsers(new User("admin","123","123@mail.ru",adminRole.getId(),true));
        return "first-load";
    }


    @RequestMapping(value = "/adminPage/size", method = RequestMethod.POST)
    public String createSizePost(@ModelAttribute("size") Size size) {
       // Size size = new Size(sizeName);
        sizeService.createSize(size);
        System.out.println(size.getId());
        return "redirect:/adminPage";
    }
    @RequestMapping(value = "/adminPage/state", method = RequestMethod.POST)
    public String createStatePost(@ModelAttribute("state") State item) {
        // Size size = new Size(sizeName);
        stateService.createState(item);
        System.out.println(item.getId());
        return "redirect:/adminPage";
    }
    @RequestMapping(value = "/adminPage/goodType", method = RequestMethod.POST)
    public String createGoodTypePost(@ModelAttribute("goodType") GoodType item) {
        // Size size = new Size(sizeName);
        goodTypeService.createGoodType(item);
        System.out.println(item.getId());
        return "redirect:/adminPage";
    }
    @RequestMapping(value = "/adminPage/fashion", method = RequestMethod.POST)
    public String createFashionPost(@ModelAttribute("fashion") Fashion item) {
        // Size size = new Size(sizeName);
        fashionService.createFashion(item);
        System.out.println(item.getId());
        return "redirect:/adminPage";
    }
    @RequestMapping(value = "/adminPage/magic", method = RequestMethod.POST)
    public String createFashionPost(@ModelAttribute("magic") Magic item) {
        // Size size = new Size(sizeName);
        magicService.createMagic(item);
        System.out.println(item.getId());
        return "redirect:/adminPage";
    }

    @RequestMapping("/")
    public String home() {
        return "redirect:/index";
    }

    @RequestMapping(value = "/orders")
    public String getOrders(Model model) {
        List<Order> orders = orderService.getOrders();
        model.addAttribute("orders", orders);
        setModel(model);
        return "orders";
    }

    @RequestMapping(value = "create-order")
    public String createRequestGet(Model model) {
        model.addAttribute("order", new Order());
        List<Size> list =     sizeService.getSize();
        model.addAttribute("listSize", list);
        setModel(model);
        return "create-order";
    }

    @RequestMapping(value = "create-order", method = RequestMethod.POST)
    public String createRequestPost(@ModelAttribute("order") Order order) {
        Date date = new Date();
        order.setCreatedate(date.toString());
        orderService.createOrder(order);
        System.out.println(order.getId());
        Random rand = new Random();

        return "redirect:/orders";
    }
//
//    @RequestMapping(value = "requestfilters")
//    public String createRequestGetFilters(Model model) {
//        Request request =new Request();
//        model.addAttribute("request", request);
//        model.addAttribute("listUrgency", requestService.getUrgency());
//        System.out.println(requestService.getUrgency());
//        setModel(model);
//        return "requestfilters";
//    }
//
//    @RequestMapping(value ="requestfilters", method = RequestMethod.POST)
//    public String getRequesrsFilter(@ModelAttribute("request") Request request,Model model) {
//        List<Request> requests = requestService.getRequests(request.getUrgency()) ;
//        model.addAttribute("requests", requests);
//        setModel(model);
//        return "requests";
//    }
//    @RequestMapping("/delete-request/{requestId}")
//    public String deleteRequest(@PathVariable("requestId") int requestId) {
//        requestService.getRequests(requestId);
//        return "redirect:/requests";
//    }
//    @RequestMapping("/order/{requestId}")
//    public String getOrder(@PathVariable("requestId") int requestId,Model model){
//        List<Order> requests = requestService.getRequests((int)requestId) ;
//        model.addAttribute("requests",requests);
//        List<Order> orders = orderService.getOrders(requestId);
//        model.addAttribute("orders",orders);
//        setModel(model);
//        return "order";
//    }

    @RequestMapping("/task/{orderId}")
    public String taskGet(@PathVariable("orderId") int orderId,Model model) {
       List<Order> list =  orderService.getOrder(orderId);
        if (list.size() > 0)
            model.addAttribute("order",list.get(0));
        setModel(model);
        return "task";
    }

    @RequestMapping(value = "task", method = RequestMethod.POST)
    public String taskPost(@ModelAttribute("order") Order order, Model model) {
       // orderService.updateOrder(order);
        System.out.println("createTaskPost");
        return "redirect:/requests";
    }

    private Model setModel(Model model) {
        model.addAttribute("role",SecurityContextHolder.getContext().getAuthentication().getName());
        return model;
    }
}
