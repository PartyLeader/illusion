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

import java.text.SimpleDateFormat;
import java.util.*;


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
    protected RecipeService recipeService;
    @Autowired
    protected ImageService imageService;

    private List<Size> sizeList;
    private List<State> stateList;
    private List<GoodType> goodTypeList;
    private List<Fashion> fashionList;
    private List<Recipe> recipeList;
    private List<Magic> magicList;

    @RequestMapping("/index")
    public String listContacts(Model model) {

        List<Image> imageList = imageService.getImage();
        model.addAttribute("sliderImg", imageList);
        setModel(model);
        return "index";
    }

    @RequestMapping("/adminPage")
    public String getAdminPage(Model model) {

        model.addAttribute("good", new Good());
        model.addAttribute("recipe", new Recipe());
        model.addAttribute("magic", new Magic());
        model.addAttribute("fashion", new Fashion());
        model.addAttribute("goodType", new GoodType());
        model.addAttribute("size", new Size());
        model.addAttribute("state", new State());

        LoadLists();

        model.addAttribute("sizeList", sizeList);
        model.addAttribute("stateList", stateList);
        model.addAttribute("recipeList", recipeList);

        setModel(model);
        return "adminPage";
    }

    @RequestMapping("/first-load")
    public String getFirstLoadPage(Model model) {


        sizeService.createSize(new Size("L"));
        sizeService.createSize(new Size("X"));
        sizeService.createSize(new Size("XL"));
        sizeService.createSize(new Size("XXL"));
        sizeList = sizeService.getSize();

        model.addAttribute("sizeName", sizeList.get(0).getName());
        model.addAttribute("sizeList", sizeList);
        setModel(model);
        List<Fashion> fashionList1 = new ArrayList<Fashion>();
        fashionList1.add(new Fashion("Модная рубаха"));
        fashionList1.add(new Fashion("Мажорная рубаха"));
        fashionList1.add(new Fashion("Прикольная"));
        fashionList1.add(new Fashion("Модная рубаха"));
        fashionList1.add(new Fashion("Модная рубаха"));
        fashionList1.add(new Fashion("Модная рубаха"));
        fashionList1.add(new Fashion("Модная рубаха"));
        fashionList1.add(new Fashion("Модная рубаха"));
        fashionList1.add(new Fashion("Модная рубаха"));

        for(int i =0; i< fashionList1.size();i++)
        {
            fashionService.createFashion(fashionList1.get(i));
            imageService.createImage(new Image(fashionList1.get(i).getName(), i +".jpg","BL" + i));
        }


        stateService.createState(new State("Обычный"));
        stateService.createState(new State("Срочный"));

        recipeService.createRecipe(new Recipe("Алкоголизм", "Алкоголизм лечится рубахой из жестких сортов крапивы"));
        recipeService.createRecipe(new Recipe("Курение", "Никотиновые рубахи. Такой рубахи хватает на 1,5 месяца"));
        recipeService.createRecipe(new Recipe("Простуда", "Теплая рубаха с высоким воротом."));

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
        magicService.createMagic(item);
        System.out.println(item.getId());
        return "redirect:/adminPage";
    }
    @RequestMapping(value = "/adminPage/recipe", method = RequestMethod.POST)
    public String createRecipePost(@ModelAttribute("recipe") Recipe item) {
        // Size size = new Size(sizeName);
        recipeService.createRecipe(item);
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

        LoadLists();
        model.addAttribute("fashionList", fashionList);
        model.addAttribute("sizeList", sizeList);
        model.addAttribute("stateList", stateList);
        model.addAttribute("recipeList", recipeList);

        setModel(model);
        return "create-order";
    }

    @RequestMapping(value = "create-order", method = RequestMethod.POST)
    public String createRequestPost(@ModelAttribute("order") Order order) {
        Date createdate = new Date();
       // Date enddate = new SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH).parse();

        order.setCreatedate(createdate.toString());
        //order.setFashion(fashionList.get(Integer.parseInt(order.getFashion().getName())));
       /// order.setSize(sizeList.get(Integer.parseInt(order.getSize().getName())));
       // order.setState(stateList.get(Integer.parseInt(order.getState().getName())));
        //order.setRecipe(recipeList.get(Integer.parseInt(order.getRecipe().getName())));

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
    private void LoadLists()
    {
        fashionList =   fashionService.getFashion();
        goodTypeList = goodTypeService.getGoodType();
        //    goodList = goodService.getType();
        sizeList =   sizeService.getSize();
        stateList =  stateService.getState();
        recipeList =  recipeService.getRecipe();
     //   magicList =  magicService.getMagic();
    }
}
