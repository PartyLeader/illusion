package com.company.permgen.webapp.controller;

import com.company.permgen.webapp.model.Request;
import com.company.permgen.webapp.model.Order;
import com.company.permgen.webapp.service.OrderService;
import com.company.permgen.webapp.service.RequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.print.attribute.standard.DateTimeAtCompleted;
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
    protected RequestService requestService;

    @Autowired
    protected OrderService orderService;

    @RequestMapping("/index")
    public String listContacts(Model model) {
        setModel(model);
        return "index";
    }

    @RequestMapping("/")
    public String home() {
        return "redirect:/index";
    }

    @RequestMapping(value = "/requests")
    public String getRequests(Model model) {
        List<Request> requests = requestService.getRequests();
        model.addAttribute("requests", requests);
        setModel(model);
        return "requests";
    }

    @RequestMapping(value = "create-request")
    public String createRequestGet(Model model) {
        model.addAttribute("request", new Request());
        setModel(model);
        return "create-request";
    }

    @RequestMapping(value = "create-request", method = RequestMethod.POST)
    public String createRequestPost(@ModelAttribute("request") Request request) {
        requestService.createRequest(request);
        System.out.println(request.getId());
        Random rand = new Random();
        Date date = new Date();
        Date tomorrow = new Date(date.getTime() + (rand.nextInt() * 1000 * 60 * 60 * 24));
        Order order =  new Order(request.getId(), "Сборщик","Крапива",rand.nextInt(5)+1,"Wait",1,"comment1","Обычный",date.toString(),new Date(date.getTime() + (rand.nextInt(5) * 1000 * 60 * 60 * 24)).toString());
        orderService.createOrder(order);
        orderService.createOrder(new Order(request.getId(), "Обработчик","Нитки",rand.nextInt(5),"Wait",1,"comment2","Обычный",date.toString(),new Date(date.getTime() + (rand.nextInt(7) * 1000 * 60 * 60 * 24)).toString()));
        orderService.createOrder(new Order(request.getId(), "Швея","Рубаха",1,"Wait",1,"comment3","Обычный",date.toString(),new Date(date.getTime() + (rand.nextInt(6) * 1000 * 60 * 60 * 24)).toString()));
        orderService.createOrder(new Order(request.getId(), "Маг","Готовое изделие",0,"Wait",1,"comment4","Обычный",date.toString(),new Date(date.getTime() + (rand.nextInt(12) * 1000 * 60 * 60 * 24)).toString()));

        return "redirect:/requests";
    }

    @RequestMapping(value = "requestfilters")
    public String createRequestGetFilters(Model model) {
        Request request =new Request();
        model.addAttribute("request", request);
        model.addAttribute("listUrgency", requestService.getUrgency());
        System.out.println(requestService.getUrgency());
        setModel(model);
        return "requestfilters";
    }

    @RequestMapping(value ="requestfilters", method = RequestMethod.POST)
    public String getRequesrsFilter(@ModelAttribute("request") Request request,Model model) {
        List<Request> requests = requestService.getRequests(request.getUrgency()) ;
        model.addAttribute("requests", requests);
        setModel(model);
        return "requests";
    }
    @RequestMapping("/delete-request/{requestId}")
    public String deleteRequest(@PathVariable("requestId") int requestId) {
        requestService.getRequests(requestId);
        return "redirect:/requests";
    }
    @RequestMapping("/order/{requestId}")
    public String getOrder(@PathVariable("requestId") int requestId,Model model){
        List<Request> requests = requestService.getRequests((int)requestId) ;
        model.addAttribute("requests",requests);
        List<Order> orders = orderService.getOrders(requestId);
        model.addAttribute("orders",orders);
        setModel(model);
        return "order";
    }

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
